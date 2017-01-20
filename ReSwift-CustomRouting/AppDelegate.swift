//  Copyright © 2017 ReSwift. All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var app: App!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let tabBarController = UITabBarController()

        self.app = {
            let store = createStore()

            let dashboard = DashboardModule()
            tabBarController.append(routable: dashboard)

            let router = Router(
                mainNavigation: tabBarController,
                dashboard: dashboard)
            store.subscribe(router) { $0.route }

            let app = App(
                store: store,
                router: router)
            return app
        }()

        self.window = {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = tabBarController
            window.makeKeyAndVisible()
            return window
        }()

        app.launch()

        return true
    }
}
