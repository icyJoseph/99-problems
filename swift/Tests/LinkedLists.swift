@testable import LinkedLists

import XCTest

class LinkedListTests: XCTestCase {
    func testLast() {
        let source = (0 ..< 100).map { _ in Int.random(in: 1 ... 10) }

        let expected = source.last

        let linked = List(source)

        XCTAssertEqual(expected, linked?.last)

        let empty = List<Int>([])

        XCTAssertNil(empty)
    }

    func testPennultimate() {
        let source = [0, 1, 2, 3, 4]

        let expected = source[source.count - 2]

        let linked = List(source)

        XCTAssertEqual(expected, linked?.pennultimate)
        XCTAssertNotEqual(linked?.last, linked?.pennultimate)

        let empty = List<Int>([])

        XCTAssertNil(empty)

        let unit = List([0])

        XCTAssertEqual(0, unit?.pennultimate)
    }

    func testSubscript() {
        let source = [-1, -2, 0, 1, 2]

        let linked = List(source)

        XCTAssertEqual(linked![0], -1)
        XCTAssertEqual(linked![2], 0)
        XCTAssertEqual(linked![source.count - 1], 2)
    }
}
