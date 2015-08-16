module config;

class config
{
	public static enum data = [
		"allowCrossDomain" : "http://localhost:8383",
		"port" : "8080",
		"selfIp" : "127.0.0.1",
		"mongoServer":"127.0.0.1",
		"mongoDB":"rock"
	];

	string get(string var){
		return data[var];
	}

}

