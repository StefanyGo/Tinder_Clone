//
//  ProfileViewController.swift
//  Tinder_Stef
//
//  Created by Stefany Felicia on 4/4/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func present(fromImageView: UIImageView, completion: ((Bool) -> Swift.Void)? = nil) {
        
        // Hide our image view during transition
        imageView.isHidden = true
        
        // Dont show our interface
        view.alpha = 0.0
        
        // Copy image view
        let tempImageView = UIImageView(image: fromImageView.image)
        tempImageView.contentMode = fromImageView.contentMode
        tempImageView.clipsToBounds = fromImageView.clipsToBounds
        let window = UIApplication.shared.delegate?.window!
        tempImageView.frame = fromImageView.convert(fromImageView.bounds, to: window)
        window?.addSubview(tempImageView)
        
        // Calculate new scale
        let scale = imageView.bounds.size.width / tempImageView.bounds.size.width
        let finalCenter = imageView.superview?.convert(imageView.center, to: window)
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.75, options: .curveEaseOut, animations: {
            // Fade in our interface
            self.view.alpha = 1.0
            
            // Pop the image
            tempImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
            tempImageView.center = finalCenter!
            
        }, completion: { (finished: Bool) in
            
            // Show the image view
            self.imageView.isHidden = false
            
            // Remove temp image view
            tempImageView.removeFromSuperview()
            
            // call completion
            if let comp = completion {
                comp(finished)
            }
            
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
