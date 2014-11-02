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
            binaryOutlet.text = actualBinaryText
            if !actualBinaryText.isEmpty {
                
                if let actualBinaryNumber = actualBinaryText.toInt() {
                    
                    let decimalValue = getDecimal(fromBinary: actualBinaryNumber)
                    decimalOutlet.text = "\(decimalValue)"
                }
            } else {
                decimalOutlet.text = ""
            }
            
        }
    }
    
    func decimalTextChanged() {
    }
    
    func deleteNonBinaryCharacters(inout fromString binaryString: String) {
        var goodString: String = ""
        for character in binaryString {
            if character == "0" || character == "1" {
                goodString.append(character)
            }
        }
        
        binaryString = goodString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // fire binaryTextChanged when text changes
        binaryOutlet.addTarget(self, action: Selector("binaryTextChanged"), forControlEvents: UIControlEvents.EditingChanged)
        decimalOutlet.addTarget(self, action: Selector("decimalTextChanged"), forControlEvents: UIControlEvents.EditingChanged)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

