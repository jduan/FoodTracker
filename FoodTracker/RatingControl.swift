//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Jingjing Duan on 4/23/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    // MARK: properties
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonSelectedStates()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        guard let index: Int = ratingButtons.index(of: button) else {
            fatalError("The button \(button), is not in the ratingButtons array")
        }

        // calculate the rating of the selected button
        let selectedRating: Int = index + 1

        if selectedRating == rating {
            // if the selected star represents the current rating, reset the rating to 0
            rating = 0
        } else {
            // otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    
    // MARK: private methods
    private func setupButtons() {
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()

        // load button images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)

        for _ in 0..<starCount {
            ratingButtons.append(createButton(emptyStar, filledStar, highlightedStar))
        }

        updateButtonSelectedStates()
    }

    private func createButton(_ emptyStar: UIImage?, _ filledStar: UIImage?, _ highlightedStar: UIImage?) -> UIButton {
        let button = UIButton()
        button.setImage(emptyStar, for: .normal)
        button.setImage(filledStar, for: .selected)
        button.setImage(highlightedStar, for: .highlighted)
        button.setImage(highlightedStar, for: [.highlighted, .selected])
        // add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        // set up the button action
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        // add the button to the stackview
        addArrangedSubview(button)
        
        return button
    }

    private func updateButtonSelectedStates() {
        for (index, button) in ratingButtons.enumerated() {
            // if the index of a button is less than the rating, that button should be selected
            button.isSelected = index < rating
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
