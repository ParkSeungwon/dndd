#pragma once
#include <stdexcept>
#include <cppconn/connection.h>
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
#include <cppconn/prepared_statement.h>

class Mysqlquery 
{
private:
    sql::Driver *driver;
    sql::Connection *con;
    sql::Statement *stmt;

protected:
	sql::ResultSet *res;
	std::string encrypt(std::string);
	std::string now();
    bool myQuery(string str);

public:
    bool connect(string host, string user, string pass, string db);
    void connect(Mysqlquery& copy);
    Mysqlquery();
    ~Mysqlquery();
};
