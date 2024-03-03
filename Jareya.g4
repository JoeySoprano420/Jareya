// Jareya.g4
grammar Jareya;

program: statement+;

statement: 'print' expression ';' ;

expression: INT | ID;

INT: [0-9]+;
ID: [a-zA-Z]+;
WS: [ \t\r\n]+ -> skip;

// MyLanguage.g4
grammar MyLanguage;

// ... (grammar rules)
class MySemanticAnalyzer(MyLanguageBaseVisitor):
    def __init__(self):
        self.symbol_table = {}

    def visitDeclaration(self, ctx):
        var_type = ctx.getChild(0).getText()
        var_name = ctx.getChild(1).getText()

        if var_name in self.symbol_table:
            print(f"Error: Variable {var_name} already declared.")
        else:
            self.symbol_table[var_name] = var_type

    def visitAssignment(self, ctx):
        var_name = ctx.getChild(0).getText()

        if var_name not in self.symbol_table:
            print(f"Error: Variable {var_name} not declared.")
        else:
            # Check for type consistency if needed

    # Implement similar methods for other rules

# Usage
lexer = MyLanguageLexer(input_stream)
tokens = CommonTokenStream(lexer)
parser = MyLanguageParser(tokens)
tree = parser.program()

semantic_analyzer = MySemanticAnalyzer()
semantic_analyzer.visit(tree)
