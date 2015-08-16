module modules.user.userController;

import controlers;
import vibe.d;
import config;
import std.stdio;
import std.utf;
import modules.user.registration;

import std.encoding;

class userController : abstractController
{
	registration registrationService;

	this(URLRouter router, config configuration, registration reg)
	{
		super(router, configuration);

		registrationService = reg;
	}

	public override void register(){
		router.get("/user/*", &getUser);
		router.post("/user/", &registerUser);
	}

	void getUser(HTTPServerRequest req,
		HTTPServerResponse res){

		prepareResponse(res);
		res.writeBody(req.path, "application/json");
	}


	
	void registerUser(HTTPServerRequest req,
		HTTPServerResponse res){

		try{
		prepareResponse(res);

			writeln(req.json.toString);


			registrationService.register(req.json);

		//res.writeBody(str, "application/json");
		res.writeBody("{\"tads\":\"haha\"}", "application/json");

		}
		catch (Exception e){
			writeln(e.msg);
		}
	}
}

