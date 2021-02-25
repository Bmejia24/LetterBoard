import XCTest
@testable import LetterBoard

class LetterBoardTests: XCTestCase {
    
    func testLetterBoardUsingCat() {
        let testBoard: Board = [ "a", "z", "c", "t", "v", "a" ]
        let word = "cat"
        
        print("Testing word \(word) in board \(testBoard.asString())")
        
        let moves = LetterBoard.solveLetterBoard(board: testBoard, word: word)
        let expected = [
        
            //  [ "a", "z", "c", "t", "v", "a" ]
            /* c */ Move(direction: Direction.left),
                    Move(direction: Direction.left),
                    Move(direction: Direction.left, letter: "c"),
            //  [ "a", "z", "t", "v", "a" ]
            /* a */ Move(direction: Direction.right),
                    Move(direction: Direction.right, letter: "a"),
            //  [ "a", "z", "t", "v", ]
            /* t */ Move(direction: Direction.left),
                    Move(direction: Direction.left, letter: "t")
                       ]
        
        XCTAssertEqual(expected, moves)
    }
    
   func testLetterBoardUsingTV() {
        let testBoard: Board = [ "a", "z", "c", "t", "v", "a" ]
        let word = "tv"
        
        print("Testing word \(word) in board \(testBoard.asString())")
        
        let moves = LetterBoard.solveLetterBoard(board: testBoard, word: word)
        let expected = [
            
            //  [ "a", "z", "c", "t", "v", "a" ]
            /* t */ Move(direction: Direction.right),
                    Move(direction: Direction.right),
                    Move(direction: Direction.right, letter: "t"),
            //  [ "a", "z", "c", "v", "a" ]
            /* v */ Move(direction: Direction.left, letter: "v")
        ]
        
        XCTAssertEqual(expected, moves)
    }
    
}
