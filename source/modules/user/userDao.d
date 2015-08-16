module modules.user.userDao;

import modules.db;
import vibe.d;

class UserDAO
{
	private Mongo db;
	private MongoCollection collection;
	enum collectionName = "users";

	this(Mongo client)
	{
		db = client;
		collection = db.client.getCollection(db.db~"."~collectionName);
	}

	void insert(Json user){
		collection.insert(user);
	}
}

