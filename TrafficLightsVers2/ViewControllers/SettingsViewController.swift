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
    
    var rgbMainSettings:(UIColor)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorView.layer.cornerRadius = 15
        
        colorView.backgroundColor = rgbMainSettings
        //setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    // MARK: - IBAction
    
    //Реакция на движение слайдера
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider: setValue(for: redLabel)
        case greenSlider: setValue(for: greenLabel)
        default: setValue(for: blueLabel)
        }
    }
    
    //Установка цвета в зависимости от значения слайдера
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
            case greenLabel:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }
   
        
    // Сокращение строки преобразования Значения слайдера в Стринг с округлением до 2-х знаков после запятой
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

}
