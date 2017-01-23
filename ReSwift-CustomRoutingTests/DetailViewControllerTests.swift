//  Copyright © 2017 ReSwift. All rights reserved.

import XCTest
@testable import ReSwift_CustomRouting

class DetailViewControllerTests: XCTestCase {

    var controller: DetailViewController!

    override func setUp() {
        super.setUp()
        controller = DetailViewController()
        forceLoadViewController(controller)
    }
    
    override func tearDown() {
        controller = nil
        super.tearDown()
    }

    // MARK: Nib Setup

    func testInitially_WiresCurrentLabel() {
        XCTAssertNotNil(controller.currentLabel)
    }

    func testInitially_WiresPreviousButton() {
        XCTAssertNotNil(controller.previousButton)
    }

    func testInitially_WiresNextButton() {
        XCTAssertNotNil(controller.nextButton)
    }


    // MARK: Displaying the View Model

    func testDisplayVM_SetsCurrentLabelText() {

        let text = "the text"

        controller.display(detailViewModel: DetailViewModel(previous: "irrelevant", current: text, next: "irrelevant"))

        XCTAssertEqual(controller.currentLabel?.text, text)
    }

    func testDisplayVM_SetsPreviousButtonLabelText() {

        let text = "another text"

        controller.display(detailViewModel: DetailViewModel(previous: text, current: "irrelevant", next: "irrelevant"))

        XCTAssertEqual(controller.previousButton?.titleLabel?.text, text)
    }

    func testDisplayVM_SetsNextButtonLabelText() {

        let text = "final text"

        controller.display(detailViewModel: DetailViewModel(previous: "irrelevant", current: "irrelevant", next: text))

        XCTAssertEqual(controller.nextButton?.titleLabel?.text, text)
    }

}
