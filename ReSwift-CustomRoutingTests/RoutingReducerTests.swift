//  Copyright © 2017 ReSwift. All rights reserved.

import XCTest
@testable import ReSwift_CustomRouting

class RoutingReducerTests: XCTestCase {

    var irrelevantDetailState: DetailState {
        return DetailState(deck: Deck(previous: 890, current: 4, next: 22))
    }
    
    func testRouting_ToDashbaord_EmptyState_SetsRouteSubstate() {

        let state = AppState.default
        let action = Routing(to: .dashboard)

        let result = MainReducer().handleAction(action: action, state: state)

        XCTAssertEqual(result, AppState(route: .dashboard))
    }

    func testRouting_ToDashbaord_FromDetail_SetsRouteSubstate() {

        let state = AppState(route: .detail(irrelevantDetailState))
        let action = Routing(to: .dashboard)

        let result = MainReducer().handleAction(action: action, state: state)

        XCTAssertEqual(result, AppState(route: .dashboard))
    }

    func testRouting_ToDetail_EmptyState_SetsRouteSubstate() {

        let state = AppState.default
        let route = AppRoute.detail(irrelevantDetailState)
        let action = Routing(to: route)

        let result = MainReducer().handleAction(action: action, state: state)

        XCTAssertEqual(result, AppState(route: route))
    }

    func testRouting_ToDetail_FromDashboard_SetsRouteSubstate() {

        let state = AppState(route: .dashboard)
        let route = AppRoute.detail(irrelevantDetailState)
        let action = Routing(to: route)

        let result = MainReducer().handleAction(action: action, state: state)

        XCTAssertEqual(result, AppState(route: route))
    }

}
