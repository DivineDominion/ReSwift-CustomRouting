//  Copyright © 2017 ReSwift. All rights reserved.

import UIKit

public class TabBarNavigation: NSObject, UITabBarControllerDelegate, MainNavigation {

    let routerConfiguration: RouterConfiguration
    let tabBarController: UITabBarController
    let store: DefaultStore

    public init(
        routerConfiguration: RouterConfiguration,
        tabBarController: UITabBarController,
        store: DefaultStore) {

        self.routerConfiguration = routerConfiguration
        self.tabBarController = tabBarController
        self.store = store
    }

    // MARK: Changing Route upon Interaction

    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        guard let routable = self.routable(for: viewController)
            else { assertionFailure("Routable not found for view controller"); return true }

        changeRoute(routable: routable)
        return false
    }

    fileprivate func routable(for viewController: UIViewController) -> Routable? {

        return routerConfiguration.routables
            .filter { $0.rootViewController === viewController}
            .first
    }

    fileprivate func changeRoute(routable: Routable) {

        let route = routable.route
        store.dispatch(Routing(to: route))
    }


    // MARK: Activating Route when changed
    // (MainNavigation Façade)

    public func activate(routable: Routable) {

        tabBarController.activate(routable: routable)
    }

    @available(*, deprecated: 1.0, message: "MainNavigation conformance, but has useless parameter")
    public func configure(routables: [Routable]) {

        routerConfiguration.configure(mainNavigation: tabBarController)
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var app: App!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let store = createStore()
        let routerConfiguration: RouterConfiguration = {
            let dashboard = DashboardModule()
            let detail: DetailModule = {
                let view = DetailViewController()
                let presenter = DetailNavigationPresenter(view: view)
                store.subscribe(presenter) { DetailState(selectFrom: $0) }
                return DetailModule(
                    navigationPresenter: presenter,
                    detailViewController: view)
            }()

            return RouterConfiguration(dashboard: dashboard, detail: detail)
        }()

        let tabBarController = UITabBarController()
        let navigation = TabBarNavigation(
            routerConfiguration: routerConfiguration,
            tabBarController: tabBarController,
            store: store)
        navigation.configure(routables: [])
        tabBarController.delegate = navigation

        self.app = {
            let router = Router(
                mainNavigation: navigation,
                configuration: routerConfiguration)
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
