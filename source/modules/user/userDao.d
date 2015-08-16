module modules.user.userDao;

import modules.db;
import vibe.d;

class userDao
{
	private mongo db;
	private MongoCollection collection;
	protected string collectionName = "users";

	this(mongo client)
	{
		db = client;
		collection = db.client.getCollection(db.db~"."~collectionName);
	}

	void insert(Json user){
		collection.insert(user);
	}
}

