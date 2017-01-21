//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
@testable import ReSwift_CustomRouting
import protocol ReSwift.Reducer
import protocol ReSwift.Action
import UIKit

struct NullMainNavigation: MainNavigation {

    func append(routable: Routable) {
        // no op
    }

    func activate(routable: Routable) {
        // no op
    }
}

struct NullReducer: ReSwift.Reducer {
    func handleAction(action: Action, state: AppState?) -> AppState {
        return state ?? AppState.default
    }
}

class NullRoutable: Routable {
    var rootViewController: UIViewController { return UIViewController() }
}

class NullRouter: Router {
    convenience init() {
        self.init(
            mainNavigation: NullMainNavigation(),
            dashboard: NullRoutable(),
            detail: NullRoutable())
    }
}

func nullStore() -> DefaultStore {

    return DefaultStore(reducer: NullReducer(), state: nil)
}
