//
//  ViewController.swift
//  BinaryConverter
//
//  Created by Cor Pruijs on 01-11-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var binaryOutlet: UITextField!
    @IBOutlet var decimalOutlet: UITextField!
    
    func binaryTextChanged() {
        if let binaryText = binaryOutlet.text {
            
            var actualBinaryText = binaryText // variable that contains filtered version of the outlet
            deleteNonBinaryCharacters(fromString: &actualBinaryText) // delete non binary characters from actualBinaryText
            
            
            if countElements(actualBinaryText) > 10 {
                while countElements(actualBinaryText) > 10 {
                    actualBinaryText = dropLast(actualBinaryText)
                }
            }
            if !actualBinaryText.isEmpty {
                
                if let actualBinaryNumber = actualBinaryText.toInt() {
                    
                    if actualBinaryNumber >= 1111111111 {
                        binaryOutlet.text = "1111111111"
                        decimalOutlet.text = "1023"
                    } else {
                        
                        let decimalValue = getDecimal(fromBinary: actualBinaryNumber)
                        decimalOutlet.text = "\(decimalValue)"
                        binaryOutlet.text = actualBinaryText
                    }
                    
                }
                
            } else {
                decimalOutlet.text = ""
            }
            
        }
    }
    
    func decimalTextChanged() {
        if let decimalText = decimalOutlet.text {
            var actualDecimalText = decimalText
            deleteNonDecimalCharacters(fromString: &actualDecimalText)
            
            if !actualDecimalText.isEmpty {
                
                if let actualDecimalNumber = actualDecimalText.toInt() {
                    
                    // prevent exceeding the max integer size
                    if actualDecimalNumber >= 1023 {
                        let binaryValue = getBinary(fromInt: 1023)
                        decimalOutlet.text = "1023"
                        binaryOutlet.text = "\(binaryValue)"
                    } else {
                        let binaryValue = getBinary(fromInt: actualDecimalNumber)
                        decimalOutlet.text = "\(actualDecimalNumber)"
                        binaryOutlet.text = "\(binaryValue)"
                    }
                
                }
            } else {
                binaryOutlet.text = ""
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        binaryOutlet.addTarget(self, action: Selector("binaryTextChanged"), forControlEvents: UIControlEvents.EditingChanged)
        decimalOutlet.addTarget(self, action: Selector("decimalTextChanged"), forControlEvents: UIControlEvents.EditingChanged)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

