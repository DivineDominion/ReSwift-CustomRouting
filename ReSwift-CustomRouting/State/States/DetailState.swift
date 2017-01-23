//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
import protocol ReSwift.StateType

public struct DetailState: StateType, Equatable {

    var deck: Deck
}

public func ==(lhs: DetailState, rhs: DetailState) -> Bool {

    return lhs.deck == rhs.deck
}
