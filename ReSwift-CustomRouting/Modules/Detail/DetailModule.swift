//  Copyright © 2017 ReSwift. All rights reserved.

import UIKit

public struct DetailModule: Routable {

    let navigationPresenter: DetailNavigationPresenter
    let detailViewController: DetailViewController

    public var rootViewController: UIViewController {
        return detailViewController
    }

    public var route: AppRoute {
        return .detail(DetailState.default)
    }

    public init(
        navigationPresenter: DetailNavigationPresenter,
        detailViewController: DetailViewController) {

        self.navigationPresenter = navigationPresenter
        self.detailViewController = detailViewController
    }
}
