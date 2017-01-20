//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
import ReSwift_CustomRouting
import protocol ReSwift.Reducer
import protocol ReSwift.Action

struct NullReducer: ReSwift.Reducer {
    func handleAction(action: Action, state: AppState?) -> AppState {
        return state ?? AppState.default
    }
}

func nullStore() -> DefaultStore {

    return DefaultStore(reducer: NullReducer(), state: nil)
}
