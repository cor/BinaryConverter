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
        
        if var binaryInput = binaryOutlet.text {
            deleteNonBinaryCharacters(fromString: &binaryInput) // filter non binary characters
            if !binaryInput.isEmpty {
                binaryOutlet.text = binaryInput
                decimalOutlet.text = "\(getNumber(fromString: binaryInput, inNumberSystem: 2))"
            } else {
                binaryOutlet.text = ""
                decimalOutlet.text = ""
            }
        }
        
        
    }
    
    func decimalTextChanged() {
        
        if var decimalInput = decimalOutlet.text {
            deleteNonDecimalCharacters(fromString: &decimalInput)
            if !decimalInput.isEmpty {
                decimalOutlet.text = decimalInput
                binaryOutlet.text = getString(fromNumber: decimalInput.toInt()!, inNumberSystem: 2)
            } else {
                binaryOutlet.text = ""
                decimalOutlet.text = ""
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

