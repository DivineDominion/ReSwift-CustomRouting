//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
import protocol ReSwift.StateType

public struct AppState: StateType, Equatable {

    public static var `default`: AppState {
        return AppState(route: nil)
    }

    public var route: AppRoute?

    public init(route: AppRoute? = nil) {

        self.route = route
    }
}

public func ==(lhs: AppState, rhs: AppState) -> Bool {

    return lhs.route == rhs.route
}
