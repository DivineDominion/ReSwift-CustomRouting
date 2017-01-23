//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation

/// A "deck of numbers". Makes not a lot of sense, but it will
/// do as a model :)
public struct Deck: Equatable {
    public let previous: Int
    public let current: Int
    public let next: Int
}

public func ==(lhs: Deck, rhs: Deck) -> Bool {

    return lhs.previous == rhs.previous
        && lhs.current == rhs.current
        && lhs.next == rhs.next
}
