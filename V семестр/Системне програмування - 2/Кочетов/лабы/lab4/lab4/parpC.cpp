#include "stdafx.h"
#include "syntaxP.h"
enum tokPrec opPrFC[290]= 
{nil,ptrm,//_nil, _nam,	//0 зовнішнє подання
 ptrm,ptrm,//_srcn,	_cnst,	//2 вхідне і внутрішнє кодування константи
 pskw,pmkw,pmkw,nil,//_if,_then,_else,_elseif,	//4 if then else elseif
 pskw,pskw,pskw,nil,//_case, _switch, _default, _endcase,//8 case switch defualt endcase
 pbkw,pskw,pskw,pmkw,//_break, _return, _whileP, _whileN, //12 break return while do
 pbkw,prep,nil,nil,//_continue, _repeat, _untilN, _endloop, //16 continue repeat until
 pskw,pmkw,pmkw,pmkw,//_for, _to, _downto, _step,// for to downto step 
 nil,nil,pbkw,nil,//_untilP, _loop, _with, _endif,	
 pbkw,pbkw,nil,pbkw, pekw,pekw,pekw,pbkw,
 //_void,_extern,_var,_const,_enum,_struct/*_record*/,_union,_register,//
 pbkw,pbkw,pbkw,pbkw, pbkw,pbkw,pbkw,pbkw,
 //_unsigned,_signed,_char,_short,_int,_long,_sint64,_uint64,//
 pbkw,pbkw,nil,pbkw, pbkw,nil,pbkw,nil,
 //_float,_double,_label,_auto,_static,_volatile,_typedef,_sizeof,//
 nil,nil,nil,nil, nil,nil,nil,
 //_real,_array,_set,_file,_object, _string, _goto,
 nil,nil,nil,
 //_program,_function,_procedure /*task V*/,
 nil,nil,nil,nil,
 //_macromodule,_primitive,_specify,_table, //Verilog
 nil,nil,nil,nil,
 //_generate,_config,_liblist,_library,  //Verilog
 nil,nil,nil,nil, nil,nil,nil,
 //_incdir,_include,_design,_defaultS,_instance,_cell,_use, //Verilog
 nil,nil,nil,nil,
 //_automatic,_endmodule,_endfunction,_endtask,   //Verilog
 nil,nil,nil,nil, nil,
 //_endprimitive,_endspecify,_endtable,_endgenerate,_endconfig,  //Verilog
 nil,nil,nil,nil, nil,nil,nil,
 //_endcaseV,_casex,_casez,_wait,_forever,_disable,_ifnone, //Verilog
 nil,nil,nil,nil,
 //_pulsestyle_onevent,_pulsestyle_ondetect,_showcanceled,_noshowcanceled, //Verilog
 nil,nil,nil,nil, nil,
 //_vectored,_scalared,_small,_medium,_large, //Verilog
 nil,nil,nil,nil, nil,nil,
 //_genvar,_parameter,_localparam,_defparam,_specparam,_PATHPULSE$,  //Verilog
 nil,nil,nil,nil, nil,nil,
 //_inlineF,_forward,_interrupt,_exportF,_extrn,_asmb,
 nil,nil,nil,
 //_input,_output,_inout,  //Verilog|SQL+3
 nil,nil,nil,nil, nil,nil,
 //_objectP,_constructor,_desctructor,_property,_resP,_abstract, //P++9
 nil,nil,nil,nil, nil,nil,
 //_class,_public,_private,_protected,_virtual,_friend, //C++16
 nil,nil,nil,nil, nil,
 //_new,_delete,_tryC,_catch,_throw/*raise*/, //C++20
 nil,nil,nil,nil, nil,nil,
 //_initial,_always,_assign,_deassign,_force,_release, //Verilog+26
 nil,nil,nil,nil, nil,nil,
 //_reg,_time,_realtime,_event,_buf,_not, //Verilog+32
 nil,nil,nil,nil, nil,nil,
 //_andG,_orG,_xorG,_nandG,_norG,_xnorG,  //Verilog+38
 nil,nil,nil,nil, nil,nil,
 //_tran,_tranif0,_tranif1,_rtran,_rtranif0,_rtranif1, //Verilog+44
 nil,nil,nil,nil, nil,nil,
 //_tri,_trior,_triand,_trireg,_tri0,_tri1,//Verilog+50
 nil,nil,nil,nil,
 //_wire,_wand,_wor,_wres,			//Verilog+54
 nil,nil,nil,nil,
 //_supply0,_supply1,_highz0,_highz1, //Verilog+58
 nil,nil,nil,nil, nil,nil,
 //_strong0,_strong1,_pull0,_pull1,_weak0,_weak1,  //Verilog+64
 nil,nil,nil,nil, nil,nil,
 //_pulldown,_pullup,_bufif0,_bufif1,_notif0,_notif1,  //Verilog+70
 nil,nil,nil,nil, nil,nil,
 //_cmos,_rcmos,_nmos,_pmos,_rnmos,_rpmos,  //Verilog+76
 popf,pclf,//_fork, _join,	// відкриті і закриті дужки паралельних операторів 2
 popf,pclf,//_opbr, _ocbr,	// відкриті і закриті дужки операторів 2
 nil,nil,//_ctbr,	_fcbr,	// відкриті і закриті дужки конкатенацій 3 
 pops,pcls,//_ixbr, _scbr,	// відкриті і закриті дужки індексу 4
 popb,pclb,//_brkt, _bckt,	// відкриті і закриті дужки порядку і функцій 5
 popd,pcld,//_tdbr, _tcbr,	// відкриті і закриті дужки даних 6
 peos,peos,//_eosP, eosS,	// паралельні та послідовні
 peos,pdol,psmc,pcnd,//_EOS=begOprtr, _comma, _cln, _qmrk,// ; , : ?
 pass,pass,pass,pass,//_asOr, _asAnd, _asXor, _asAdd,		//|= =& =^ =+
 pass,pass,pass,pass,//_asSub, _asMul, _asDiv, _asMod,	// -= *= /= %=
 pass,pass,pass,puno,puno,//_asShr,_asShl, _ass, _dcr, _inr, 	// <<= >>= = -- ++ 
 puno,puno,nil,nil,nil,nil,//_dcrN,_inrN,_mcrs,_dbcln,_eoCm,_EOF, //-- ++ //  #  ::  */ 
 prel,prel,pequ,pequ,prel,prel,//_lt,_le, _eq, _ne, _ge,_gt,		// < <= == != >= >
 padd,padd,pmul,pmul,pacf,pacf,//_add, _sub, _mul, _div, _fldDt, _fldPt,// + - * / . ->
 ppwr,pshf,pshf,pequ,pequ,//_pwr, _shLfa, _shRga, _eqB, _neB,	// ** <<< >>> === !==
 puno,puno,puno,puno,//_addU,_subU,_mulU, _andU,		// + - * & унарні
 nil,nil,nil,nil,//_lmts,_eqar,_astar,_trasand,	// PV+4 ..  => *> &&&
 nil,nil,nil,nil,nil,nil,nil,//_orR,_andR,_xorR,_norR,_nandR,_nxorR,_xornR, //V+11 & | ^ ~| ~& ~^ 
 nil,nil,nil,//_delay,_eventV,_events,		 //V+14 # @ @*
 nil,nil,nil,nil,puno,//_norB,_nandB,_nxorB,_xornB,_addr, //~| ~& ~^ ^~  _ptr,
 peos,peos,//_rem,_remL, // 
 pmul,porw,panw,pxrw,//_mod, _orB, _andB, _xorB,		// %(mod) |(or) &(and) ^(xor) 
 pshf,pshf,porl,panl,//_shLft,_shRgt, _or, _and,	//<<(shl) >>(shr) ||(or) &&(and)    
 puno,puno,nil,nil,//_xmrk,_invB,_divI,_in, //_not, _notB, /(div)
 nil,nil,nil,//_posedge,_negedge,_orE  //Verilog+3
 popf,//_fork, _join,	// замкнені дужки паралельних операторів 2
 popf,//_opbr, _ocbr,	// замкнені дужки операторів 2
 nil,//_ctbr,	_fcbr,	// замкнені дужки конкатенацій 3 
 pops,//_ixbr, _scbr,	// замкнені дужки індексу 4
 popb,//_brkt, _bckt,	// замкнені дужки порядку і функцій 5
 popd//_tdbr, _tcbr,	// замкнені дужки даних 6
// _pnil 
};
enum tokPrec opPrGC[290]= 
{nil,ptrm,//_nil, _nam,	//0 зовнішнє подання
 ptrm,ptrm,//_srcn,	_cnst,	//2 вхідне і внутрішнє кодування константи
 pskw,peos,peos,nil,//_if,_then,_else,_elseif,	//4 if then else elseif
 nil,nil,nil,nil,//_case, _switch, _default, _endcase,//8 case switch defualt endcase
 pbkw,pskw,pskw,nil,//_break, _return, _whileP, _whileN, //12 break return while do
 pbkw,prep,nil,nil,//_continue,peos _repeat, _untilN, _endloop, //16 continue repeat until
 pskw,peos,nil,nil,//pclf_for, _to, _downto, _step,// for to downto step 
 nil,nil,nil,nil,//_untilP, _loop, _with, _endif,	
 nil,pbkw,nil,pbkw, pekw,pekw,pekw,nil,
 //_goto,_extern,_var,_const,_enum,_struct/*_record*/,_union,_register,//
 pbkw,pbkw,pbkw,pbkw, pbkw,pbkw,pbkw,pbkw,
 //_unsigned,_signed,_char,_short,_int,_long,_sint64,_uint64,//
 pbkw,pbkw,pbkw,pbkw, pbkw,nil,nil,nil,
 //_float,_double,_void,_auto,_static,_volatile,_typedef,_sizeof,//
 nil,nil,nil,nil, nil,nil,nil,
 //_real,_array,_set,_file,_object, _string, _label,
 nil,nil,nil,
 //_program,_function,_procedure /*task V*/,
 nil,nil,nil,nil,
 //_macromodule,_primitive,_specify,_table, //Verilog
 nil,nil,nil,nil,
 //_generate,_config,_liblist,_library,  //Verilog
 nil,nil,nil,nil, nil,nil,nil,
 //_incdir,_include,_design,_defaultS,_instance,_cell,_use, //Verilog
 nil,nil,nil,nil,
 //_automatic,_endmodule,_endfunction,_endtask,   //Verilog
 nil,nil,nil,nil, nil,
 //_endprimitive,_endspecify,_endtable,_endgenerate,_endconfig,  //Verilog
 nil,nil,nil,nil, nil,nil,nil,
 //_endcaseV,_casex,_casez,_wait,_forever,_disable,_ifnone, //Verilog
 nil,nil,nil,nil,
 //_pulsestyle_onevent,_pulsestyle_ondetect,_showcanceled,_noshowcanceled, //Verilog
 nil,nil,nil,nil, nil,
 //_vectored,_scalared,_small,_medium,_large, //Verilog
 nil,nil,nil,nil, nil,nil,
 //_genvar,_parameter,_localparam,_defparam,_specparam,_PATHPULSE$,  //Verilog
 nil,nil,nil,nil,nil,nil,
 //_inlineF,_forward,_interrupt,_exportF,_extrn,_asmb,
 nil,nil,nil,
 //_input,_output,_inout,  //Verilog|SQL+3
 nil,nil,nil,nil, nil,nil,
 //_objectP,_constructor,_desctructor,_property,_resP,_abstract, //P++9
 nil,nil,nil,nil, nil,nil,
 //_class,_public,_private,_protected,_virtual,_friend, //C++16
 nil,nil,nil,nil, nil,
 //_new,_delete,_tryC,_catch,_throw/*raise*/, //C++20
 nil,nil,nil,nil, nil,nil,
 //_initial,_always,_assign,_deassign,_force,_release, //Verilog+26
 nil,nil,nil,nil, nil,nil,
 //_reg,_time,_realtime,_event,_buf,_not, //Verilog+32
 nil,nil,nil,nil, nil,nil,
 //_andG,_orG,_xorG,_nandG,_norG,_xnorG,  //Verilog+38
 nil,nil,nil,nil, nil,nil,
 //_tran,_tranif0,_tranif1,_rtran,_rtranif0,_rtranif1, //Verilog+44
 nil,nil,nil,nil, nil,nil,
 //_tri,_trior,_triand,_trireg,_tri0,_tri1,//Verilog+50
 nil,nil,nil,nil,
 //_wire,_wand,_wor,_wres,			//Verilog+54
 nil,nil,nil,nil,
 //_supply0,_supply1,_highz0,_highz1, //Verilog+58
 nil,nil,nil,nil, nil,nil,
 //_strong0,_strong1,_pull0,_pull1,_weak0,_weak1,  //Verilog+64
 nil,nil,nil,nil, nil,nil,
 //_pulldown,_pullup,_bufif0,_bufif1,_notif0,_notif1,  //Verilog+70
 nil,nil,nil,nil, nil,nil,
 //_cmos,_rcmos,_nmos,_pmos,_rnmos,_rpmos,  //Verilog+76
 pclf,pclf,//_fork, _join,	// відкриті і закриті дужки паралельних операторів 2
 pclf,pclf,//_opbr, _ocbr,	// відкриті і закриті дужки операторів 2
 nil,nil,//_ctbr,	_fcbr,	// відкриті і закриті дужки конкатенацій 3 
 pcls,pcls,//_ixbr, _scbr,	// відкриті і закриті дужки індексу 4
 pclb,pclb,//_brkt, _bckt,	// відкриті і закриті дужки порядку і функцій 5
 pcld,pcld,//_tdbr, _tcbr,	// відкриті і закриті дужки даних 6
 peos,peos,//_eosP, eosS,	// паралельні та послідовні
 peos,pdol,psmc,pcnd,//_EOS=begOprtr, _comma, _cln, _qmrk,// ; , : ?
 pass,pass,pass,pass,//_asOr, _asAnd, _asXor, _asAdd,		//|= =& =^ =+
 pass,pass,pass,pass,//_asSub, _asMul, _asDiv, _asMod,	// -= *= /= %=
 pass,pass,pass,puno,puno,//_asShr,_asShl, _ass, _dcr, _inr, 	// <<= >>= = -- ++ 
 puno,puno,nil,nil,nil,nil,//_dcrN,_inrN,_mcrs,_dbcln,_eoCm,_EOF, //-- ++ //  #  ::  */ 
 prel,prel,pequ,pequ,prel,prel,//_lt,_le, _eq, _ne, _ge,_gt,		// < <= == != >= >
 padd,padd,pmul,pmul,pacf,pacf,//_add, _sub, _mul, _div, _fldDt, _fldPt,// + - * / . ->
 ppwr,pshf,pshf,pequ,pequ,//_pwr, _shLfa, _shRga, _eqB, _neB,	// ** <<< >>> === !==
 puno,puno,puno,puno,//_addU,_subU,_mulU, _andU,		// + - * & унарні
 nil,nil,nil,nil,//_lmts,_eqar,_astar,_trasand,	// PV+4 ..  => *> &&&
 nil,nil,nil,nil,nil,nil,nil,//_orR,_andR,_xorR,_norR,_nandR,_nxorR,_xornR, //V+11 & | ^ ~| ~& ~^ 
 nil,nil,nil,//_delay,_eventV,_events,		 //V+14 # @ @*
 nil,nil,nil,nil,puno,//_norB,_nandB,_nxorB,_xornB,_addr, //~| ~& ~^ ^~  _ptr,
 peos,peos,//_rem,_remL, // 
 pmul,porw,panw,pxrw,//_mod, _orB, _andB, _xorB,		// %(mod) |(or) &(and) ^(xor) 
 pshf,pshf,porl,panl,//_shLft,_shRgt, _or, _and,	//<<(shl) >>(shr) ||(or) &&(and)    
 puno,nil,nil,nil,//_xmrk,_invB,_divI,_in, //_not, _notB, /(div)
 nil,nil,nil,//_posedge,_negedge,_orE  //Verilog+3
 popf,//_fork, _join,	// замкнені дужки паралельних операторів 2
 popf,//_opbr, _ocbr,	// замкнені дужки операторів 2
 nil,//_ctbr,	_fcbr,	// замкнені дужки конкатенацій 3 
 pops,//_ixbr, _scbr,	// замкнені дужки індексу 4
 popb,//_brkt, _bckt,	// замкнені дужки порядку і функцій 5
 popd//_tdbr, _tcbr,	// замкнені дужки даних 6
/* pclf,//_fork, _join,	// замкнені дужки паралельних операторів 2
 pclf,//_opbr, _ocbr,	// замкнені дужки операторів 2
 nil,//_ctbr,	_fcbr,	// замкнені дужки конкатенацій 3 
 pcls,//_ixbr, _scbr,	// замкнені дужки індексу 4
 pclb,//_brkt, _bckt,	// замкнені дужки порядку і функцій 5
 pcld//_tdbr, _tcbr,	// замкнені дужки даних 6*/
// _pnil 
};
