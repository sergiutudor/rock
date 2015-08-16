module modules.db;

import vibe.d;
import config;

class mongo
{
	public MongoClient client;
	private config conf;

	this(config configuration)
	{
		conf = configuration;
	}

	public void connect(){
		client = connectMongoDB(conf.data["mongoServer"]);
	}

	public string db(){
		return conf.data["mongoDB"];
	}
}

