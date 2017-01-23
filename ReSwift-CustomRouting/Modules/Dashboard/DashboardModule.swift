//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
import UIKit

public class DashboardModule: Routable {

    let dashboardViewController: DashboardViewController

    public var rootViewController: UIViewController {
        return dashboardViewController
    }

    public var route: AppRoute {
        return .dashboard
    }
    
    public init(dashboardViewController: DashboardViewController = DashboardViewController()) {

        self.dashboardViewController = dashboardViewController
    }
}
