<body>
<img src=http://s5.postimg.org/r5xhc9ntz/layer1.png align=right>


<h1>Manual</h1>

<h3>Description</h3>
<p>
	I named this program DNDD. Abbreviation for discussion & democratic decision making.
DNDD is a Mysql client program. DNDD is also a bulletin board program focused on decision making procedure.
You can use DNDD as a normal bulletin board or as a platform for some group of people to discuss some 
serious matters and decide what to do. Because DNDD have innate ability to vote and calculate votes, you can
use it for class chief election or board meeting. 	
</p>
<h3>Install</h3>
<p>
	First you should acquire a Mysql account capable of creating tables on a designated database. Then you should run
	<b>install.sql</b> query file with that account. Normally you will have tables of Notice, Board, Sample, Users, Follow, Vote.
	And it will create a Mysql account of 'dndd' with select and insert previlige. Client program DNDD will use this account 
	as default. Users, Follow, Vote tables are for inside management. So, you should not touch these tables unless you are sure 
	of what you are doing. The others are Bulletin boards. You can change the access privilege to tables to confine user to 
	specific boards. In example Notice board is only allowed to select by dndd account, Sample, Board boards are allowed to select,
	insert.
</p>

<!--<img src=http://s5.postimg.org/hui9ue0vb/ID_10025260.jpg align=right>-->
<h3>Database table structure</h3>
DnDD use 3 tables to manage. Users, Vote, Follow. All other tables in the designated database will be considered Board tables. You can see the table structure in install.sql.

<h3>Dependency</h3>
<img src=http://s5.postimg.org/9dirjgw6f/ID_10037668.jpg align=right>
webkit 1.0<br>
gtkmm 2.4<br>
Mysql C++ connector <br>

<h3>User levels</h3>
There are 6 user levels.
<ul>
  <li>root</li>
  <li>senior</li>
  <li>representative</li>
  <li>regular</li>
  <li>registered</li>
  <li>anonymous</li>
</ul>
A user without an account is anonymous level. When user has made an account, he automatically gets registered level. Higher than registered levels are only given by the Mysql administrator.(by editing Users table.) 
<br>Senior & representative level is somewhat like assembly member or board member. They can vote and earn followers who will follow their opinion when they are not sure or busy doing their own jobs.
<br>regular & registered level is normal multitude level. They can follow representatives or vote by themselves.
<br>Anonymous level can only read. Root level is reserved. Someone who do not want to follow anybody can follow root. Just make sure Root will not vote.

<h3>Bulletin board</h3>
<p>
	DNDD have a little bit different bulletin system from usuals. 
Bulletin for some topic -> Book -> Page. 
<br>ie)Biology field -> Should we reserve Nature? -> 1.I oppose. 2.I agree.<br>
You can make any category of board by making a table in Mysql. And like other programs you create 
posts inside that category. But this post is like a book. So it can have pages of discussion. And you can control
who can write main article and who can vote and attach comments book by book. 
By controling these options you can optimize the post as a QNA or platform for discussion or even as a real html 
book.
</p>

<h3>Follow system & open vote</h3>
<p>
	DnDD devised some simple ideas to nullify the danger of fraudulent election and to adopt more direct democracy.
Even in small size of election such as class president election, these features are needed, because of the 
vulnerability of computer network.
The idea is no other than to open some vote of people who want to. Another is to follow one representative like 
twitter and to enable changing the follow at anytime. The follower then follows the representative's decision when
he did not vote. If the follower himself votes, his own vote is always prior to the representative's.
DNDD has user levels divided in 6 groups. Anonymous, registered, regular, representative, senior, root.
Representative and senior is intended for the representing level while registered and regular is for normal level.
Because there are only two levels for each, you should not abuse the level.
</p>

<h3>Voting procedure</h3>
<i><b>Discussion & Vote -> Final notify -> Final result.</b></i>
<br>
While discussion is going on everybody can vote. To make sure which representative has voted for what, there is an intermediate step called final notify. This is an announcement session. After this point, representatives cannot vote or change his opinion. 
Voting can be made secret or open. For statistical reason, when a portion of votes are opened there can be no fraud. Also follow can be secret or open. Representatives cannot follow neither vote secretly.
<br>If you want to change the rules of voting. If you would rather have no representatives or have only some inner circle member vote, you can do that by changing the post option and giving users levels carefully. You can give Inner circle members regular level.
<p>
	In normal cases, Representative levels can post main article debating about some matters. Normal 
level users can vote, attach comments or follow representatives. (In this case, you should set the option
read=anonymous, write=representative, comment=registered, vote=registered or regular)
When the discussion is done, the finalize process takes two steps. First, final notify. This stage is for notifying 
everyone that the vote is going to close and which representative has voted for what. So representatives cannot
change their vote after final notify. But normal level users can change or vote. 
	And after predestined period final result is calculated. Finalize menu is only available to the user who created the post.
	
</p>

<h3>Navigation</h3>

<img src=http://s5.postimg.org/gfykhpzvr/comment.png>
<p text-indent=20px>You can navigate using right side panel. It is also used as a comment area. 
By clicking login information you can change user information.<br>
By clicking the '>' button on the right side you can navigate the system. When the Bulletin depth level is 3,
you can follow or edit with this button.</p>  

<br>
<h3>Toolbar</h3>
<img src=http://s5.postimg.org/4s4in6aqv/toolbar.png width=100%>
<p>
Toolbar is composed of 4 parts. The first is message area. It displays some messages. 
<br>The next is page movement to goto a certain page. 
<br>The next is write area to add page, post, comments.
<br>Last is voting area to vote, follow, calculate votes.
<br>Tool buttons are enabled when the function is possible. If you want to add a page, you have to meet the level requirement and be at the last page. 
</p>

<h3>Command line parameter & notice board</h3>
<p>
  DnDD can have command line parameter.<br>
  <p align=center><i>prompt$ dndd  [username]  [password]</i><br></p>
  Using no parameter, DnDD use default Mysql user account 'dndd' with only select, insert privilege. No update is used internally for security reason. But some board tables which is intended to be written by administrators are only selectable and not possible to be inserted.
  If you want to write to a restricted table like these (ex.Notice), you have to login with other Mysql user, root or some user with more privilege. This can be done with command line parameters. Like above.
  You can also change the user dndd's accessibility of tables to control each table. Don't confuse DnDD login id with Mysql login id. DnDD login ID is registered in Users table and used inside of program. 
  Mentioned here is Mysql ID.    
</p>



</body>
