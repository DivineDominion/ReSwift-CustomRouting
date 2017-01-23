//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
import protocol ReSwift.StateType

public enum AppRoute: StateType, Equatable {

    case dashboard
    case detail(DetailState)
}

public func ==(lhs: AppRoute, rhs: AppRoute) -> Bool {

    switch (lhs, rhs) {
    case (.dashboard, .dashboard):
        return true

    case let (.detail(lDetail),
              .detail(rDetail)):
        return lDetail == rDetail

    default: return false
    }
}
