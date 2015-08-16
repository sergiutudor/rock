module modules.user.userController;

import controlers;
import vibe.d;
import config;
import std.stdio;
import std.utf;
import modules.user.registration;

import std.encoding;

class UserController : AbstractController
{
	Registration registrationService;

	this(URLRouter router, Config configuration, Registration reg)
	{
		super(router, configuration);

		registrationService = reg;
	}

	public override void registerRoutes(){
        
		router.get("/user/*", &getUser);
		router.post("/user/", &registerUser);
        router.any("*", &emptyRespose);
	}

	void getUser(HTTPServerRequest req,
		HTTPServerResponse res){

		prepareResponse(res);
		res.writeBody(req.path, "application/json");
	}


	
	void registerUser(HTTPServerRequest req,
		HTTPServerResponse res){

		try{
			registrationService.register(req.json);

			prepareResponse(res);
			res.writeBody(req.json.toString, "application/json");

		}
		catch (Exception e){
			logInfo(e.msg);
		}
	}
}

