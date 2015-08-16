module modules.user.registration;

import modules.user.userDao;
import vibe.d;

class Registration
{
	private UserDAO dao;

	this(UserDAO Dao)
	{
		dao = Dao;
	}

	public void register(Json user){
		dao.insert(user);
	}
}

