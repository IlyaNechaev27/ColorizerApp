//
//  SettingViewController.swift
//  ColorizerApp
//
//  Created by Илья Нечаев on 05.09.2021.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var color: UIColor!
    var delegate: SettingsViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        
        redSlider.value = Float(color.rgba.red)
        greenSlider.value = Float(color.rgba.green)
        blueSlider.value = Float(color.rgba.blue)

        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    override func viewWillLayoutSubviews() {
        colorView.backgroundColor = color
    }

    @IBAction func doneButtonPressed() {
        delegate.setBackgroundColor(with: colorView.backgroundColor!)
        dismiss(animated: true)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redLabel.text = string(form: redSlider)
        case blueSlider:
            blueLabel.text = string(form: blueSlider)
        default:
            greenLabel.text = string(form: greenSlider)
        }
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach{ label in
            switch label {
            case redLabel:
                redLabel.text = string(form: redSlider)
            case greenLabel:
                greenLabel.text = string(form: greenSlider)
            default:
                blueLabel.text = string(form: blueSlider)
            }
        }
    }
    
    private func string(form slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}

