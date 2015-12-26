//
//  SettingsViewController.swift
//  Tip Helper
//
//  Created by Varun Vyas on 24/12/15.
//  Copyright © 2015 Varun Vyas. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTip: UITextField!
    
    @IBOutlet weak var themeSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        defaultTip.text = String( format: "%.0f" ,defaults.doubleForKey("default_tip_percentage") )
        
        themeLoading()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        let dftip = NSString(string: defaultTip.text!).doubleValue
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(dftip , forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    
    @IBAction func themeSegmentOnChange(sender: AnyObject) {
        
        let number = themeSegment.selectedSegmentIndex
        print("Value of number is " + String(number))
        if(number == 0 ){
            let lightColor = UIColor.whiteColor()
            self.view.backgroundColor = lightColor
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setDouble(0, forKey: "theme")
            
        }
        else if (number == 1) {
            let darkColor = UIColor.darkGrayColor()
            //self.navigationController!.view.backgroundColor = darkColor
            self.view.backgroundColor = darkColor
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setDouble(1, forKey: "theme")
        }
        
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func themeLoading() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let localTheme = defaults.doubleForKey("theme")
        if(localTheme == 0)
        {
            self.view.backgroundColor = UIColor.whiteColor()
            themeSegment.selectedSegmentIndex = 0
        }
        else if(localTheme==1){
            self.view.backgroundColor = UIColor.lightGrayColor()
            themeSegment.selectedSegmentIndex = 1
        }

    }
}
