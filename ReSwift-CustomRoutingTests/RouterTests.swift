//  Copyright © 2017 ReSwift. All rights reserved.

import XCTest
@testable import ReSwift_CustomRouting

class RouterTests: XCTestCase {

    class MainNavigationDouble: NullMainNavigation {
        var didActivate: Routable?
        override func activate(routable: Routable) {
            didActivate = routable
        }
    }

    var irrelevantRoutable: Routable {
        return NullRoutable()
    }

    func routerComponents() -> (router: Router, dashboard: NullRoutable, detail: NullRoutable, mainNavigationDouble: MainNavigationDouble) {

        let dashboard = NullRoutable()
        let detail = NullRoutable()
        let mainNavigationDouble = MainNavigationDouble()
        let router = Router(
            mainNavigation: mainNavigationDouble,
            dashboard: dashboard,
            detail: detail)

        return (router, dashboard, detail, mainNavigationDouble)
    }

    func testNewState_Nil_DoesNotActivateDashboard() {

        let (router, _, _, mainNavigationDouble) = routerComponents()

        router.newState(state: nil)

        XCTAssertNil(mainNavigationDouble.didActivate)
    }

    func testNewState_Dashboard_ActivatesDashboard() {

        let (router, dashboard, _, mainNavigationDouble) = routerComponents()

        router.newState(state: .dashboard)

        XCTAssert((mainNavigationDouble.didActivate as? NullRoutable) === dashboard)
    }

    func testNewState_TwiceToDashboard_DoesNotReactivateDashboard() {

        let (router, _, _, mainNavigationDouble) = routerComponents()

        router.newState(state: .dashboard)
        mainNavigationDouble.didActivate = nil // Reset
        router.newState(state: .dashboard)

        XCTAssertNil(mainNavigationDouble.didActivate)
    }

    func testNewState_Detail_ActivatesDetail() {

        let (router, _, detail, mainNavigationDouble) = routerComponents()

        router.newState(state: .detail)

        XCTAssert((mainNavigationDouble.didActivate as? NullRoutable) === detail)
    }

    func testNewState_Detail_DoesNotReactivateDetail() {

        let (router, _, _, mainNavigationDouble) = routerComponents()

        router.newState(state: .detail)
        mainNavigationDouble.didActivate = nil // Reset
        router.newState(state: .detail)

        XCTAssertNil(mainNavigationDouble.didActivate)
    }


}
