//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
import ReSwift

let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH':'mm':'ss'.'SSSS"
    return formatter
}()

func log(_ text: String) {
    let time = formatter.string(from: Date())
    print("\(time) \(text)")
}

let loggingMiddleware: Middleware = { dispatch, getState in
    return { next in
        return { action in
            log("> \(action)")
            return next(action)
        }
    }
}
