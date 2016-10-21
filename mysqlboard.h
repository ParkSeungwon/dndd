/*
+----------+--------------+------+-----+---------------------+----------------+
| Field    | Type         | Null | Key | Default             | Extra          |
+----------+--------------+------+-----+---------------------+----------------+
| num      | int(11)      | NO   |     | NULL                |                |
| page     | int(11)      | YES  |     | NULL                |                |
| email    | char(30)     | NO   | PRI | NULL                |                |
| title    | char(100)    | YES  |     | NULL                |                |
| contents | longtext     | YES  |     | NULL                |                |
| date     | datetime     | NO   | PRI | 0000-00-00 00:00:00 |                |
| edit     | mediumint(9) | NO   | PRI | NULL                | auto_increment |
+----------+--------------+------+-----+---------------------+----------------+
*/
#include"mysqldata.h"
class Mysqlboard : public Board, public SqlQuery
{
private:
	string addBackSlash(string s);
	int ri = 0;
protected:
	int totalCommentCount;
	
public:
	size_t setPage(string _field, int _num, int _page);
	void read();//같은 페이지 내에서의 텍스트와 댓글을 차례로 멤버변수에 읽어들인다. read() 이후에 쓰고, show()와 짝으로 쓰인다.
	bool write(char o);	//현재의 멤버변수들을 모두 데이터베이스에 써넣음.
    int getTotalCommentCount() {return totalCommentCount;}
    void showtables();
    string getTOC(string field, int num);
};
