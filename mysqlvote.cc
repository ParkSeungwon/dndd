#include <cppconn/connection.h>
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
#include <cppconn/prepared_statement.h>
using namespace std;
#include "member.h"
#include "mysqlquery.h"
#include "util.h"
#include "vote.h"
#include "mysqldata.h"
#include "mysqlvote.h"

void MysqlVote::write()
{
	string query = "insert into Vote values ('";
	query += field + "', ";
	query += Util::itos(number) + ", '";
	query += votingId + "', ";
	query += Util::itos(votedFor) + ", ";
	query += Util::itos(secret) + ", now(), " + Util::itos(level) + ");";
	cout << query << endl;
	myQuery(query);
}

int MysqlVote::findMan(VoteResult *vr, int count, string email, int start) 
{
	for(int i = start; i<count; i++) {
		if(vr[i].email == email) return i;
	}
	return count;
}

int MysqlVote::findMan(FollowTable *vr, int count, string email, int start)
{
	for(int i = start; i<count; i++) {
		if(vr[i].email == email) return i;
	}
	return count;
}

string MysqlVote::calculateVoteHtml(string _field, int _number, int option)
{
	long vOption[option+1][2];
	for (int m = 0; m <= option; m++) {
		vOption[m][0] = 0;
		vOption[m][1] = 0;
	}

	select("Vote", "where level>2 and field = '" + _field + "' and num = " + 
			Util::itos(_number) + " order by email, date desc");
	
	int cRep = group_by("email");
	VoteResult vrRepresent[cRep];
	int i = 0;
	for(auto& a : contents) {
		vrRepresent[i].email = (string)a[2];
		vrRepresent[i].name = (string)a[2];
		vrRepresent[i].votedfor = a[3];
		vrRepresent[i].date = (string)a[5];
		vrRepresent[i].secret = false;
		i++;
	}

	select("Follow", "order by follower, date desc");
	int cFT  = group_by("follower");//res->rowsCount();
	FollowTable fTable[cFT];
	i = 0;
	for(auto& a : contents) {
		fTable[i].email = (string)a[0];//res->getString("email");
		fTable[i].follower = (string)a[1];//res->getString("follower");
		fTable[i].secret = (int)a[2];//res->getInt("secret");
		i++;
	}

	select("Vote", "where level < 3 and field = '" + _field + "' and num = " + 
			Util::itos(_number) + " order by email, date desc");
	int cReg = group_by("email");//res->rowsCount();
	VoteResult vrRegistered[cReg];
	i = 0;
	for(auto& a : contents) {
		vrRegistered[i].email = (string)a[2];//res->getString("email");
		vrRegistered[i].name = (string)a[2];//res->getString("name");
		vrRegistered[i].votedfor = (int)a[3];//res->getInt("votedfor");
		vrRegistered[i].date = (string)a[5];//res->getString("date");
		vrRegistered[i].secret = (int)a[4];//res->getInt("secret");
		i++;
	}
	
	
	string result = "<div style=\"text-align: center\"><br /><h1>Votes by representatives & followers</h1><br />";
	result += "<table style = \"width:100%\" border = \"1\"><tr><td>email</td><td>name</td><td>votedfor</td><td>date</td></tr>";
	int j = 0, k = 0;
	for (i = 0; i < cRep; i++) {//Representatives
		result += "<tr bgcolor=\"grey\"><th>" + vrRepresent[i].email;
		result += "</th><th>" + vrRepresent[i].name + "</th><th>";
		result += Util::itos(vrRepresent[i].votedfor) + "</th><th>";
		result += vrRepresent[i].date + "</th></tr>";
		vOption[vrRepresent[i].votedfor][vrRepresent[i].secret]++;
		for(j = 0; j < cFT; j++) {//follower
			j = findMan(fTable, cFT, vrRepresent[i].email, j);
			if(j != cFT) {//representative have follower
				if(fTable[j].secret == 0) {//follow publicly
					result += "<tr><td>followers :</td><td>";
					result += fTable[j].follower + "</td><td>";
					k = findMan(vrRegistered, cReg, fTable[j].follower, 0);
					if(k != cReg) {//follower himself voted
						if(vrRegistered[k].secret == 0) //follower vote publicly
							result += Util::itos(vrRegistered[k].votedfor) +"</td>";
						else result += "?</td>";
						vOption[vrRegistered[k].votedfor][vrRegistered[k].secret]++;
						vrRegistered[k].votedfor = 0;//mark calculated vote
					}
					else {//no vote->follow secret 
						result += "=</td>";
						vOption[vrRepresent[i].votedfor][fTable[j].secret]++;
					}
					result += "<td></td></tr>";
				}
			}
		}
	}
	result += "</table></div><br /><div style=\"text-align: center\"><br /><hr><h1>Votes by registered</h1><br />";
	for(i = 0; i < cReg; i++ ) {
		if(vrRegistered[i].votedfor != 0) {
			if(vrRegistered[i].secret == 0) {
				result += vrRegistered[i].email + "(";
				result += Util::itos(vrRegistered[i].votedfor) + ") ";
				//if(i%5 == 4) result += "<br />";
			}
			vOption[vrRegistered[i].votedfor][vrRegistered[i].secret]++;
		}
	}

	result += "</div><br />";

	string table = "<!DOCTYPE html><div style=\"text-align: center\"><br /><h1>Total voting calculation</h1><br />";
	table += "<table style = \"width:100%\" border = \"1\"><tr><th></th><th>Open vote</th><th>private vote</th><th>total</th><th>win%</th></tr>";
	long total_vote = 0;
	for(i = 1; i <= option; i++) total_vote += vOption[i][0] + vOption[i][1];
	if(total_vote == 0) return "No vote was performed";
	for (i = 1; i <= option; i++) {
		table += "<tr><th>option" + Util::itos(i) +"</th><td>"+ Util::itos(vOption[i][0]);
		table += "</td><td>" + Util::itos(vOption[i][1]) + "</td><td>";
		table += Util::itos(vOption[i][0] + vOption[i][1]) + "</td><td>";
		table += Util::itos( (vOption[i][0] + vOption[i][1])*100/total_vote) + "%</td></tr>";
	}
	table += "</table></div><br />";
	
	string graph = "<div style=text-align:right><font size=2 color=white>";
	for(i = 1; i<=option; i++) {
		graph += "<table border=0 bgcolor=teal width=";
		graph += Util::itos(vOption[i][0]*100/total_vote) + "%><tr><td>";
		if(vOption[i][0]*100/total_vote > 20) 
			graph += "option" + Util::itos(i) + " open vote: ";
		graph += Util::itos(vOption[i][0]);
		graph += "</td></tr></table><table border=0 bgcolor=blue width=";
		graph += Util::itos((vOption[i][1]+vOption[i][0])*100/total_vote) + "%><tr><td>";
		if((vOption[i][1]+vOption[i][0])*100/total_vote > 20) 
			graph += "option" + Util::itos(i) + " total vote: ";
		graph += Util::itos(vOption[i][1]+vOption[i][0]) + "</td></tr></table><br />";
	}
	graph += "</font></div>";
	
	return table + graph +"<hr>"+ result;
}
