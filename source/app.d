module app;

import vibe.d;
import mongotest;
import modules.user.userController;
import modules.user.userDao;
import modules.user.registration;
import modules.db;
import config;

shared static this()
{
	auto conf = Config.getInstance();


	auto settings = new HTTPServerSettings;
	settings.bindAddresses = ["::1", conf.get("selfIp")];
	settings.port =  conf.get("port").to!ushort;

	auto router = new URLRouter;

	// DB
	auto db = new Mongo(conf);
	db.connect();


	// USER
	auto userD = new UserDAO(db);
	auto reg = new Registration(userD);
	auto userCtrl = new UserController(router, conf, reg);
	userCtrl.registerRoutes();

	router.get("/mongo", &mongoT);
	
	listenHTTP(settings, router);
}
