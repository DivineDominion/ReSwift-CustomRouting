//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation

public struct App {

    /// Application-level components, mostly services.
    struct Components {
        let router: Router
    }

    let store: DefaultStore
    let components: Components
    
    public init(
        store: DefaultStore,
        router: Router) {

        self.store = store
        self.components = Components(router: router)
    }

    public func launch() {

        store.dispatch(Routing(to: .dashboard))
    }
}
