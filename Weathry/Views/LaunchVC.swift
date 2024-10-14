//
//  LaunchVC.swift
//  Weathry
//

import UIKit

class LaunchVC: UIViewController {

    
    @IBOutlet weak var weatheryName: UILabel!
    @IBOutlet weak var weatheryLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateLogo()

        // Do any additional setup after loading the view.
        
        weatheryName.text = NSLocalizedString("appName", comment: "App Name")
    }
    

    func animateLogo() {
        // Start with the label at its original size and fully opaque
        weatheryName.transform = CGAffineTransform.identity
        weatheryName.alpha = 1.0
        
        weatheryLogo.transform = CGAffineTransform.identity
        weatheryLogo.alpha = 1.0
        // Animate the label to zoom in significantly and become transparent
        UIView.animate(withDuration: 1.5, delay: 0.5, options: [.curveEaseInOut], animations: {
            self.weatheryName.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
            self.weatheryName.alpha = 0.0
            
            self.weatheryLogo.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
            self.weatheryLogo.alpha = 0.0
        }, completion: { _ in

            self.transitionToMainView()
        })
    }
    
    func transitionToMainView() {
    
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "weatherVC") as? HomeVC
        homeVC!.modalPresentationStyle = .fullScreen
        self.present(homeVC!, animated: true, completion: nil)
    }

}

