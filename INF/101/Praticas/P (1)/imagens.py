from PIL import Image

class Imagem(object):

    largura = altura = 0

    def initVars( self ):
        self._inGetSet = False
        self._y = 0
    
    def abrir( self, filename ):
        self.initVars()
        self.im = Image.open( filename )
        self.largura, self.altura = self.im.size
        
    def __init__( self, filename='' ):
        if filename == '':
            self.initVars()
        else: self.abrir( filename )
        
    def mostrar( self ):
        self.im.show()
        
    def copia( self ):
        im2 = Imagem()
        im2.im = self.im.copy()
        im2.largura = self.largura
        im2.altura = self.altura
        return im2
        
    def salvar( self, filename ):
        self.im.save( filename, 'png')
        
    def __getitem__(self, yx):
        if self._inGetSet:
            self._inGetSet = False
            return self.im.getpixel( (yx, self._y) )
        else:
            self._inGetSet = True
            self._y = yx
            return self
    
    def __setitem__(self, yx, pixel):
        if self._inGetSet:
            self._inGetSet = False
            self.im.putpixel( (yx, self._y), pixel )
        else:
            self._inGetSet = True
            self._y = yx
            return self

"""
board[x][y] means board.__getitem__(x).__getitem__(y),
so Board.__getitem__ has to return some kind of view that
also supports __getitem__ and remembers x. This is a bit
of work, but for some use cases (anything involving passing
that view around) it's very convenient.

Another option is board[x, y], which means board.__getitem__((x, y)).
Note that this passes a tuple to __getitem__, which you'll
have to unpack manually (there is syntactic sugar for doing
this in 2.x, but it's a bit obscure and also gone in 3.x,
so you may want to avoid it in the interest of future porting work).
"""
