//  Copyright © 2017 ReSwift. All rights reserved.

import UIKit

public struct DetailModule: Routable {

    let detailViewController: DetailViewController

    public var rootViewController: UIViewController {
        return detailViewController
    }

    public init(detailViewController: DetailViewController = DetailViewController()) {

        self.detailViewController = detailViewController
    }
}
