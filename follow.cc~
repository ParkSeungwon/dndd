#include <iostream>
using namespace std;
#include <gtkmm.h>
#include "follow.hpp"
#include "interface.h"

FollowPopup::FollowPopup() : label2("ID  :"), button2("follow"), check1("secret")
{
	set_title("Follow");
	add(vbox1);
	vbox1.pack_start(check1);
	vbox1.pack_start(hbox2);
	vbox1.pack_start(label3);
	hbox2.pack_start(label2, Gtk::PACK_SHRINK);
	hbox2.pack_start(entry2);
	entry2.set_size_request(300);
	hbox2.pack_start(button2, Gtk::PACK_SHRINK);
    button2.signal_clicked().connect(sigc::mem_fun(*this, &FollowPopup::on_follow_click));
	set_modal(true);
	set_position(Gtk::WIN_POS_CENTER_ON_PARENT);
	show_all_children();
}

void FollowPopup::on_follow_click()
{
	extern CommentInterface *pInterface;
	int i = pInterface->followID(entry2.get_text(), check1.get_active());
	if(i >= 3) hide();
	else if(i == 1 || i == 2)
		label3.set_label("level should be higher than representative");
	else if(i == -1) label3.set_label("log in first");
	else if(i == 0) label3.set_label("No such id");
}
