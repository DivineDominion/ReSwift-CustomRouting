//  Copyright © 2017 ReSwift. All rights reserved.

import Foundation
import protocol ReSwift.StoreSubscriber

public protocol DisplaysDetailViewModel {
    func display(detailViewModel: DetailViewModel)
}

public class DetailNavigationPresenter: StoreSubscriber {

    public typealias View = DisplaysDetailViewModel

    let view: View

    public init(view: View) {

        self.view = view
    }

    fileprivate var lastState: DetailState?

    public func newState(state: DetailState) {

        guard state != lastState else { return }
        lastState = state

        let viewModel = DetailViewModel(deck: state.deck)
        view.display(detailViewModel: viewModel)
    }
}

fileprivate extension DetailViewModel {

    init(deck: Deck) {

        self.previous = String(deck.previous)
        self.current = String(deck.current)
        self.next = String(deck.next)
    }
}
