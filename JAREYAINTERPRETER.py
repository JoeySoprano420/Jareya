from antlr4 import InputStream, CommonTokenStream
from JareyaLexer import JareyaLexer
from JareyaParser import JareyaParser

class JareyaInterpreter:
    def visitPrintStatement(self, ctx):
        value = self.visit(ctx.expression())
        print(value)

    def visitInt(self, ctx):
        return int(ctx.INT().getText())

    def visitId(self, ctx):
        # For simplicity, just return the identifier as a string
        return ctx.ID().getText()

    def visitExpression(self, ctx):
        return self.visit(ctx.getChild(0))

def main():
    input_stream = InputStream("print 42;")
    lexer = JareyaLexer(input_stream)
    token_stream = CommonTokenStream(lexer)
    parser = JareyaParser(token_stream)
    tree = parser.program()

    interpreter = JareyaInterpreter()
    interpreter.visit(tree)

if __name__ == "__main__":
    main()
# Main.py
from antlr4 import CommonTokenStream, InputStream
from MyLanguageLexer import MyLanguageLexer
from MyLanguageParser import MyLanguageParser
from MyInterpreter import MySemanticAnalyzer, MyIRGenerator

# Read input source code
source_code = "your source code here"

# Create lexer and parser
lexer = MyLanguageLexer(InputStream(source_code))
tokens = CommonTokenStream(lexer)
parser = MyLanguageParser(tokens)

# Parse source code
tree = parser.program()

# Semantic analysis
semantic_analyzer = MySemanticAnalyzer()
semantic_analyzer.visit(tree)

# Generate LLVM IR code
ir_generator = MyIRGenerator()
llvm_ir_code = ir_generator.visit(tree)

# ... (execute or save the LLVM IR code)
