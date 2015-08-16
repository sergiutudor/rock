module controlers;

import vibe.d;
import config;

abstract class AbstractController
{
	protected Config conf;
	protected URLRouter router;

	this(URLRouter Prouter, Config configuration)
	{
		conf = configuration;
		router = Prouter;
	}

	public abstract void registerRoutes();
	
	void emptyRespose(HTTPServerRequest req,
		HTTPServerResponse res){

		prepareResponse(res);
		res.writeBody("{}", "application/json");
	}

	protected void prepareResponse(HTTPServerResponse res){
		res.headers["Access-Control-Allow-Origin"] = conf.get("allowCrossDomain");
		res.headers["Access-Control-Allow-Headers"] = "content-type";
	}
    
}

