//  Copyright © 2017 ReSwift. All rights reserved.

import XCTest
@testable import ReSwift_CustomRouting

class RoutingReducerTests: XCTestCase {
    
    func testRouting_ToDashbaord_EmptyState_SetsRouteSubstate() {

        let state = AppState.default
        let action = Routing(to: .dashboard)

        let result = MainReducer().handleAction(action: action, state: state)

        XCTAssertEqual(result, AppState(route: .dashboard))
    }

    func testRouting_ToDashbaord_FromDetail_SetsRouteSubstate() {

        let state = AppState(route: .detail)
        let action = Routing(to: .dashboard)

        let result = MainReducer().handleAction(action: action, state: state)

        XCTAssertEqual(result, AppState(route: .dashboard))
    }

    func testRouting_ToDetail_EmptyState_SetsRouteSubstate() {

        let state = AppState.default
        let action = Routing(to: .detail)

        let result = MainReducer().handleAction(action: action, state: state)

        XCTAssertEqual(result, AppState(route: .detail))
    }

    func testRouting_ToDetail_FromDashboard_SetsRouteSubstate() {

        let state = AppState(route: .dashboard)
        let action = Routing(to: .detail)

        let result = MainReducer().handleAction(action: action, state: state)

        XCTAssertEqual(result, AppState(route: .detail))
    }

}
