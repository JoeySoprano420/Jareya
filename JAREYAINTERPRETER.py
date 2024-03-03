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
