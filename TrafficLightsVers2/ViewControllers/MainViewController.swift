//
//  MainViewController.swift
//  TrafficLightsVers2
//
//  Created by Admin on 11.04.2021.
//

import UIKit



class MainViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.rgbMainSettings = mainView.backgroundColor
        settingsVC.delegate = self
    }
}

protocol SettingsViewControllerDelegate {
    func setNewColor(for viewColor: UIColor)
}


extension MainViewController: SettingsViewControllerDelegate {
    func setNewColor(for viewColor: UIColor) {
        mainView.backgroundColor = viewColor
    }
}
