import UIKit

class ErrorViewController: UIViewController {

    @IBOutlet weak var tryAgainButton: UIButton!
    
    override func viewDidLoad() {
        tryAgainButton.layer.borderColor = UIColor.white.cgColor
        tryAgainButton.layer.borderWidth = 3
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = RandomColor.getRandomColor()
    }

    @IBAction func tryAgainClicked(_ sender: Any) {
        performSegue(withIdentifier: "retrySegue", sender: nil)
    }
}
