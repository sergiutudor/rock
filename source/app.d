/*
 * import std.stdio;

void main()
{
	writeln("Edit source/app.d to start your project.");
}
*/



import vibe.d;
import mongotest;
import userController;

shared static this()
{
	auto settings = new HTTPServerSettings;
	settings.bindAddresses = ["::1", "127.0.0.1"];
	settings.port = 8080;

	auto router = new URLRouter;
	router.get("/", &index);


	new userController(router);
	router.get("/mongo", &mongo);
	
	listenHTTP(settings, router);
}

void index(HTTPServerRequest req,
	HTTPServerResponse res)
{
		res.writeBody("Hello, World! index", "text/plain");
}
