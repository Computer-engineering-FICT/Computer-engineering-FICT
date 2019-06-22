class Token(object):
    def __init__(self,type,value):
        self.type=type
        self.value=value
    def __str__(self):
        return 'Token({type},{value})'.format(
      type=self.type,
         value=repr(self.value)
  )
    def __repr__(self):
        return self.__str__
#------------------------------------------------------
token_exprs=[(r'[ \n]+','None'),
             (r'#[^\n]*','None'),
             (r'\:=','assignment statement'),
             (r'\(','left paren'),
             (r'\)','right paren'),
             (r';','endline'),
             (r':','assignment statement'),
             (r'\+','PLUS OPERATOR'),
             (r'\{','Left brace'),
             (r'\}','Right brace'),
             (r'\[', 'Left square bracket'),
             (r'\]', 'Right square bracket'),
             (r'\.','dot'),
             (r',','delimargs'),
             (r'-','minus'),
             (r'--','decrement'),
             (r'\*','OP'),
             (r'\^','OP'),
             (r'/','OP'),
             (r'<=','relational operator'),
             (r'<','relational operator'),
             (r'>=','relational operator'),
             (r'>','relational operator'),
             (r'<','relational operator'),
             (r'!=','relational operator'),
             (r'==','relational operator'),
             (r'=','operator'),
             (r'and','Statement'),
             (r'or','Statement'),
             (r'not','Statement'),
             (r'then','Statement'),
             (r'else','Statement'),
             (r'while','Statement'),
             (r'do','Statement'),
             (r'end','Statement'),
             (r'int','Type'),
             (r'float','Type'),
             (r'[-+]?\d+(\.\d*)?','num'),
             (r'[a-z]+[0-9]+?[a-z]+?','Variable'),]
#--------------------------------------------------
#-*-coding:utf-8-*-
import re
import sys
class Lexer(object):
    def __init__(self,characters,token_exprs):
        self.pos=0
        self.token_exprs=token_exprs
        self.characters=characters
    def get_next_token(self):
        while self.pos<len(self.characters):
            match=None
            for token_expr in self.token_exprs:
                patern,tag=token_expr
                regex=re.compile(patern)
                match=regex.match(self.characters,self.pos)
                if match:
                    text=match.group(0)
                    if text is not None and text ==' ':
                        self.pos+=1
                    if tag:
                     self.pos=match.end()
                     break
            if not match:
                sys.stderr.write('Illegal character:%s\n'% self.characters[self.pos])
                sys.exit(1)
            return Token(tag,text)

lexer=Lexer('do { - n ; if2b = a [ n ] ) break ; } while ( n ) ;',token_exprs)
print(lexer.get_next_token())
while lexer.get_next_token() != None:
    print(lexer.get_next_token())
