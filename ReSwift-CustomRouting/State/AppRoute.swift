//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
import protocol ReSwift.StateType

public enum AppRoute: StateType, Equatable {

    case dashboard
    case detail
}

public func ==(lhs: AppRoute, rhs: AppRoute) -> Bool {

    switch (lhs, rhs) {
    case (.detail, .detail),
         (.dashboard, .dashboard):
        return true
    default: return false
    }
}
