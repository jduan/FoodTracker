//
//  ViewController.swift
//  FoodTracker
//
//  Created by Jingjing Duan on 4/19/17.
//  Copyright © 2017 Jingjing Duan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UITextFieldDelegate,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field's user input through delegate callbacks.
        nameTextField.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // dismiss the picker if the user canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // the info dictionary may contain multiple representations of the image. You want to use
        // the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // set photoImageView to display the selected image
        photoImageView.image = selectedImage
        
        // dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard
//         This code ensures that if the user taps the image view while typing in the text field,
//         the keyboard is dismissed properly.
        nameTextField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        
        // only allows photos to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
}
