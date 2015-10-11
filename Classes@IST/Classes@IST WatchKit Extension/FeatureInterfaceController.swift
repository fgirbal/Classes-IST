//
//  FeatureInterfaceController.swift
//  Classes@IST
//
//  Created by Francisco Girbal Eiras on 2/4/15.
//  Copyright (c) 2015 Francisco Girbal Eiras. All rights reserved.
//

import WatchKit

class FeatureInterfaceController: WKInterfaceController {

    @IBOutlet weak var className: WKInterfaceLabel!
    @IBOutlet weak var classLocal: WKInterfaceLabel!
    @IBOutlet weak var classTime: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let info = context as? [String] {
            className.setText(info[0])
            classTime.setText(info[1])
            classLocal.setText(info[2])
        }
    }
}
