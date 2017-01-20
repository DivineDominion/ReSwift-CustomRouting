//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
import ReSwift
import UIKit

public protocol Routable {

    func activate(in navigationController: UINavigationController)
}

public class Router: StoreSubscriber {

    let navigationController: UINavigationController
    let dashboard: Routable

    var currentRoute: AppRoute?

    public init(
        navigationController: UINavigationController,
        dashboard: Routable) {

        self.navigationController = navigationController
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
            dashboard.activate(in: navigationController)
        case .detail: fatalError("not implemented")
        }
    }
}
