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
class MyIRGenerator(MyLanguageBaseVisitor):
    def __init__(self):
        self.ir_code = []

    def visitDeclaration(self, ctx):
        # Do nothing for now, can be extended for LLVM IR generation
        pass

    def visitAssignment(self, ctx):
        var_name = ctx.getChild(0).getText()
        expr_code = self.visit(ctx.getChild(2))

        llvm_code = f"{var_name} = {expr_code}"
        self.ir_code.append(llvm_code)

    def visitExpression(self, ctx):
        # Simplified expression handling, adjust based on your language
        left_code = self.visit(ctx.getChild(0))
        right_code = self.visit(ctx.getChild(2))
        return f"{left_code} + {right_code}"

    # Implement similar methods for other rules

# Usage
ir_generator = MyIRGenerator()
llvm_ir_code = ir_generator.visit(tree)

# Print or save the LLVM IR code as needed
for code_line in ir_generator.ir_code:
    print(code_line)

semantic_analyzer = MySemanticAnalyzer()
semantic_analyzer.visit(tree)
