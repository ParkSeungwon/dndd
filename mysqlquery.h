class Mysqlquery 
{
private:
    sql::Driver *driver;
    sql::Connection *con;
    sql::Statement *stmt;

protected:
	sql::ResultSet *res;
    bool myQuery(string str);

public:
    bool connect(string host, string user, string pass, string db);
    void connect(Mysqlquery& copy);
    Mysqlquery();
    ~Mysqlquery();
};
