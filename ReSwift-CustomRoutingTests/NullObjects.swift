//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
@testable import ReSwift_CustomRouting
import protocol ReSwift.Reducer
import protocol ReSwift.Action
import UIKit

struct NullReducer: ReSwift.Reducer {
    func handleAction(action: Action, state: AppState?) -> AppState {
        return state ?? AppState.default
    }
}

struct NullRoutable: Routable {
    func activate(in navigationController: UINavigationController) {
        // no op
    }
}

class NullRouter: Router {
    convenience init() {
        self.init(
            navigationController: UINavigationController(),
            dashboard: NullRoutable())
    }
}

func nullStore() -> DefaultStore {

    return DefaultStore(reducer: NullReducer(), state: nil)
}
