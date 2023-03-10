class List<T> {
    var value: T?
    var next: List<T>?

    convenience init(_ values: T...) {
        self.init(Array(values))
    }

    init(_ values: [T]) {
        value = values.first

        if values.count > 1 {
            next = List(Array(values.suffix(from: 1)))
        }
    }

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

        return next?[index - 1]
    }

    var length: Int {
        return value != nil ? 1 + (next?.length ?? 0) : 0
    }

    func debug() -> [T?] {
        if length == 0 {
            return []
        }

        var ret = [self[0]]

        ret.append(contentsOf: next?.debug() ?? [])

        return ret
    }

    func reverse() {
        var rest = next
        next = nil

        while rest != nil {
            let current = rest

            let tmp = List([])
            tmp.value = value
            tmp.next = next

            value = current?.value
            next = tmp

            rest = rest?.next
        }
    }

    func append(_ list: List) {
        if next == nil {
            next = list
        } else {
            next!.append(list)
        }
    }

    func flatten() -> List<T> {
        var acc = [T]()

        var current = self

        while current.next != nil {
            var stack = [List]()

            stack.append(current)

            while stack.count > 0 {
                if let node = stack.popLast() {
                    if let list = node.value as? List {
                        stack.append(list)
                    } else {
                        if node.value != nil {
                            acc.append(node.value!)
                        }

                        if node.next != nil {
                            stack.append(node.next!)
                        }
                    }
                }
            }

            current = current.next!
        }

        return List(acc)
    }
}

extension List: Equatable where T: Equatable {
    static func == (lhs: List, rhs: List) -> Bool {
        if lhs.length == 0, rhs.length == 0 { return true }
        if lhs.length != rhs.length { return false }

        for index in 0 ... lhs.length - 1 {
            if lhs[index] != rhs[index] { return false }
        }

        return true
    }

    func isPalindrome() -> Bool {
        if length < 2 { return true }

        let middle = length / 2 // do not include it

        for index in 0 ..< middle {
            if self[index] != self[length - index - 1] { return false }
        }

        return true
    }

    func compress() {
        var current = self
        var rest = next

        while rest != nil {
            if current.value == rest!.value {
                current.next = nil
            } else {
                current.next = rest
                current = rest!
            }

            rest = rest!.next
        }
    }
}
