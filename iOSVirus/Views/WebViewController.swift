import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    // MARK - Targets
    @IBOutlet weak var mainWebView: WKWebView!
    @IBOutlet weak var bifLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainWebView.navigationDelegate = self
        
        let appUrl = URL(string:"https://biffud.com")
        let appRequest = URLRequest(url: appUrl!)
        mainWebView.load(appRequest)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = RandomColor.getRandomColor()
    }
    
    // Error
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        performSegue(withIdentifier: "errorSegue", sender: nil)
    }
    
    // Loading started
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    }
    
    // Loading finished
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        bifLogo.isHidden = true;
        mainWebView.isHidden = false;
    }
    
    // Link was clicked
    func webView(_ webView: WKWebView, decidePolicyFor: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        if decidePolicyFor.targetFrame == nil {
            if let url = decidePolicyFor.request.url {
                let app = UIApplication.shared
                if app.canOpenURL(url) {
                    app.open(url, options: [:], completionHandler: nil)
                    return decisionHandler( WKNavigationActionPolicy.cancel )
                }
            }
        }
        return decisionHandler( WKNavigationActionPolicy.allow )
    }
}
