//  Copyright © 2017 ReSwift. All rights reserved.

import UIKit

extension UITabBarController: MainNavigation {

    public func configure(routables: [Routable]) {

        self.viewControllers = routables
            .map { $0.rootViewController }
    }

    public func activate(routable: Routable) {

        guard let index = viewControllers?.index(of: routable.rootViewController)
            else { preconditionFailure("Routable's rootViewController not found inside tab bar controller") }

        self.selectedIndex = index
    }
}
