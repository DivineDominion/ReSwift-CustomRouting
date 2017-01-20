//  Copyright © 2017 ReSwift. All rights reserved.

import XCTest
@testable import ReSwift_CustomRouting
import ReSwift

class AppTests: XCTestCase {
    
    let storeDouble = nullStore()

    var irrelevantRouter: Router {
        return NullRouter()
    }

    func testLaunch_DispatchesRoutingToDashboard() {

        var didDispatchAction: Action?
        storeDouble.dispatchFunction = { didDispatchAction = $0 }

        let app = App(store: storeDouble, router: irrelevantRouter)
        app.launch()

        let routing = didDispatchAction as? Routing
        XCTAssertNotNil(routing)
        if let routing = routing {
            XCTAssertEqual(routing, Routing(to: .dashboard))
        }
    }
}
