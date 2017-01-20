//  Copyright © 2017 ReSwift. All rights reserved.

import UIKit
import ReSwift

public protocol Routable {

    var rootViewController: UIViewController { get }
}

public protocol MainNavigation {

    func append(routable: Routable)
    func activate(routable: Routable)
}

public class Router: StoreSubscriber {

    let mainNavigation: MainNavigation
    let dashboard: Routable

    var currentRoute: AppRoute?

    public init(
        mainNavigation: MainNavigation,
        dashboard: Routable) {

        self.mainNavigation = mainNavigation
        self.dashboard = dashboard
    }

    public func newState(state: AppRoute?) {

        guard let route = state,
            route != currentRoute
            else { return }

        activate(route: route)
    }

    fileprivate func activate(route: AppRoute) {

        self.currentRoute = route

        switch route {
        case .dashboard:
            mainNavigation.activate(routable: dashboard)
        case .detail: fatalError("not implemented")
        }
    }
}
