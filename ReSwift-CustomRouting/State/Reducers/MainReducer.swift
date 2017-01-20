//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
import ReSwift

public struct MainReducer: Reducer {

    public func handleAction(action: Action, state: AppState?) -> AppState {

        return state ?? AppState.default
    }
}
