//
//  StoryView.swift
//  Story
//
//  Created by  Kishan Vekariya on 04/07/19.
//  Copyright © 2019  Kishan Vekariya. All rights reserved.
//

//import UIKit
//
//@IBDesignable class RatingControl: UIStackView {
//
//    private var ratingButtons = [UIButton]()
//
//    var rating = 0{
//        didSet{
//            updateButtonSelectionStates()
//        }
//    }
//
//    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
//        didSet{
//            setupButtons()
//        }
//    }
//
//    @IBInspectable var starCount: Int = 5{
//        didSet{
//            setupButtons()
//        }
//    }
//
//
//    override init(frame: CGRect) {
//        super.init(frame : frame)
//        setupButtons()
//    }
//
//    required init(coder: NSCoder) {
//        super.init(coder: coder)
//        setupButtons()
//    }
//
//    private func setupButtons() {
//        for button in ratingButtons {
//            removeArrangedSubview(button)
//            button.removeFromSuperview()
//        }
//
//        ratingButtons.removeAll()
//
//        let bundle = Bundle(for: type(of: self))
//        let filledStar = UIImage(named: "fill", in: bundle, compatibleWith: self.traitCollection)
//        let emptyStar = UIImage(named:"empty", in: bundle, compatibleWith: self.traitCollection)
//        let highlightedStar = UIImage(named:"highlight", in: bundle, compatibleWith: self.traitCollection)
//
//        for _ in 0..<starCount {
//
//            let button = UIButton()
//
//            button.setImage(emptyStar, for: .normal)
//            button.setImage(filledStar, for: .selected)
//            button.setImage(highlightedStar, for: .highlighted)
//            button.setImage(highlightedStar, for: [.highlighted, .selected])
//
//            button.translatesAutoresizingMaskIntoConstraints = false
//            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
//            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
//
//            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
//
//            addArrangedSubview(button)
//
//            ratingButtons.append(button)
//        }
//        updateButtonSelectionStates()
//    }
//
//    @objc func ratingButtonTapped(button: UIButton) {
//        guard let index = ratingButtons.index(of: button) else {
//            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
//        }
//
//        // Calculate the rating of the selected button
//        let selectedRating = index + 1
//
//        if selectedRating == rating {
//            // If the selected star represents the current rating, reset the rating to 0.
//            rating = 0
//        } else {
//            // Otherwise set the rating to the selected star
//            rating = selectedRating
//        }
//
//    }
//
//    private func updateButtonSelectionStates() {
//        for (index, button) in ratingButtons.enumerated() {
//            // If the index of a button is less than the rating, that button should be selected.
//            button.isSelected = index < rating
//        }
//    }
//
//}

import UIKit

@IBDesignable class StoryView: UIView {
    
    @IBInspectable var image : UIImage?{
        didSet{
            setupImage()
        }
    }
    @IBInspectable var ringcolour : UIColor?{
        didSet{
            setupImage()
        }
    }
    @IBInspectable var badgecolour : UIColor?{
        didSet{
            setupImage()
        }
    }
    
    @IBInspectable var badgesize : CGFloat = 0.0{
        didSet{
            setupImage()
        }
    }
    
    private func setupImage(){
        
        self.backgroundColor = ringcolour
        self.layer.cornerRadius = self.frame.height / 2
        
        let imageview = UIImageView()
        imageview.image = image

        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.heightAnchor.constraint(equalToConstant: self.frame.height - 5).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: self.frame.width - 5).isActive = true
        imageview.layer.cornerRadius = self.layer.cornerRadius
        imageview.clipsToBounds = true
        self.addSubview(imageview)
        imageview.centerXAnchor.constraint(equalToSystemSpacingAfter: self.centerXAnchor, multiplier: 1).isActive = true
        imageview.centerYAnchor.constraint(equalToSystemSpacingBelow: self.centerYAnchor, multiplier: 1).isActive = true
        
        let badgeview = UIView()
        badgeview.backgroundColor = badgecolour
        badgeview.layer.cornerRadius = badgesize / 2
        self.addSubview(badgeview)
        
        
        badgeview.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(badgeview)
        badgeview.heightAnchor.constraint(equalToConstant: badgesize).isActive = true
        badgeview.widthAnchor.constraint(equalToConstant: badgesize).isActive = true
        self.addConstraint(NSLayoutConstraint(item: badgeview, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.67, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: badgeview, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.67,
            constant: 0))
        
    }

}
