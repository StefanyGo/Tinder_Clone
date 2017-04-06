//
//  DraggableImageView.swift
//  Tinder_Stef
//
//  Created by Stefany Felicia on 4/4/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {
    
    @IBInspectable var imageCornerRadius: CGFloat = 0 {
        didSet {
            imageView.layer.cornerRadius = imageCornerRadius
            imageView.layer.masksToBounds = imageCornerRadius > 0
        }
    }
    
    @IBInspectable var imageBorderWidth: CGFloat = 0 {
        didSet {
            imageView.layer.borderWidth = imageBorderWidth
        }
    }
    
    @IBInspectable var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    @IBInspectable var dragThreshold: CGFloat = 80.0
    
    let imageView = UIImageView()
    
    // IB doesn't call awake from nib for IBDesignables
    override func awakeFromNib() {
        super.awakeFromNib()
        
        _commonInitializer()
    }
    
    // This is needed cuz initWithFrame: is too soon to render changes in view
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        _commonInitializer()
    }
    
    internal func _commonInitializer() {
        
        // Set our main image view
        imageView.frame = self.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        // Make draggable
        isUserInteractionEnabled = true
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
