@testable import LinkedLists

import XCTest

class LinkedListTests: XCTestCase {
    func testLast() {
        let source = (0 ... 100).map { _ in Int.random(in: 1 ... 10) }

        let expected = source.last

        let linked = List(source)

        XCTAssertEqual(expected, linked.last)

        let empty = List<Int>([])

        XCTAssertNil(empty.value)
    }

    func testPennultimate() {
        let source = [0, 1, 2, 3, 4]

        let expected = source[source.count - 2]

        let linked = List(source)

        XCTAssertEqual(expected, linked.pennultimate)
        XCTAssertNotEqual(linked.last, linked.pennultimate)

        let empty = List<Int>([])

        XCTAssertNil(empty.value)

        let unit = List([0])

        XCTAssertEqual(0, unit.pennultimate)
    }

    func testSubscript() {
        let source = [-1, -2, 0, 1, 2]

        let linked = List(source)

        XCTAssertEqual(linked[0], -1)
        XCTAssertEqual(linked[2], 0)
        XCTAssertEqual(linked[source.count - 1], 2)
    }

    func testLength() {
        let source = Array(0 ... Int.random(in: 10 ... 20))

        let linked = List(source)

        XCTAssertEqual(source.count, linked.length)

        XCTAssertEqual(0, List<Int>().length)
    }

    func testReverse() {
        var linked = List(0, 1)
        linked.reverse()

        XCTAssertEqual(linked, List(1, 0))

        linked = List(0, 1, 2, 3)
        linked.reverse()

        XCTAssertEqual(List(3, 2, 1, 0), linked)

        linked = List<Int>()

        linked.reverse()

        XCTAssertEqual(List<Int>(), linked)
    }

    func testIsPalindrome() {
        var linked = List(0, 1, 2, 3)

        XCTAssertFalse(linked.isPalindrome())

        linked = List(3, 1, 2, 3)

        XCTAssertFalse(linked.isPalindrome())

        linked = List(1, 2, 3, 2, 1)

        XCTAssertTrue(linked.isPalindrome())

        linked = List(1, 2, 2, 1)

        XCTAssertTrue(linked.isPalindrome())

        // edge cases

        linked = List<Int>()
        XCTAssertTrue(linked.isPalindrome())

        linked = List(0)
        XCTAssertTrue(linked.isPalindrome())
    }

    func testFlatten() {
        let linked = List<Any>(List<Any>(1, 1), 2, List<Any>(3, List<Any>(5, 8)))

        let flat = linked.flatten()

        XCTAssertEqual(flat.length, 6)
        XCTAssertEqual(flat.debug().compactMap { $0 as? Int }, [1, 1, 2, 3, 5, 8])
    }

    func testCompress() {
        let linked = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")
        linked.compress()
        XCTAssertEqual(linked, List("a", "b", "c", "a", "d", "e"))

        let linked2 = List(0, 0, 0, 0, 0)
        linked2.compress()
        XCTAssertEqual(linked2, List(0))
    }
}
