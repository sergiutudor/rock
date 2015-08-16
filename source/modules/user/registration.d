module modules.user.registration;

import modules.user.userDao;
import vibe.d;

class registration
{
	private userDao dao;

	this(userDao Dao)
	{
		dao = Dao;
	}

	public void register(Json user){
		dao.insert(user);
	}
}

