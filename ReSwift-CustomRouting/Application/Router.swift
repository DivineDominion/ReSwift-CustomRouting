//  Copyright © 2017 ReSwift. All rights reserved.

import UIKit
import ReSwift

public protocol Routable {

    var rootViewController: UIViewController { get }
}

public protocol MainNavigation {

    func configure(routables: [Routable])
    func activate(routable: Routable)
}

public class Router: StoreSubscriber {

    let mainNavigation: MainNavigation
    let dashboard: Routable
    let detail: Routable

    var currentRoute: AppRoute?

    public init(
        mainNavigation: MainNavigation,
        dashboard: Routable,
        detail: Routable) {

        self.mainNavigation = mainNavigation
        self.dashboard = dashboard
        self.detail = detail
    }

    public func newState(state: AppRoute?) {

        guard let route = state,
            route != currentRoute
            else { return }

        activate(route: route)
    }

    fileprivate func activate(route: AppRoute) {

        self.currentRoute = route

        let routable = self.routable(for: route)
        mainNavigation.activate(routable: routable)
    }

    fileprivate func routable(for route: AppRoute) -> Routable {

        switch route {
        case .dashboard: return dashboard
        case .detail: return detail
        }
    }
}
