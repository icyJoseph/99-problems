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

    var pennultimate: T? {
        var current = self

        while let node = current.next {
            if node.next == nil {
                return current.value
            }
            current = node
        }

        return current.value
    }

    subscript(index: Int) -> T? {
        if index == 0 { return value }

        return self[index - 1]
    }
}
