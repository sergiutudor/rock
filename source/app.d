/*
 * import std.stdio;

void main()
{
	writeln("Edit source/app.d to start your project.");
}
*/



import vibe.d;
import mongotest;
import modules.user.userController;
import modules.user.userDao;
import modules.user.registration;
import modules.db;
import config;

shared static this()
{
	auto conf = new config;

	auto settings = new HTTPServerSettings;
	settings.bindAddresses = ["::1", conf.data["selfIp"]];
	settings.port = to!ushort(conf.data["port"]);

	auto router = new URLRouter;


	// DB
	auto db = new mongo(conf);
	db.connect();


	// USER
	auto userD = new userDao(db);
	auto reg = new registration(userD);
	auto userCtrl = new userController(router, conf, reg);
	userCtrl.register();




	router.get("/mongo", &mongoT);

	userCtrl.registerGeneric();
	
	listenHTTP(settings, router);
}
