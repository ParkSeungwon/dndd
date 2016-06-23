CC = g++
INC = -I/usr/local/include
LIB = -L/usr/local/lib -L/usr/lib 
OBJ = comment.o member.o mysqlboard.o util.o mysqlquery.o mysqlmember.o mysqlvote.o vote.o mainform.o conndata.o join.o newbook.o follow.o votepopup.o commentpopup.o main.o

gtkmmCFLAG = $(shell pkg-config gtkmm-2.4 --cflags) -std=c++11
gtkmmLIB = $(shell pkg-config gtkmm-2.4 --libs)
webkitgtk-1.0CFLAG = $(shell pkg-config webkit-1.0 --cflags)
webkitgtk-1.0LIB = $(shell pkg-config webkit-1.0 --libs)

dndd : $(OBJ)
	$(CC) -g -o dndd $(LIB) $(OBJ) $(webkitgtk-1.0LIB) $(gtkmmLIB) -lmysqlcppconn
comment.o : comment.h comment.cc
	$(CC) -g -c comment.cc
member.o : member.h member.cc
	$(CC) -g -c member.cc
vote.o : vote.cc vote.h
	$(CC) -g -c vote.cc
mysqlvote.o : mysqlvote.cc mysqlvote.h
	$(CC) -g -c mysqlvote.cc $(INC)
mysqlboard.o : mysqlboard.h mysqlboard.cc
	$(CC) -g -c $(INC) mysqlboard.cc
mysqlquery.o : mysqlquery.h mysqlquery.cc
	$(CC) -g -c $(INC) mysqlquery.cc
mysqlmember.o : mysqlmember.h mysqlmember.cc
	$(CC) -g -c $(INC) mysqlmember.cc
main.o : main.cc main.h mainform.h
	$(CC) -g -c main.cc $(INC)  $(gtkmmCFLAG) $(webkitgtk-1.0CFLAG) 
util.o : util.h
mainform.o : mainform.cc mainform.h main.h
	$(CC) -g -c mainform.cc $(gtkmmCFLAG) $(webkitgtk-1.0CFLAG) $(INC)
menubar.o : menubar.cc menubar.h
	$(CC) -c menubar.cc $(gtkmmCFLAG) $(webkitgtk-1.0CFLAG)
conndata.o : conndata.h conndata.cc interface.h
	$(CC) -c -g conndata.cc $(gtkmmCFLAG) $(INC)
join.o : join.h join.cc interface.h
	$(CC) -c -g join.cc  $(gtkmmCFLAG) $(INC)
newbook.o : newbook.cc newbook.h 
	$(CC) -c -g newbook.cc  $(gtkmmCFLAG) $(INC)
follow.o : follow.cc follow.hpp
	$(CC) -c -g follow.cc  $(gtkmmCFLAG) $(INC)
votepopup.o : votepopup.cc votepopup.h
	$(CC) -c -g votepopup.cc  $(gtkmmCFLAG) $(INC)
commentpopup.o : commentpopup.cc commentpopup.h
	$(CC) -c -g commentpopup.cc $(gtkmmCFLAG) $(INC)  $(webkitgtk-1.0CFLAG)
	
install : 
	cp dndd /usr/local/bin
	cp *.html /usr/local/share/man
	
clean :
	rm *.o dndd
