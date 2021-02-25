import Foundation

class LetterBoard {
   
    static func solveLetterBoard(board: Board, word: String) -> Moves {
        
        //Variables
        var moves = Moves()
        var jump: Bool = false
       
        if word.first == board.first {
            moves.append(.init(direction: .left, letter: word.first))
        }
        
        else if word.last == board.last {
            moves.append(.init(direction: .right, letter: word.last))
        }
        
        else {

            //Variables
            var index = 0
            var myBoard = board
            
            for c in word {
                
                //Obteniendo la distancia mas corta
                
                let myDirection: Direction = shorterDistance(letter: c, board: myBoard)
                index = position (letter: c, board: myBoard)
                
                
                //Recorriendo distancia por la parte izquierda
                
                if myDirection == .left {
                    for i in 0...index {
                        if i == index {
                            moves.append(.init(direction: myDirection, letter: c))
                            myBoard.removeCharacter(letter: c)
                            break
                        }
                        else{
                            moves.append(.init(direction: myDirection))
                            myBoard = changeDirection(letter: myBoard.letterRetur(index: 0), myDirection: myDirection, myBoard: myBoard)
                        }
                    }
                }
                
                //Recorriendo distancia por la parte derecha
                
                if myDirection == .right {
                    let indexMax = myBoard.count - 1
                    for i in (index...indexMax).reversed() {
                        if jump {continue}
                        if i == (indexMax - index) {
                            moves.append(.init(direction: myDirection, letter: c))
                            myBoard.removeCharacter(letter: c)
                            jump = true
                            break
                        }
                        
                        else{
                            moves.append(.init(direction: myDirection))
                            myBoard = changeDirection(letter: myBoard.letterRetur(index: i), myDirection: myDirection, myBoard: myBoard)
                        }
                    }
                    
                }
                
            }
        }
    
        // TODO: write your solution here. Do not change the method signature in any way, or validation of your solution will fail.
            
        return moves
    }
    
    // TODO: funciones
    //Camboar la direccion del board
    static func changeDirection (letter: Character, myDirection: Direction, myBoard: Board) -> Board{
        var board = myBoard
        
        var index = 0
        for c in board {
            if c == letter {
                
                board.removeCharacter(letter: letter)
                
                //Inserta al final
                if myDirection == .left {
                    board.append(c)
                }
                
                //Permite insertar al inicio
                if myDirection == .right{
                    board.insert(c, at: 0)
                }
                break
            }
            index+=1
        }
        return board
    }
    
    //Determina la distancia mas corta
    static func shorterDistance(letter: Character, board: Board) -> Direction {
        let indexLeft = board.countLeft(letter: letter)
        let indexRight = board.countRight(letter: letter)
        var myDirection: Direction = .left
        
        if indexRight >= indexLeft{
            myDirection = .left
        }
        
        if indexRight < indexLeft {
            myDirection = .right
        }
        
        return myDirection
    }
    
    //Funcion que determina la posicion
    static func position (letter: Character, board: Board) -> Int {
        
        let indexLeft = board.countLeft(letter: letter)
        let indexRight = board.countRight(letter: letter)
        
        var index: Int = 0
        
        if indexRight>indexLeft {
            index = indexLeft
        }
        
        if indexRight <= indexLeft {
            index = indexRight
        }
        
        if indexRight == indexLeft {
            index = indexLeft
        }
        
        return index
    }
    
    
    
}
