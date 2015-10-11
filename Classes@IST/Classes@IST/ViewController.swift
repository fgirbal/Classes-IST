//
//  ViewController.swift
//  Classes@IST
//
//  Created by Francisco Girbal Eiras on 2/3/15.
//  Copyright (c) 2015 Francisco Girbal Eiras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func restoreUserActivityState(activity: NSUserActivity) {

        let info = activity.userInfo!["info"] as! String
        UIApplication.sharedApplication().openURL(NSURL(string: info)!)
        super.restoreUserActivityState(activity)
    }
    
    @IBAction func buttonPressed (sender: AnyObject){
        UIApplication.sharedApplication().openURL(NSURL(string: "http://tecnico.ulisboa.pt")!)
    }
}

