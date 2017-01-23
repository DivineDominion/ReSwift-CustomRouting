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

    public override func viewDidLoad() {

        super.viewDidLoad()
    }
}

extension DetailViewController {

    public func display(detailViewModel: DetailViewModel) {

        currentLabel.text = detailViewModel.current
        previousButton.titleLabel?.text = detailViewModel.previous
        nextButton.titleLabel?.text = detailViewModel.next
    }
}
