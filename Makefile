CC = g++
INC = -IC:\cygwin64\home\박승원\mysql-connector-c++-1.1.5\cppconn -I/usr/include
LIB = -L/usr/lib C:\cygwin64\home\박승원\mysql-connector-c++-1.1.5\driver\libmysqlcppconn-static.a -LC:\cygwin64\home\박승원\mysql-connector-c++-1.1.5\driver\ -lmysqlcppconn cygmysqlcppconn-7.dll
OBJ = comment.o member.o mysqlboard.o util.o mysqlquery.o mysqlmember.o mysqlvote.o vote.o mainform.o conndata.o join.o newbook.o follow.o votepopup.o commentpopup.o main.o

gtkmmCFLAG = -D_REENTRANT -I/usr/include/gtkmm-2.4 -I/usr/lib/gtkmm-2.4/include -I/usr/include/atkmm-1.6 -I/usr/include/gtk-unix-print-2.0 -I/usr/include/gtk-2.0 -I/usr/include/gdkmm-2.4 -I/usr/lib/gdkmm-2.4/include -I/usr/include/giomm-2.4 -I/usr/lib/giomm-2.4/include -I/usr/include/pangomm-1.4 -I/usr/lib/pangomm-1.4/include -I/usr/include/glibmm-2.4 -I/usr/lib/glibmm-2.4/include -I/usr/include/cairomm-1.0 -I/usr/lib/cairomm-1.0/include -I/usr/include/sigc++-2.0 -I/usr/lib/sigc++-2.0/include -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16

gtkmmLIB = -lgtkmm-2.4 -latkmm-1.6 -lgtk-x11-2.0 -lgdkmm-2.4 -lgiomm-2.4 -lpangomm-1.4 -lglibmm-2.4 -lcairomm-1.0 -lsigc-2.0 -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -lgio-2.0 -lXinerama -lXi -lXrandr -lXcursor -lXcomposite -latk-1.0 -lcairo -lz -lGL -lpixman-1 -lEGL -lm -lpthread -lGL -lm -lpthread -lXdamage -lXfixes -lX11-xcb -lxcb-glx -lxcb-shm -lxcb-render -lXrender -lXext -lX11 -lxcb -lXau -lXdmcp -lgdk_pixbuf-2.0 -lm -lpng16 -lm -lz -lgio-2.0 -lz -lpangoft2-1.0 -lharfbuzz -lpango-1.0 -lm -lgmodule-2.0 -lgobject-2.0 -lffi -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre -lfontconfig -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz

gtkLIB = -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lglib-2.0  

gtkCFLAG = -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12  

webkitgtk-1.0CFLAG = -D_REENTRANT -I/usr/include/webkitgtk-1.0 -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libsoup-2.4 -I/usr/include/libxml2 -I/usr/include/webkitgtk-1.0 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include

webkitgtk-1.0LIB = -lwebkitgtk-1.0 -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -lgio-2.0 -lXinerama -lXi -lXrandr -lXcursor -lXcomposite -latk-1.0 -lcairo -lz -lGL -lpixman-1 -lEGL -lm -lpthread -lGL -lm -lpthread -lXdamage -lXfixes -lX11-xcb -lxcb-glx -lxcb-shm -lxcb-render -lXrender -lXext -lX11 -lxcb -lXau -lXdmcp -lgdk_pixbuf-2.0 -lm -lpng16 -lm -lz -lpangoft2-1.0 -lharfbuzz -lpango-1.0 -lm -lfontconfig -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz -lsoup-2.4 -lxml2 -lz -llzma -liconv -lm -lgio-2.0 -lz -lgmodule-2.0 -lgobject-2.0 -lffi -ljavascriptcoregtk-1.0 -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre


 $(gtkCFLAG) $(INC) C:\gtkmm64\gtkmm-demo\example_appwindow.cc

dndd.exe : $(OBJ)
	$(CC) -g -o dndd.exe $(LIB) $(OBJ) $(webkitgtk-1.0LIB) $(gtkmmLIB) $(gtkLIB)
test : gtktest.cc
	$(CC) -g -o test.exe $(LIB) $(OBJ) $(webkitgtk-1.0LIB) $(gtkmmLIB) $(gtkLIB) $(gtkmmCFLAG)
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
#	$(CC) -g -c test.cc $(INC)  $(gtkmmCFLAG) $(webkitgtk-1.0CFLAG) $(gtkCFLAG)

util.o : util.h

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
	$(CC) -c -g commentpopup.cc $(gtkmmCFLAG) $(gtkCFLAG) $(INC)  $(webkitgtk-1.0CFLAG)
main.o : main.cc main.h mainform.h
	$(CC) -c main.cc $(INC)  $(gtkmmCFLAG) $(webkitgtk-1.0CFLAG) $(gtkCFLAG)
mainform.o : mainform.cc mainform.h main.h
	$(CC) -c mainform.cc $(gtkmmCFLAG) $(webkitgtk-1.0CFLAG) $(gtkCFLAG) $(INC)
	
clean :
	rm *.o dndd
