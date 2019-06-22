MACRO  Call  Label  : {CJS Nz,Label;}
MACRO  Ret          : {CRTN Nz;}
MACRO  JMP   Label  : {CJP Nz,Label;}
MACRO  JNC   Label  : {CJP Not RM_C,Label;}
MACRO  JC    Label  : {CJP RM_C,Label;}
MACRO  JNZ   Label  : {CJP Not RM_Z,Label;}
MACRO  JE    Label  : {CJP RM_Z,Label;}
MACRO  Mov Rg1,Rg2  : {Or  Rg1,Rg2,Z;}
