//
//  CardsViewController.swift
//  Tinder_Stef
//
//  Created by Stefany Felicia on 3/4/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var isPresenting = false

    @IBOutlet weak var draggableView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func didTap(_ tap: UITapGestureRecognizer) {
        performSegue(withIdentifier: "showProfileSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profile = segue.destination
        profile.modalPresentationStyle = .custom
        profile.transitioningDelegate = self
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

extension CardsViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ProfileViewController
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.present(fromImageView: draggableView.imageView, completion: { (finished: Bool) in
                transitionContext.completeTransition(true)
            })
        } else {
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                transitionContext.completeTransition(true)
                fromViewController.view.removeFromSuperview()
            }
        }
    }
}

