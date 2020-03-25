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
