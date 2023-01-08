extension Int {
    func isPrime() -> Bool {
        if self < 1 { return false }

        if self == 2 || self == 3 {
            return true
        }

        if self % 2 == 0 || self % 3 == 0 {
            return false
        }

        /*
         Any number can be represented as:

         6k, 6k + 1, 6k + 2, 6k + 3, 6k + 4, 6k + 5

         6k, 6k+2, and 6k+4 are divisible by 2

         6k + 3 is divisible by 3

         So if there's going to be a prime,
         it'll be of the form 6k + 1, or 6k + 5
         */

        var index = 5

        while index * index < self {
            // test if self is 6k + 5 or 6k + 5 + 2 => 6k + 1
            if self % index == 0 || self % (index + 2) == 0 {
                return false
            }

            index += 6
        }

        return true
    }

    static func gcd(_ left: Int, _ right: Int) -> Int {
        if left < 0 { return gcd(-left, right) }
        if right < 0 { return gcd(left, -right) }
        if right == 0 { return left }

        return gcd(right, left % right)
    }

    func isCoprimeTo(_ other: Int) -> Bool {
        Int.gcd(self, other) == 1
    }
}
