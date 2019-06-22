#include "stdafx.h"
#include "token.h"
// Pascal
char *oprtrP[290]={"","","","","if","then","else","elseif",  
	"case", ":", "else"/*otherwise*/,"end"/*endcase*/, 
	"break", "exit", "while", "until", 
	"continue", "repeat", "until", "repeat", 
	"for", "to", "downto", "step", 	
	"while", "do", "with", "endif", 
	"goto","extern","var","const","","record","case","register",//
	"unsigned","signed","byte","Integer","integer","Longint","int64","int64",//
	"float","double","void","auto","static","volatile","type","sizeof",//
	"real","array","set","file","object","string","label",
	"program","function","procedure",
	"","","","", //Verilog+4
	"","","","",  //Verilog+8
	"","","","","","","", //Verilog+15
	"","","","",   //Verilog+19
	"","","","","", //Verilog+24
	"var","","","","","","", //Verilog+31
	"","","","", //Verilog+35
	"","","","","", //Verilog+40
	"","","","","","",  //Verilog+46
	"inline","forward","interrupt","export","external","assembler",
	"","","",  //Verilog|SQL+3
	"object","constructor","desctructor","property","resP","abstract", //P++9
	"class","public","private","protected","virtual","friend", //C++15
	"new","delete","try","catch","throw"/*raise*/, //C++20
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
	"fork", "join","begin","end","{","}","[", "]","(", ")","(", ")", 
	",;\n",".;\n",";\n",",",":","?",
	"or", "and", "xor", "+", "-", "*", "/", "mod",
	"shl","shr",":=", "dcr","inr",  
	"dcr","inr","#","::","}","",
	"<","<=","=","<>",">=",">",
	"+", "-", "*", "/",
	".", "->", "**", "<<<", ">>>", "===", "!==",
	"+", "-", "*", "&", 
	"..","=>","*>","&&&",	// PV+4 .. _lmts,_eqar,_astar,_trasand,
	"or","and","xor","nor","nand","nxor","xnor", //V+11 _orR,_andR,_xorR,_norR,_nandR,_nxorR,_xornR
	"delay","event","events", //V+14 _delay,_event,_events,
	"~|", "~&", "~^", "^~", "@", 
	"{","","mod","or", "and", "xor", "shl", "shr", "or", "and",
	"not","not","div","in", //_not, _notB, /(div)
	"posedge","negedge","orE",  //Verilog+3
	"\nfork","\nbegin","{","[","(","{"
},
*cprP[290]={"", "", "", "", "\1\4 theny", "", "", "", 
	"\7\1\4 of\ny\377zy", "", "", "\4;\n\376end",//
	"","\1x","\1\4 doy","repeat x\1 not \5",
	"", "\1x","repeat x\1 \5","\1\4", 
	"\1\4 doy", "", "", "", 
	"\1 not(\4)y", "", "", "",
	"", "", "", "",	"", "", "", "", 
	"", "", "zy:\6\6x\1", "",	"", "", "", "", 
	"", "", "", "",	"", "", "", "", 
	"", "","",	"", 
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
	"", "", "", "", "", "", "", "", "", "", "x=\1y)", "",
	"", "", "", "", "", "",
	"\4:=\6x \1 y","\4:=\6x \1 y","\4:=\6x \1 y","\4:=\6x\1y",
	"\4:=\6x\1y","\4:=\6x\1y","\4:=\6x\1y","\4:=\6x mod y", 
	"\4:=\6x shl y","\4:=\6x shr y","\4\1y","","", 
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
	"\4 \1 \4","\4 \1 \4","","",
	"","","","", 
	"","","",
	"", "", "", "", "", ""
};