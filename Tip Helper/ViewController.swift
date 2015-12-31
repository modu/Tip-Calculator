//
//  ViewController.swift
//  Tip Helper
//
//  Created by Varun Vyas on 15/12/15.
//  Copyright © 2015 Varun Vyas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    var defaultTipValue :Double = 0
    
    var currencyValue :String = "$";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = currencyValue + "0.00"
        totalLabel.text = currencyValue + "0.00"
        let defaults = NSUserDefaults.standardUserDefaults()
        defaultTipValue = defaults.doubleForKey("default_tip_percentage")
        print("Value of DefaultTypeValue is " + String(format: currencyValue+"%.2f",defaultTipValue) )
        tipControl.selectedSegmentIndex = 0

        themeLoading()
        currencyLoading()
        
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        if(defaultTipValue == 0 ){
            var tipArray =  [0.10 , 0.20 , 0.25]
            let tipValueChoosen = tipArray[tipControl.selectedSegmentIndex]
            let billAmount = NSString(string: billField.text!).doubleValue
            let tip = billAmount * tipValueChoosen
            let total = billAmount + tip
            tipLabel.text = String(format: currencyValue+"%.2f", tip )
            totalLabel.text = String(format: currencyValue+"%.2f", total )
        }
        else {
            //tipControl.selectedSegmentIndex = -1
            let billAmount = NSString(string: billField.text!).doubleValue
            let tip = billAmount * defaultTipValue * 0.01
            let total = billAmount + tip
            tipLabel.text = String(format: currencyValue+"%.2f", tip )
            totalLabel.text = String(format: currencyValue+"%.2f", total )
        }
    }
    @IBAction func onEditingChangedRotator(sender: AnyObject) {
        var tipArray =  [0.10 , 0.20 , 0.25]
        let tipValueChoosen = tipArray[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipValueChoosen
        let total = billAmount + tip
        tipLabel.text = String(format: currencyValue+"%.2f", tip )
        totalLabel.text = String(format: currencyValue+"%.2f", total )
    }
    
    @IBAction func ontap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        currencyLoading()
        print("Value of DefaultTypeValue is in ViewWIllappear" + String(format: "%.2f",defaultTipValue) )
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * defaultTipValue * 0.01
        let total = billAmount + tip
        tipLabel.text = String(format: currencyValue+"%.2f", tip )
        totalLabel.text = String(format: currencyValue+"%.2f", total )
        //tipControl.selectedSegmentIndex = -1
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        
        
        let localTheme = defaults.doubleForKey("theme")
        if(localTheme == 0)
        {
            self.view.backgroundColor = UIColor.whiteColor()
        }
        else if(localTheme==1){
            self.view.backgroundColor = UIColor.darkGrayColor()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    func themeLoading() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let localTheme = defaults.doubleForKey("theme")
        if(localTheme == 0)
        {
            self.view.backgroundColor = UIColor.whiteColor()
        }
        else if(localTheme==1){
            self.view.backgroundColor = UIColor.darkGrayColor()
        }
        
    }
    func currencyLoading() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let localcurrency = defaults.doubleForKey("currency")
        if(localcurrency == 0) {
            currencyValue = "$"
        }
        else if(localcurrency==1){
            currencyValue = "€"
        }
        else if(localcurrency==2){
            currencyValue = "£"
        }
        else if(localcurrency==3){
            currencyValue = "₹"
        }
        
    }

}

