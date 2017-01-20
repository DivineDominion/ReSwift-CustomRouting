//  Copyright © 2017 ReSwift. All rights reserved.

import ReSwift

public typealias DefaultStore = Store<AppState>

func createStore() -> DefaultStore {

    return Store(
        reducer: MainReducer(),
        state: nil,
        middleware: [loggingMiddleware])
}
