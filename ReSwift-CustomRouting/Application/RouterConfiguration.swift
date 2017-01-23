//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation

public struct RouterConfiguration {

    public let dashboard: Routable
    public let detail: Routable

    public var routables: [Routable] {
        return [dashboard, detail]
    }

    public init(
        dashboard: Routable,
        detail: Routable) {

        self.dashboard = dashboard
        self.detail = detail
    }

    public func routable(for route: AppRoute) -> Routable {

        switch route {
        case .dashboard: return dashboard
        case .detail: return detail
        }
    }

    public func configure(mainNavigation: MainNavigation) {

        mainNavigation.configure(routables: self.routables)
    }
}
