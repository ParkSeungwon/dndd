#include <cppconn/connection.h>
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
#include <cppconn/prepared_statement.h>
using namespace std;
#include "member.h"
#include "mysqlquery.h"
#include "mysqlmember.h"
#include "util.h"

void MysqlMember::write() 
{
	string query = "insert into Users values('";
	query += email + "', password('";
	query += password + "'), ";
	query += Util::itos(level) + ", '";
	query += name + "', '";
	query += tel + "', now());";
	
	myQuery(query);
}

bool MysqlMember::read(string _id) 
{
	string query = "select * from Users where email = '";
	query += _id + "';";
	myQuery(query);
	if(res->next()) {
        email = _id;
        password = res->getString("password");
        level = (Level)res->getInt("level");
        name = res->getString("name");
        tel = res->getString("tel");
        //follow = res->getString("follow");
        return true;
    }
    else return false;
}

bool MysqlMember::login(string user, string pass)
{
	string p = encrypt(pass);//use query cautios.!!
    string query = "select * from Users where email = '";
    query += user + "' order by date desc limit 1" ;
    myQuery(query);
	res->next();
    if(res->getString("password") == p) {
        email = res->getString("email");
        password = res->getString("password");
        level = Util::itoL(res->getInt("level"));
        name = res->getString("name");
        tel = res->getString("tel");
        //follow = res->getString("follow");
        query = "select email from Follow where follower = '";
        query += email + "' order by date desc limit 1;";
        if(myQuery(query) && res->next()) follow = res->getString("email");
        return true;
    } else {
        email = "anony@anony";
        level = anonymous;
        name = "anonymous";
        password = "anony";
        return false;
    }
}

bool MysqlMember::exist(string _email)
{//almost same as read
	string query = "select email from Users where email = '";
	query += _email + "';";
	myQuery(query);
	if(res->next()) return true;
	else return false;
}

bool MysqlMember::writeFollow(string email, string follower, bool secret)
{
    string query = "insert into Follow values('";
    query += email + "', '" + follower + "', " + Util::itos(secret) + ", now());";
    std::cout << query << std::endl;
    if(myQuery(query)) {
        follow = email;//return
        return true;
    }
    else return false;
}
