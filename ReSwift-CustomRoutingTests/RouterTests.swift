//  Copyright © 2017 ReSwift. All rights reserved.

import XCTest
@testable import ReSwift_CustomRouting

class RouterTests: XCTestCase {

    class RoutableDouble: Routable {
        var didActivateIn: UINavigationController?
        func activate(in navigationController: UINavigationController) {
            didActivateIn = navigationController
        }
    }

    var irrelevantRoutable: Routable {
        return RoutableDouble()
    }

    func testNewState_Nil_DoesNotActivateDashboard() {

        let dashboard = RoutableDouble()
        let navigationController = UINavigationController()
        let router = Router(
            navigationController: navigationController,
            dashboard: dashboard)

        router.newState(state: nil)

        XCTAssertNil(dashboard.didActivateIn)
    }

    func testNewState_Dashboard_ActivatesDashboard() {

        let dashboard = RoutableDouble()
        let navigationController = UINavigationController()
        let router = Router(
            navigationController: navigationController,
            dashboard: dashboard)

        router.newState(state: .dashboard)

        XCTAssert(dashboard.didActivateIn === navigationController)
    }

    func testNewState_TwiceToDashboard_DoesNotReactivateDashboard() {

        let dashboard = RoutableDouble()
        let navigationController = UINavigationController()
        let router = Router(
            navigationController: navigationController,
            dashboard: dashboard)

        router.newState(state: .dashboard)
        dashboard.didActivateIn = nil // Reset
        router.newState(state: .dashboard)

        XCTAssertNil(dashboard.didActivateIn)
    }

}
