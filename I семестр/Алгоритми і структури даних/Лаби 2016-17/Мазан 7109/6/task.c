#include <stdio.h>
#include <unistd.h>
#include <ncurses.h>
int main(int argc,char *argv[]) {
	int i,j,x,y,maxrow,maxcol,linenum;
	initscr();
	maxrow = 24;
	maxcol = 80;
	linenum = 0;
	x = maxrow/2;
	y = maxcol/2 - maxrow-3;
	move(x,y-1);
	while (1==1) {
		for(i=0;i<=maxcol-maxrow+linenum+1;++i) {
			printw("*");
			move(x,y+i);
			refresh();
			usleep(10000);
		}
		++linenum;
		getyx(stdscr,x,y);
		move(x,y-1);
		getyx(stdscr,x,y);
		if (x==0 || y==0) {
			goto exception;}
		for(i=0;i<=linenum;++i) {
			printw("*");
			move(x-i,y);
			refresh();
			usleep(10000);
		}
		getyx(stdscr,x,y);
		for(i=0;i<=maxcol-maxrow+linenum+1;++i) {
			move(x,y-i);
			printw("*");
			refresh();
			usleep(10000);
		}
		++linenum;
		getyx(stdscr,x,y);
		move(x,y-1);
		getyx(stdscr,x,y);
		if (x==1 || y==1) {
			goto exception;}
		for(i=0;i<=linenum;++i) {
			move(x+i,y);
			printw("*");
			refresh();
			usleep(10000);
		}
		getyx(stdscr,x,y);
		if (x== 25|| y==0) {
			goto exception;
		}
	}
	exception:
		refresh();
		getch();
		endwin();
}
