//
//  SettingsTableViewController.swift
//  Tip
//
//  Created by Archit Jain on 7/22/20.
//  Copyright © 2020 archit. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var tipOneSlider: UISlider!
    @IBOutlet weak var tipTwoSlider: UISlider!
    @IBOutlet weak var tipThreeSlider: UISlider!
    @IBOutlet weak var tipOneLabel: UILabel!
    @IBOutlet weak var tipTwoLabel: UILabel!
    @IBOutlet weak var tipThreeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSliders()
    }
    
    @IBAction func onChangeTipOne(_ sender: Any) {
        tipOneLabel.text = String(format: "%d%%", Int(tipOneSlider.value))
        UserDefaults.standard.setValueOfTip(index: 0, value: Int(tipOneSlider.value))
    }
    
    @IBAction func onChangeTipTwo(_ sender: Any) {
        tipTwoLabel.text = String(format: "%d%%", Int(tipTwoSlider.value))
        UserDefaults.standard.setValueOfTip(index: 1, value: Int(tipTwoSlider.value))
    }
    
    @IBAction func onChangeTipThree(_ sender: Any) {
        tipThreeLabel.text = String(format: "%d%%", Int(tipThreeSlider.value))
        UserDefaults.standard.setValueOfTip(index: 2, value: Int(tipThreeSlider.value))
    }
    
    func setSliders(){
        tipOneSlider.value = Float(UserDefaults.standard.getValueOfTip(index: 0))
        tipOneLabel.text = String(format: "%d%%", Int(tipOneSlider.value))
        tipTwoSlider.value = Float(UserDefaults.standard.getValueOfTip(index: 1))
        tipTwoLabel.text = String(format: "%d%%", Int(tipTwoSlider.value))
        tipThreeSlider.value = Float(UserDefaults.standard.getValueOfTip(index: 2))
        tipThreeLabel.text = String(format: "%d%%", Int(tipThreeSlider.value))
    }
}
