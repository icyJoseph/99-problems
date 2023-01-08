@testable import Arithmetic

import XCTest

class ArithmeticTest: XCTestCase {
    func testIsPrime() {
        XCTAssertTrue(3.isPrime())
        XCTAssertTrue(7.isPrime())
        XCTAssertTrue(11.isPrime())
        XCTAssertTrue(127.isPrime())
        XCTAssertTrue(2.isPrime())

        XCTAssertFalse(4.isPrime())
        XCTAssertFalse(8.isPrime())
        XCTAssertFalse(12.isPrime())
        XCTAssertFalse(343.isPrime())
        XCTAssertFalse((3 * Int.random(in: 123 ... 147)).isPrime())
    }

    func testGCD() {
        XCTAssertEqual(Int.gcd(4, 8), 4)
        XCTAssertEqual(Int.gcd(12, 16), 4)
        XCTAssertEqual(Int.gcd(20, 25), 5)
        XCTAssertEqual(Int.gcd(-24, -12), 12)
    }

    func testCoprime() {
        XCTAssertTrue(35.isCoprimeTo(64))
        XCTAssertTrue(37.isCoprimeTo(23))
        XCTAssertTrue(24.isCoprimeTo(5))

        XCTAssertFalse(36.isCoprimeTo(64))
        XCTAssertFalse(24.isCoprimeTo(6))
    }
}
