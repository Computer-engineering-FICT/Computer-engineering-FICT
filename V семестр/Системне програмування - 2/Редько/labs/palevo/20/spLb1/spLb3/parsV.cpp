#include "stdafx.h"
#include "token.h"
// Verilog
char *oprtrV[]={"", "", "", "", "if", "then", "else", "elseif",
	"case", "switch", "defualt", ""/*endcase*/, 
	"break", "return", "while", "while", "continue", 
	"do", "while", "do", "for", ";", ";", ";", 
	"while", "do", "with", "endif", 
	"goto","extern","var","const","enum","struct","union","register",//
	"unsigned","signed","char","short","int","long","int64","int64",//
	"float","double","void","auto","static","volatile","typedef","sizeof",//
	"real","array","set","file","object","string","label",
	"module","function","task",
	"macromodule","primitive","specify","table", //Verilog+4
	"generate","config","liblist","library",  //Verilog+8
	"incdir","include","design","default","instance","cell","use", //Verilog+15
	"automatic","endmodule","endfunction","endtask",   //Verilog+19
	"endprimitive","endspecify","endtable","endgenerate","endconfig", //Verilog+24
	"var","casex","casez","wait","forever","disable","ifnone", //Verilog+31
	"pulsestyle_onevent","pulsestyle_ondetect","showcanceled","noshowcanceled", //Verilog+35
	"vectored","scalared","small","medium","large", //Verilog+40
	"genvar","parameter","localparam","defparam","specparam","PATHPULSE$",  //Verilog+46
	"inline","forward","interrupt","export","extern","_asm",
	"input","output","inout",  //Verilog|SQL+3
	"object","constructor","desctructor","property","resP","abstract", //P++9
	"class","public","private","protected","virtual","friend", //C++15
	"new","delete","try","catch","throw"/*raise*/, //C++20
	"initial","always","assign","deassign","force","release", //Verilog+26
	"reg","time","realtime","event","buf","not", //Verilog+32
	"and","or","xor","nand","nor","xnor",  //Verilog+38
	"tran","tranif0","tranif1","rtran","rtranif0","rtranif1", //Verilog+44
	"tri","trior","triand","trireg","tri0","tri1",//Verilog+50
	"wire","wand","wor","",				 //Verilog+54
	"supply0","supply1","highz0","highz1", //Verilog+58
	"strong0","strong1","pull0","pull1","weak0","weak1",  //Verilog+64
	"pulldown","pullup","bufif0","bufif1","notif0","notif1",  //Verilog+70
	"cmos","rcmos","nmos","pmos","rnmos","rpmos",  //Verilog+76
	"\nfork","join","\n{","}","{","}","[","]","(",")","(",")", 	
	",;\n",".;\n",";\n", ",", ":", "?", 
	"|=", "&=", "^=", "+=", "-=", "*=", "/=", "%=",
	"<<=", ">>=", "=", "--","++",  
	"--","++","","","*/","",
	"<","<=","==","!=",">=",">",
	"+", "-", "*", "/", 
	".", "->", "**", "<<<", ">>>", "===", "!==",
	"+", "-", "*", "&", 
	":","=>","*>","&&&",	// PV+4 .. _lmts,_eqar,_astar,_trasand,
	"|","&","^","~|","~&","~^","^~", //V+11 _orR,_andR,_xorR,_norR,_nandR,_nxorR,_xornR
	"#","@","@*", //V+14 _delay,_event,_events,
	"~|", "~&", "~^", "^~", "&", 
	"/*","//", "%", "|", "&", "^", 
	"<<", ">>", "||", "&&", 
	"!","~","/","in",
	"posedge","negedge","or"  //Verilog+3
},
*cprV[]={"", "", "", "", "\1\5y", "", "", "", 
	"\7switch\5\n{\1y\377z\1 y", "", "", "\4;\n\376}",//
	"","\1x","\1\5y","x\1\5","", "\1x","x\1(!\5)","\1\4", 
	"\1\5y", "", "", "", 
	"\1(!\4)y", "", "", "",	
	"", "", "", "",	"\1\4\4", "", "", "", 
	"", "", "", "",	"", "", "", "", 
	"", "", "", "",	"", "", "", "", 
	"", "", "", "",
	"", "", "", "", "", "",
	"","","","", //Verilog+4
	"","","","",  //Verilog+8
	"","","","","","","", //Verilog+15
	"","","","",   //Verilog+19
	"","","","","", //Verilog+24
	"","","","","","","", //Verilog+31
	"","","","", //Verilog+35
	"","","","","", //Verilog+40
	"","","","","","",  //Verilog+46
	"", "", "", "", "", "",
	"","","",  //Verilog|SQL+3
	"","","","","","", //P++9
	"","","","","","", //C++15
	"","","","",""/*raise*/, //C++20
	"","","","","","",	//Verilog+26
	"","","","","","",	//Verilog+32
	"","","","","","",  //Verilog+38
	"","","","","","",	//Verilog+44
	"","","","","","",	//Verilog+50
	"","","","",		//Verilog+54
	"","","","",		//Verilog+58
	"","","","","","",  //Verilog+64
	"","","","","","",  //Verilog+70
	"","","","","","",  //Verilog+76
	"", "", "", "",	"", "", "", "", "", "", "", "", 
	"", "", "", "", "", "", 
	"\4\1y","\4\1y","\4\1y","\4\1y","\4\1y","\4\1y","\4\1y","\4\1y", 
	"\4\1y","\4\1y","\4\1y","","",
	"","","","","","",
	"","","","","","", 
	"","","","", 
	"","","","","","","",
	"","","","", 
	"","","","",	// PV+4 .. _lmts,_eqar,_astar,_trasand,
	"","","","","","","", //V+11 _orR,_andR,_xorR,_norR,_nandR,_nxorR,_xornR
	"","","", //V+14 _delay,_event,_events,
	"","","","","",
	"","", "","","","",
	"","","","",
	"","","","", 
	"","","" 
};