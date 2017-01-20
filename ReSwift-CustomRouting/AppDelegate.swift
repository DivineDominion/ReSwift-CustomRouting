//  Copyright © 2017 ReSwift. All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var app: App!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let navigationController = UINavigationController()

        self.app = {
            let store = createStore()

            let router = Router(
                navigationController: navigationController,
                dashboard: DashboardModule())
            store.subscribe(router) { $0.route }

            let app = App(
                store: store,
                router: router)
            return app
        }()

        self.window = {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            return window
        }()

        app.launch()

        return true
    }
}
