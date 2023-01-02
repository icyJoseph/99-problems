import XCTest

class List<T> {
    var value: T
    var next: List<T>?

    convenience init?(_ values: T...) {
        self.init(Array(values))
    }

    init?(_ values: [T]) {
        guard let first = values.first else {
            return nil
        }

        value = first

        next = List(Array(values.suffix(from: 1)))
    }
}

extension List {
    var last: T? {
        var current = self
        while let node = current.next {
            current = node
        }

        return current.value
    }
}

func main() {
    if let list = List([1, 2, 3, 4]), let last = list.last {
        print(last, last == 4)
    }

    if let list = List([-1, 22, 113, 224]), let last = list.last {
        print(last, last == 224)
    }
}

func testLinkedListLast() {
    let source = Array(0 ..< 100)

    let expected = source.last

    if let list = List(source), let last = list.last {
        XCTAssertEqual(expected, last)
    }
}
