/*
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| email    | char(30)    | NO   |     | NULL    |       |
| password | char(45)    | YES  |     | NULL    |       |
| level    | tinyint(4)  | YES  |     | NULL    |       |
| name     | varchar(45) | YES  |     | NULL    |       |
| tel      | varchar(20) | YES  |     | NULL    |       |
| date     | datetime    | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
*/
#pragma once
#include"mysqldata.h"
class MysqlMember : public Member, public SqlQuery
{
 public:
	bool read(string _id);//email주소를 아이디로 사용함.
	void write();
	bool exist(string _email);
    bool login(string user, string pass);
    bool writeFollow(string email, string follower, bool secret);
};


