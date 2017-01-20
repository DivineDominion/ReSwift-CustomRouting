//  Copyright © 2017 ReSwift. All rights reserved.

import XCTest
@testable import ReSwift_CustomRouting

class RouterTests: XCTestCase {

    class MainNavigationDouble: MainNavigation {
        func append(routable: Routable) {
            // no op
        }

        var didActivate: Routable?
        func activate(routable: Routable) {
            didActivate = routable
        }
    }

    var irrelevantRoutable: Routable {
        return NullRoutable()
    }

    func testNewState_Nil_DoesNotActivateDashboard() {

        let dashboard = NullRoutable()
        let mainNavigationDouble = MainNavigationDouble()
        let router = Router(
            mainNavigation: mainNavigationDouble,
            dashboard: dashboard)

        router.newState(state: nil)

        XCTAssertNil(mainNavigationDouble.didActivate)
    }

    func testNewState_Dashboard_ActivatesDashboard() {

        let dashboard = NullRoutable()
        let mainNavigationDouble = MainNavigationDouble()
        let router = Router(
            mainNavigation: mainNavigationDouble,
            dashboard: dashboard)

        router.newState(state: .dashboard)

        XCTAssert((mainNavigationDouble.didActivate as? NullRoutable) === dashboard)
    }

    func testNewState_TwiceToDashboard_DoesNotReactivateDashboard() {

        let dashboard = NullRoutable()
        let mainNavigationDouble = MainNavigationDouble()
        let router = Router(
            mainNavigation: mainNavigationDouble,
            dashboard: dashboard)

        router.newState(state: .dashboard)
        mainNavigationDouble.didActivate = nil // Reset
        router.newState(state: .dashboard)

        XCTAssertNil(mainNavigationDouble.didActivate)
    }

}
