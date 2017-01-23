//  Copyright © 2017 ReSwift. All rights reserved.

public struct DetailViewModel: Equatable {

    public let previous: String
    public let current: String
    public let next: String

    public init(previous: String, current: String, next: String) {

        self.previous = previous
        self.current = current
        self.next = next
    }
}

public func ==(lhs: DetailViewModel, rhs: DetailViewModel) -> Bool {

    return lhs.previous == rhs.previous
        && lhs.current == rhs.current
        && lhs.next == rhs.next
}
