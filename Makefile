CC = g++
INC = -I/usr/local/include
LIB = -L/usr/local/lib -L/usr/lib #-L/usr/local/lib/qt5
OBJ = comment.o member.o mysqlboard.o util.o mysqlquery.o mysqlmember.o mysqlvote.o vote.o mainform.o conndata.o join.o newbook.o follow.o votepopup.o commentpopup.o main.o

gtkmmCFLAG = -pthread -I/usr/include/giomm-2.4 -I/usr/lib/x86_64-linux-gnu/giomm-2.4/include -I/usr/include/gtk-2.0 -I/usr/include/gtk-unix-print-2.0 -I/usr/include/atk-1.0 -I/usr/include/glibmm-2.4 -I/usr/lib/x86_64-linux-gnu/glibmm-2.4/include -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/sigc++-2.0 -I/usr/lib/x86_64-linux-gnu/sigc++-2.0/include -I/usr/include/pango-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/gtkmm-2.4 -I/usr/lib/gtkmm-2.4/include -I/usr/include/atkmm-1.6 -I/usr/include/pangomm-1.4 -I/usr/lib/pangomm-1.4/include -I/usr/include/gdkmm-2.4 -I/usr/lib/gdkmm-2.4/include -I/usr/include/cairomm-1.0 -I/usr/lib/cairomm-1.0/include  


gtkmmLIB = -L/usr/local/lib -lgtkmm-2.4 -latkmm-1.6 -lgdkmm-2.4 -lgiomm-2.4 -lpangomm-1.4 -lgtk-x11-2.0 -lglibmm-2.4 -lcairomm-1.0 -lsigc-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lglib-2.0  

gtkLIB = -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lglib-2.0  
gtkCFLAG = -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12  

webkitgtk-3.0CFLAG = -I/usr/include/webkitgtk-1.0 -I/usr/include/libsoup-2.4

webkitgtk-3.0LIB = -lwebkitgtk-1.0 -lsoup-2.4 -latk-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo-gobject -lpango-1.0 -lcairo -lgio-2.0 -lgobject-2.0 -lglib-2.0 

dndd : $(OBJ)
	$(CC) -g -o dndd $(LIB) $(OBJ) $(webkitgtk-3.0LIB) $(gtkmmLIB) $(gtkLIB) -lmysqlcppconn
run : test
	./test&
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
#test.o : test.h test.cc 
#	$(CC) -g -c test.cc $(INC)  $(gtkmmCFLAG) $(webkitgtk-3.0CFLAG) $(gtkCFLAG)
main.o : main.cc main.h mainform.h
	$(CC) -g -c main.cc $(INC)  $(gtkmmCFLAG) $(webkitgtk-3.0CFLAG) $(gtkCFLAG)
util.o : util.h
mainform.o : mainform.cc mainform.h main.h
	$(CC) -g -c mainform.cc $(gtkmmCFLAG) $(webkitgtk-3.0CFLAG) $(gtkCFLAG) $(INC)
menubar.o : menubar.cc menubar.h
	$(CC) -c menubar.cc -I/usr/local/include/webkitgtk-3.0 $(gtkmmCFLAG) $(webkitgtk-3.0CFLAG)
conndata.o : conndata.h conndata.cc interface.h
	$(CC) -c -g conndata.cc $(gtkmmCFLAG) $(gtkCFLAG) $(INC)
join.o : join.h join.cc interface.h
	$(CC) -c -g join.cc  $(gtkmmCFLAG) $(gtkCFLAG) $(INC)
newbook.o : newbook.cc newbook.h 
	$(CC) -c -g newbook.cc  $(gtkmmCFLAG) $(gtkCFLAG) $(INC)
follow.o : follow.cc follow.hpp
	$(CC) -c -g follow.cc  $(gtkmmCFLAG) $(gtkCFLAG) $(INC)
votepopup.o : votepopup.cc votepopup.h
	$(CC) -c -g votepopup.cc  $(gtkmmCFLAG) $(gtkCFLAG) $(INC)

commentpopup.o : commentpopup.cc commentpopup.h
	$(CC) -c -g commentpopup.cc $(gtkmmCFLAG) $(gtkCFLAG) $(INC)  $(webkitgtk-3.0CFLAG)

clean :
	rm *.o test
