//
//  MainViewController.swift
//  TrafficLightsVers2
//
//  Created by Admin on 11.04.2021.
//

import UIKit

class MainViewController: UIViewController {

    //var rgbViewSettings = view.
    @IBOutlet var mainView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.rgbMainSettings = mainView.backgroundColor
        
    }
    
    

    
}




