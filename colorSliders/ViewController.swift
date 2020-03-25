//
//  ViewController.swift
//  colorSliders
//
//  Created by MoPDA on 24.03.2020.
//  Copyright © 2020 Sergei Shumin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var colorScreen: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redText: UITextField!
    @IBOutlet var greenText: UITextField!
    @IBOutlet var blueText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorScreen.layer.cornerRadius = 10
        setColor()
        setTextValue()
        setLabelValue()
        
        addDoneButtonTo(redText)
        addDoneButtonTo(greenText)
        addDoneButtonTo(blueText)
        
        redText.tag = 0
        greenText.tag = 1
        blueText.tag = 2
        
    }

    @IBAction func redSlider(_ sender: UISlider) {
        redLabel.text = string(from: sender)
        redText.text = string(from: sender)
        setColor()
    }
    @IBAction func greenSlider(_ sender: UISlider) {
        greenLabel.text = string(from: sender)
        greenText.text = string(from: sender)
        setColor()
    }
    @IBAction func blueSlider(_ sender: UISlider) {
        blueLabel.text = string(from: sender)
        blueText.text = string(from: sender)
        setColor()
    }
    
    private func setColor() {
        colorScreen.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    private func setLabelValue() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    private func setTextValue() {
        redText.text = string(from: redSlider)
        greenText.text = string(from: greenSlider)
        blueText.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String{
        return String(format: "%.2f", slider.value)
}
}
extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)


    }

    func textFieldDidEndEditing(_ textField: UITextField) {

        guard let text = textField.text else { return }

        if let currentValue = Float(text) {

        switch textField.tag {
        case 0: redSlider.value = currentValue
        case 1: greenSlider.value = currentValue
        case 2: blueSlider.value = currentValue
        default: break
        }
        setColor()
        setLabelValue()
        setTextValue()
    } else {
        showAlert(title:"Wrong format!", message: "Please enter correct value")
        }
    }
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAlert)
        present(alert, animated: true)

    }

}
extension ViewController {


    private func addDoneButtonTo(_ textField: UITextField) {

        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()

        let doneButton = UIBarButtonItem(title:"Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))

        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)



        keyboardToolbar.items = [flexBarButton, doneButton]
    }

    @objc private func didTapDone() {
        view.endEditing(true)
    }


}
