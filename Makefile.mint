CC = g++
INC = -I/usr/local/include
LIB = -L/usr/local/lib #-L/usr/local/lib/qt5
OBJ = comment.o member.o mysqlboard.o test.o util.o mysqlquery.o mysqlmember.o mysqlvote.o vote.o mainform.o  

gtkmmCFLAG = -pthread -I/usr/include/gtkmm-3.0 -I/usr/lib/i386-linux-gnu/gtkmm-3.0/include -I/usr/include/atkmm-1.6 -I/usr/include/giomm-2.4 -I/usr/lib/i386-linux-gnu/giomm-2.4/include -I/usr/include/pangomm-1.4 -I/usr/lib/i386-linux-gnu/pangomm-1.4/include -I/usr/include/gtk-3.0 -I/usr/include/cairomm-1.0 -I/usr/lib/i386-linux-gnu/cairomm-1.0/include -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/gtk-3.0/unix-print -I/usr/include/gdkmm-3.0 -I/usr/lib/i386-linux-gnu/gdkmm-3.0/include -I/usr/include/atk-1.0 -I/usr/include/glibmm-2.4 -I/usr/lib/i386-linux-gnu/glibmm-2.4/include -I/usr/include/glib-2.0 -I/usr/lib/i386-linux-gnu/glib-2.0/include -I/usr/include/sigc++-2.0 -I/usr/lib/i386-linux-gnu/sigc++-2.0/include -I/usr/include/pango-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/harfbuzz -I/usr/include/glibmm-2.4 -I/usr/lib/x86_64-linux-gnu/glibmm-2.4/include -I/usr/lib/x86_64-linux-gnu/gdkmm-3.0/include -I/usr/lib/x86_64-linux-gnu/pangomm-1.4/include -I/usr/lib/x86_64-linux-gnu/gtkmm-3.0/include -I/usr/include/gtkmm-2.4 -I/usr/lib/x86_64-linux-gnu/sigc++-2.0/include/ -I/usr/include/gdkmm-2.4 -I/usr/lib/gdkmm-2.4/include/

gtkmmLIB = -latkmm-1.6 -lgdkmm-3.0 -lgiomm-2.4 -lpangomm-1.4 -lgtk-3 -lglibmm-2.4 -lcairomm-1.0 -lgdk-3 -latk-1.0 -lgio-2.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo-gobject -lpango-1.0 -lcairo -lsigc-2.0 -lgobject-2.0 -lglib-2.0 -L/usr/lib/gtkmm-2.4

gtk+-3.0LIB = -lgtk-3 -lgdk-3 -latk-1.0 -lgio-2.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo-gobject -lpango-1.0 -lcairo -lgobject-2.0 -lglib-2.0  

gtk+-3.0CFLAG = -pthread -I/usr/include/gtk-3.0 -I/usr/include/atk-1.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/harfbuzz -I/usr/include/freetype2 -I/usr/include/pixman-1 -I/usr/include/libpng12 

webkitgtk-3.0CFLAG = -pthread -I/usr/include/webkitgtk-3.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/gtk-3.0 -I/usr/include/libsoup-2.4 -I/usr/include/atk-1.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/harfbuzz -I/usr/include/freetype2 -I/usr/include/pixman-1 -I/usr/include/libpng12 -I/usr/include/libxml2  

webkitgtk-3.0LIB = -lwebkit2gtk-3.0 -lgtk-3 -lsoup-2.4 -ljavascriptcoregtk-3.0 -lgdk-3 -latk-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo-gobject -lpango-1.0 -lcairo -lgio-2.0 -lgobject-2.0 -lglib-2.0  

test : $(OBJ)
	$(CC) -g -o test $(INC) $(LIB) $(OBJ) $(webkitgtk-3.0LIB) $(gtkmmLIB) -lmysqlcppconn
run : test
	./test&
comment.o : 
member.o : 
mysqlboard.o : mysqlboard.h mysqlboard.cc
	$(CC) -c $(INC) mysqlboard.cc
mysqlquery.o : mysqlquery.h mysqlquery.cc
	$(CC) -c $(INC) mysqlquery.cc
mysqlmember.o : mysqlmember.h mysqlmember.cc
	$(CC) -c $(INC) mysqlmember.cc
test.o : test.h test.cc mainform.o
	$(CC) -g -c test.cc $(INC)  $(gtkmmCFLAG) $(webkitgtk-3.0CFLAG) 
util.o : 
vote.o : 
mysqlvote.o : mysqlvote.h mysqlvote.cc
	$(CC) -c $(INC) mysqlvote.cc
mainform.o : mainform.cc mainform.h
	$(CC) -g -c mainform.cc $(gtkmmCFLAG) $(webkitgtk-3.0CFLAG)
menubar.o : menubar.cc menubar.h
	c++ -c menubar.cc -I/usr/local/include/webkitgtk-3.0 $(gtkmmCFLAG) $(webkitgtk-3.0CFLAG) 

clean :
	rm *.o test
