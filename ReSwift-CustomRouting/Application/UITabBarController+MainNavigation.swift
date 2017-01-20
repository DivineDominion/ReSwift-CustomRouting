//  Copyright © 2017 ReSwift. All rights reserved.

import UIKit

extension UITabBarController: MainNavigation {

    public func append(routable: Routable) {

        var viewControllers = self.viewControllers ?? []

        viewControllers.append(routable.rootViewController)

        self.viewControllers = viewControllers
    }

    public func activate(routable: Routable) {

        guard let index = viewControllers?.index(of: routable.rootViewController)
            else { preconditionFailure("Routable's rootViewController not found inside tab bar controller") }

        self.selectedIndex = index
    }
}
