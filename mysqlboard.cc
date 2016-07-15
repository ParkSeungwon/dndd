/*
 * mysqlboard.cc
 * This file is part of dndd
 *
 * Copyright (C) 2015 - Seungwon Park
 *
 * dndd is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * dndd is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with dndd. If not, see <http://www.gnu.org/licenses/>.
 */

 
#include <cppconn/connection.h>
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
#include <cppconn/prepared_statement.h>
using namespace std;
#include "member.h"
#include "comment.h"
#include "mysqlquery.h"
#include "mysqlboard.h"
#include "util.h"

bool Mysqlboard::write(char option) //f,e만 유의
{
	if(option != 'f') {
		if(title == "Final notify." || title == "Final result.") title += ".";
	} else if(title == "Final notify.") {
		title = "Final result.";
	} else title = "Final notify.";
	if(option == 'f' || option == 'a') page++;//add page
	title = addBackSlash(title);
	text = addBackSlash(text);
	string str = "insert into " + field + " values (";
	str += Util::itos(number) + ", ";
	str += Util::itos(page) + ", '";
	str += getId() + "', '";
	str += title + "', '";
	str += text + "', ";
	if(option == 'e') str += "'" + getDate() + "', null);";
	else str += "now(), null);";
	//cout << str << endl;
	return myQuery(str);
}
string Mysqlboard::getTOC(string _field, int _num)
{
	setPage(_field, _num, 0);
	read();
	string s = "<h2>Level requirements & Voting options</h2>\n\nLevel higher than or equal to ";
	s += Util::Ltos(getRead());
	s += " can read this post.<br />\nLevel higher than or equal to ";
    s += Util::Ltos(getWrite()) + " can write pages to this post.<br />\n";
    s += "Level higher than or equal to " + Util::Ltos(getComment());
	s += " can attach comments to this post.<br />\nLevel higher than or equal to ";
    s += Util::Ltos(getVote()) + " can vote to this post.<br /><br>\n\n";
    s += "This post has " + Util::itos(getVotingOption()) + " voting options<br /><br />\n\n";
	
	select(_field, "where num = " + Util::itos(_num) + " order by page, date, edit desc");
	group_by("page");
//    string query = "select page, title from (select * from " + field;
//    query += " order by date, edit desc) as my_table_tmp";
//    query += " where num = " + Util::itos(number);
//    query += " group by page;";
//    myQuery(query);
    string toc = "\n<h2>Table of Contents</h2>\n\n";
    for(auto& a : contents) {
        toc += a[1] + ". ";
        toc += a[3] + "<br />\n";
    }
    return s + toc;
}

void Mysqlboard::read()
{
	if(ri < contents.size()) {
		if(field == "") {
			setText(contents[ri][0]);
		} else {
			setNumber(stoi(contents[ri][0]));//res->getInt("num"));
			setTitle(contents[ri][3]);//res->getString("title"));
			setId (contents[ri][2]);//res->getString("email") );
			setText (contents[ri][4]);//res->getString("contents") );
			setDate (contents[ri][5]);//res->getString("date"));
            setPages(stoi(contents[ri][1]));//res->getInt("page"));
		}
        //show();
		ri++;
	}
}

size_t Mysqlboard::setPage(string _field, int _num, int _page)
{
	field = _field;
	number = _num;
    page = _page;
    string query;
	ri = 0;
    
	if(field == "") {
		query = "show tables;";//field
		myQuery(query);
		contents.clear();
		while(res->next()) contents.push_back({res->getString(1)});
		return contents.size();
	} else if(_num == -1) {//목록
		select(field, "where page = 0 order by num, date");
		return group_by("num");
//		query = "select * from (select * from " + field;
//		query += " order by date) as my_table_tmp";
//		query += " group by num order by num;";
	} else if(_page == -1) {//페이지수
		query = "select max(page) from " + field + " where num = " + Util::itos(number);
		myQuery(query);
		res->next();
		return res->getInt(1);
       // query = "select * from (select * from " + field;
     //   query += " order by date, edit desc) as my_table_tmp";
	//	query += " where num = " + Util::itos(number);
	//	query += " group by page;";
    } else {//일반적인 경우
		select(field, "where num = " + Util::itos(number) + " and page = " + Util::itos(page) + " order by date, edit desc");
		return group_by("date");
//        query = "select * from (";
//		query += "select * from " + field;
//		query += " where num = " + Util::itos(number);
//		query += " and page = " + Util::itos(page);
//		query += " order by date, edit desc)";
//       query += " as my_table_tmp group by date, email;";
	} 
	//cout << query << endl;
//	myQuery(query);
  //  return res->rowsCount();
}

void Mysqlboard::showtables() {
	string query = "show tables;";
	myQuery(query);
}

string Mysqlboard::addBackSlash(string s) {
    int apo, i=0;
    while((apo = s.find_first_of('\'', i)) < s.length()) {
        if(s[apo-1] != '\\') {
            s.insert(apo, 1, '\\');
            i = apo + 2;
        } else i = apo + 1;
    }
    return s;
}

