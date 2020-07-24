//
//  ViewController.swift
//  TipMe
//
//  Created by Archit Jain on 7/16/20.
//  Copyright © 2020 archit. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalSplitLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitLabel: UILabel!
    var splitValue = 1
    
    // No Functionality Labels
    
    @IBOutlet weak var LabelTipAmount: UILabel!
    @IBOutlet weak var LabelTotalAmount: UILabel!
    @IBOutlet weak var LabelNoOfPeople: UILabel!
    @IBOutlet weak var LabelEachPersonPays: UILabel!
    @IBOutlet weak var LabelTip: UILabel!
    @IBOutlet weak var LabelTipLineLeft: UIView!
    @IBOutlet weak var LabelTipLineRight: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coverScreen()
        billField.becomeFirstResponder();
        if UserDefaults.standard.isSetup() == nil {
            setFirstTimeTipTitles()
            UserDefaults.standard.setup()
        }
        setTipTitles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTipTitles()
        calculateTip(nil)
    }
    
    @IBAction func calculateTip(_ sender: Any?) {
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        var tipPercentages = [UserDefaults.standard.getValueOfTip(index:0), UserDefaults.standard.getValueOfTip(index:1), UserDefaults.standard.getValueOfTip(index:2)]
        
        if bill > 0{
            uncoverScreen()
        }else{
            coverScreen()
        }
        
        // Calculate the tip and total
        let tip = bill * Double(tipPercentages[tipControl.selectedSegmentIndex])/100
        let total = bill + tip
        let totalSplit = total/Double(splitValue)
        
        // Update the tip and total labels
        tipLabel.text = String(format: "+$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalSplitLabel.text = String(format: "$%.2f", totalSplit)
    }
    
    func coverScreen() {
        topView.frame.size.height = view.frame.size.height
        billField.frame.origin.y = 180
        tipControl.isHidden = true
        tipLabel.isHidden = true
        totalLabel.isHidden = true
        splitLabel.isHidden = true
        splitStepper.isHidden = true
        totalSplitLabel.isHidden = true
        
        LabelTip.isHidden = true
        LabelTipLineLeft.isHidden = true
        LabelTipLineRight.isHidden = true
        LabelTipAmount.isHidden = true
        LabelTotalAmount.isHidden = true
        LabelNoOfPeople.isHidden = true
        LabelEachPersonPays.isHidden = true
    }
    
    func uncoverScreen() {
        topView.frame.size.height = 105
        billField.frame.origin.y = 15
        tipControl.isHidden = false
        tipLabel.isHidden = false
        totalLabel.isHidden = false
        splitLabel.isHidden = false
        splitStepper.isHidden = false
        totalSplitLabel.isHidden = false
        
        LabelTip.isHidden = false
        LabelTipLineLeft.isHidden = false
        LabelTipLineRight.isHidden = false
        LabelTipAmount.isHidden = false
        LabelTotalAmount.isHidden = false
        LabelNoOfPeople.isHidden = false
        LabelEachPersonPays.isHidden = false
    }
    
    func setTipTitles(){
        tipControl.setTitle(String(UserDefaults.standard.getValueOfTip(index: 0)) + "%", forSegmentAt: 0)
        tipControl.setTitle(String(UserDefaults.standard.getValueOfTip(index: 1)) + "%", forSegmentAt: 1)
        tipControl.setTitle(String(UserDefaults.standard.getValueOfTip(index: 2)) + "%", forSegmentAt: 2)
    }
    
    func setFirstTimeTipTitles(){
        UserDefaults.standard.setValueOfTip(index: 0, value: 15)
        UserDefaults.standard.setValueOfTip(index: 1, value: 20)
        UserDefaults.standard.setValueOfTip(index: 2, value: 25)
    }
    
    @IBAction func splitStepper(_ sender: UIStepper) {
        splitValue = Int(sender.value)
        splitLabel.text = String(splitValue)
        calculateTip(nil)
    }
    
}
