//
//  InterfaceController.swift
//  Classes@IST WatchKit Extension
//
//  Created by Francisco Girbal Eiras on 2/3/15.
//  Copyright (c) 2015 Francisco Girbal Eiras. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var classTableOutlet: WKInterfaceTable!
    @IBOutlet weak var noClassesTag: WKInterfaceLabel!
    
    let classValues = ["Analise Complexa e Equacoes Diferenciais [T]", "Analise de Circuitos [T]", "Matematica Computacional [T]", "Analise de Circuitos [PB]", "Algoritmos e Estruturas de Dados [PB]"]
    
    let classTimes = ["12:00", "13:30", "15:00", "16:30", "17:00"]
    
    let classLocals = ["GA2", "E3", "PA1", "GA5", "E2"]
    
    let classPages = ["http://google.com", "http://google.com", "http://google.com", "http://google.com", "http://google.com"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        invalidateUserActivity()
        loadTableData()
    }
    
    private func loadTableData() {
        classTableOutlet.setNumberOfRows(classValues.count, withRowType: "TableRowContainer")
        
        if (classValues.count == 0 || (classValues.count == 1 && classValues[0] == "")){
            noClassesTag.setHidden(false)
            classTableOutlet.setHidden(true)
        }
        
        for (i, className) in classValues.enumerate() {
            let row = classTableOutlet.rowControllerAtIndex(i) as! TableRowContainer
            
            row.className.setText(className)
            row.classLocal.setText(classTimes[i])
        }
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        let info = [classValues[rowIndex], classTimes[rowIndex], classLocals[rowIndex], classPages[rowIndex]]
        
        updateUserActivity("com.classes.ist.receivelink", userInfo: ["link": classPages[rowIndex]], webpageURL: nil)
        
        return info
    }

}
