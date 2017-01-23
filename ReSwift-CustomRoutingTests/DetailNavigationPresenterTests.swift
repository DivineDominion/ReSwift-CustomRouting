//  Copyright © 2017 ReSwift. All rights reserved.

import XCTest
@testable import ReSwift_CustomRouting
import ReSwift

class DetailNavigationPresenterTests: XCTestCase {

    class ViewDouble: DisplaysDetailViewModel {
        var didDisplay: DetailViewModel?
        func display(detailViewModel: DetailViewModel) {
            didDisplay = detailViewModel
        }
    }

    var presenter: DetailNavigationPresenter!

    let viewDouble = ViewDouble()

    override func setUp() {
        super.setUp()
        presenter = DetailNavigationPresenter(view: viewDouble)
    }
    
    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
    
    func testNewState_FirstState_DisplaysViewModelOfDeck() {

        presenter.newState(state: DetailState(deck: Deck(previous: 123, current: 456, next: 789)))

        XCTAssertNotNil(viewDouble.didDisplay)
        if let viewModel = viewDouble.didDisplay {
            XCTAssertEqual(viewModel, DetailViewModel(previous: "123", current: "456", next: "789"))
        }
    }

    func testNewState_SameStateTwice_DoesNotDisplayTwice() {

        let state = DetailState(deck: Deck(previous: 345, current: 888, next: 2323))
        presenter.newState(state: state)
        viewDouble.didDisplay = nil // Reset
        presenter.newState(state: state)

        XCTAssertNil(viewDouble.didDisplay)
    }

    func testNewState_SecondDifferentState_DisplaysViewModelOfDeck() {

        presenter.newState(state: DetailState(deck: Deck(previous: 1, current: 1, next: 1)))
        presenter.newState(state: DetailState(deck: Deck(previous: 2, current: 2, next: 2)))

        XCTAssertNotNil(viewDouble.didDisplay)
        if let viewModel = viewDouble.didDisplay {
            XCTAssertEqual(viewModel, DetailViewModel(previous: "2", current: "2", next: "2"))
        }
    }

}
