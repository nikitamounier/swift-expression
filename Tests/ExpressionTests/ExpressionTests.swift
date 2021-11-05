import XCTest
@testable import Expression

final class swift_expressionTests: XCTestCase {
    func testIfElse() {
        let number = 10
        let evenOrOdd = expression {
            if (number & 1) != 1 {
                "\(number) is even!"
            } else {
                "\(number) is odd!"
            }
        }
        
        XCTAssertEqual(evenOrOdd, "10 is even!")
    }
    
    func testSwitch() {
        let number = 11
        let evenOrOdd = expression {
            switch (number & 1) != 1 {
            case true: "\(number) is even!"
            case false: "\(number) is odd!"
            }
        }
        
        XCTAssertEqual(evenOrOdd, "11 is odd!")
    }
}
