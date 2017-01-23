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
    let configuration: RouterConfiguration

    var currentRoute: AppRoute?

    public init(
        mainNavigation: MainNavigation,
        configuration: RouterConfiguration) {

        self.mainNavigation = mainNavigation
        self.configuration = configuration
    }

    public func newState(state: AppRoute?) {

        guard let route = state,
            route != currentRoute
            else { return }

        activate(route: route)
    }

    fileprivate func activate(route: AppRoute) {

        self.currentRoute = route

        let routable = configuration.routable(for: route)
        mainNavigation.activate(routable: routable)
    }
}
