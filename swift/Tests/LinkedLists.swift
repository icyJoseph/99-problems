@testable import LinkedLists

import XCTest

class LinkedListTests: XCTestCase {
    func testLast() {
        let list = (0 ..< 100).map { _ in Int.random(in: 1 ... 10) }

        let expected = list.last

        let linked = List(list)

        XCTAssertEqual(expected, linked?.last)

        let empty = List<Int>([])

        XCTAssertNil(empty)
    }
}
