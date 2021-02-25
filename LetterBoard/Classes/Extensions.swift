import Foundation

extension Board {
    
    func asString() -> String {
        return "[ \(map { String($0) }.joined(separator: ", ")) ]"
    }
    
    // TODO: add other extension methods that may be helpful here...
    
    
    //TODO: funciones
    
    //Funcion para contar los caracteres de la izquierda
    
    func countLeft(letter: Character) -> Int {
        
        var index = 0
        
        //Ciclo de recorrido
        for c in self {
            
            // Condicion de reconocimiento de caracteres
            if c == letter {
                break
            }
            index+=1
        }
        return index
    }
    
    //Funcion para contar los caracteres de la derecha
    
    func countRight(letter: Character) -> Int {
        
        var index = 0
        
        //Ciclo de recorrido
        for c in self.reversed() {
            
            // Condicion de reconocimiento de caracteres
            if c == letter {
                break
            }
            index+=1
        }
        return index
    }
    
    
    //Funcion para remover el caracter encontrado
    
    mutating func removeCharacter (letter: Character){
        var index = 0
        
        for c in self {
            if c == letter {
                self.remove(at: index)
                break
            }
            index+=1
        }
    }
    
    //Funcion para realizar el retorno de Letter
    
    mutating func letterRetur (index: Int) -> Character{
        var countCharacter = 0
        
        var c1: Character = "c"
        
        for c in self {
            if countCharacter == index{
                c1 = c
                break
            }
            countCharacter+=1
        }
        return c1
        
        
        
    }
}
