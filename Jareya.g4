// Jareya.g4
grammar Jareya;

program: statement+;

statement: 'print' expression ';' ;

expression: INT | ID;

INT: [0-9]+;
ID: [a-zA-Z]+;
WS: [ \t\r\n]+ -> skip;
