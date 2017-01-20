//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation

public func reduceRouting(_ action: Routing, state: AppState) -> AppState {

    var state = state
    state.route = action.route
    return state
}
