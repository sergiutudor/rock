module mongotest;
import vibe.d;

void mongo(HTTPServerRequest req,
	HTTPServerResponse res){
	auto client = connectMongoDB("127.0.0.1");

	auto col = client.getCollection("test.collection");
	col.insert(["name": "Peter"]);

	auto data = "";
	foreach (doc; col.find(["name": "Peter"]))
		data ~= format("<br>Found entry: %s", doc.toJson());

	res.writeBody("mongo<br>"~data, "text/plain");

}