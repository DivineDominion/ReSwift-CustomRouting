//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
import protocol ReSwift.StateType

public struct DetailState: StateType, Equatable {

    public static var `default`: DetailState {
        return DetailState(deck: Deck(previous: 0, current: 1, next: 2))
    }
    
    public var deck: Deck

    public init(deck: Deck) {

        self.deck = deck
    }

    public init?(selectFrom appState: AppState) {

        guard let route = appState.route,
            case .detail(let detailState) = route
            else { return nil }

        self = detailState
    }
}

public func ==(lhs: DetailState, rhs: DetailState) -> Bool {

    return lhs.deck == rhs.deck
}
