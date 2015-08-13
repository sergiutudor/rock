module userController;

import vibe.d;

class userController
{
	this(URLRouter router)
	{

		router.get("/user/*", &getUser);
		router.post("/user/", &registerUser);
	}

	void getUser(HTTPServerRequest req,
		HTTPServerResponse res){
		res.writeBody(req.path, "text/plain");
	}


	
	void registerUser(HTTPServerRequest req,
		HTTPServerResponse res){
		res.writeBody(req.json, "text/plain");
	}
}

