//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation

public struct App {

    let store: DefaultStore

    public init(store: DefaultStore) {

        self.store = store
    }

    public func launch() {

        store.dispatch(Routing(to: .dashboard))
    }
}
