//
//  SettingsViewController.swift
//  TrafficLightsVers2
//
//  Created by Admin on 09.04.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Outlets
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
    
    var rgbMainSettings:(UIColor)!
    
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - Override func viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

        colorView.layer.cornerRadius = 15
        
        getColor()
       // setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    // MARK: - IBAction
    @IBAction func doneButton() {
        view.endEditing(true)
        delegate.setNewColor(for: colorView.backgroundColor!)
        dismiss(animated: true)
    }
    
    //Реакция на движение слайдера
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider: setValue(for: redLabel)
        case greenSlider: setValue(for: greenLabel)
        default: setValue(for: blueLabel)
        }
    }
   
    // MARK: - Private function
    //Установка цвета в зависимости от значения слайдера
    
    private func getColor() {
        colorView.backgroundColor = rgbMainSettings //присваивание маленькой вьюшке цвета View MainVC
        //redSlider.value = rgbMainSettings(UIColor.red)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat (blueSlider.value),
            alpha: 1
        )
    }
    
    // Показ текущих значений слайдера в лейблах слева
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                label.text = string(from: redSlider)
                redTextField.text = string(from: redSlider)
            case greenLabel:
                label.text = string(from: greenSlider)
                greenTextField.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
                blueTextField.text = string(from: blueSlider)
            }
        }
    }
        
    // Сокращение строки преобразования Значения слайдера в Стринг с округлением до 2-х знаков после запятой
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }
        
        switch textField {
        case redTextField: redSlider.value = numberValue
        case greenTextField: greenSlider.value = numberValue
        default: blueSlider.value = numberValue
        }
        setColor()
        setValue()
    }
}
