module modules.db;

import vibe.d;
import config;

class Mongo
{
	public MongoClient client;
	private Config conf;

	this(Config configuration)
	{
		conf = configuration;
	}

	public void connect(){
		client = connectMongoDB(conf.get("mongoServer"));
	}

	public string db(){
		return conf["mongoDB"];
	}
}

