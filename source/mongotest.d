module mongotest;
import vibe.d;

void mongoT(HTTPServerRequest req,
	HTTPServerResponse res){
	auto client = connectMongoDB("127.0.0.1");

	auto col = client.getCollection("rock.users");
	//col.insert(["name": "Peter"]);

	auto data = "";
	foreach (doc; col.find(["username": "sergiu"]))
		data ~= format("<br>Found entry: %s", doc.toJson());

	res.writeBody("mongo<br>"~data, "text/plain");

}