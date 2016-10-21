class Vote
{
 protected:
	string field;
	int number;
	string votingId;
	int votedFor;
	bool secret;
	int level;

 public:
	Vote() {}
	void setVote(string field, int number, string votingId, int votedFor, bool secret, int vote);
	void show();
};

