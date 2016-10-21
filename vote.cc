#include <iostream>
using namespace std;
#include "vote.h"

void Vote::setVote(string _field, int _number, string _votingId, int _votedFor, bool _secret, int _level)
{
	field = _field;
	number = _number;
	votingId = _votingId;
	votedFor = _votedFor;
	secret = _secret;
	level = _level;
}

void Vote::show()
{
	cout << field << endl;
	cout << "게시물번호 : " << number << endl;
	cout << votingId << endl;
	cout << "기호 : " << votedFor << endl;
	cout << "공개여부 : " << secret << endl;
}
