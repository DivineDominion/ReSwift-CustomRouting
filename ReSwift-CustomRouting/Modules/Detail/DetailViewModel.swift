//  Copyright © 2017 ReSwift. All rights reserved.

public struct DetailViewModel {

    public let previous: String
    public let current: String
    public let next: String

    public init(previous: String, current: String, next: String) {

        self.previous = previous
        self.current = current
        self.next = next
    }
}
