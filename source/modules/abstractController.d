module controlers;

import vibe.d;
import config;

abstract class abstractController
{
	protected config conf;
	protected URLRouter router;

	this(URLRouter Prouter, config configuration)
	{
		conf = configuration;
		router = Prouter;
	}

	public void registerGeneric(){
		router.any("*", &emptyRespose);
	}

	public abstract void register();
	
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

