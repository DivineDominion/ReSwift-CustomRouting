//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
import UIKit

public class DashboardModule: Routable {

    let viewController: DashboardViewController

    public init(viewController: DashboardViewController = DashboardViewController()) {

        self.viewController = viewController
    }

    public func activate(in navigationController: UINavigationController) {

        navigationController.pushViewController(viewController, animated: true)
    }
}
