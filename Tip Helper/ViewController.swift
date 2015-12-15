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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipArray =  [0.10 , 0.20 , 0.25]
        var tipValueChoosen = tipArray[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipValueChoosen
        var total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip )
        totalLabel.text = String(format: "$%.2f", total )
        
    }

//    @IBAction func onEditingChanged(sender: AnyObject) {
//        var tipArray =  [0.10 , 0.20 , 0.25]
//        var billAmount = NSString(string: billField.text!).doubleValue
//        var tip = billAmount *
//        
    
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)

    }

}

