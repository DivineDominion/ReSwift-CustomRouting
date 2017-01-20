//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
import ReSwift

public struct MainReducer: Reducer {

    public func handleAction(action: Action, state: AppState?) -> AppState {

        let state = state ?? AppState.default

        switch action {
        case let routing as Routing:
            return reduceRouting(routing, state: state)
        default: return state
        }
    }
}
