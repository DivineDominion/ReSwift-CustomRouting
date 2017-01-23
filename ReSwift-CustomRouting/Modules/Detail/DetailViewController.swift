//  Copyright © 2017 ReSwift. All rights reserved.

import UIKit

public class DetailViewController: UIViewController {

    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    convenience init() {

        self.init(nibName: nil, bundle: nil)

        self.title = "Detail"
    }

    fileprivate var cachedViewModel: DetailViewModel?
    fileprivate var isLoaded = false
    public override func viewDidLoad() {

        super.viewDidLoad()

        isLoaded = true

        if let cachedViewModel = cachedViewModel {
            display(detailViewModel: cachedViewModel)
        }
    }
}

extension DetailViewController: DisplaysDetailViewModel {

    public func display(detailViewModel: DetailViewModel) {

        guard isLoaded else {
            self.cachedViewModel = detailViewModel
            return
        }
        
        currentLabel.text = detailViewModel.current
        previousButton.titleLabel?.text = detailViewModel.previous
        nextButton.titleLabel?.text = detailViewModel.next
    }
}
