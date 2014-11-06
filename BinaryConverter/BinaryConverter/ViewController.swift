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
    @IBOutlet var hexOutlet: UITextField!
    @IBOutlet var octalOutlet: UITextField!
    
    /// function that gets called when the binaryOutlet's text property gets updated
    func binaryTextChanged() {
        
        if var binaryInput = binaryOutlet.text {
            deleteCharactersThatAreNotInNumberSystem(fromString: &binaryInput, 2)
            if !binaryInput.isEmpty {
                binaryOutlet.text = binaryInput
                decimalOutlet.text = "\(getNumber(fromString: binaryInput, inNumberSystem: 2))"
                hexOutlet.text = getString(fromNumber: getNumber(fromString: binaryInput, inNumberSystem: 2), inNumberSystem: 16)
                octalOutlet.text = getString(fromNumber: getNumber(fromString: binaryInput, inNumberSystem: 2), inNumberSystem: 8)
            } else {
                clearAllOutlets()
            }
        }
        
        
    }
    
    /// function that gets called when the decimalOutlet's text property gets updated
    func decimalTextChanged() {
        
        if var decimalInput = decimalOutlet.text {
            deleteCharactersThatAreNotInNumberSystem(fromString: &decimalInput, 10)
            if !decimalInput.isEmpty {
                decimalOutlet.text = decimalInput
                binaryOutlet.text = getString(fromNumber: decimalInput.toInt()!, inNumberSystem: 2)
                hexOutlet.text = getString(fromNumber: decimalInput.toInt()!, inNumberSystem: 16)
                octalOutlet.text = getString(fromNumber: decimalInput.toInt()!, inNumberSystem: 8)
            } else {
                clearAllOutlets()
            }
        }
    }
    
    
    /// function that gets called when the hexOutlet's text property gets updated
    func hexTextChanged() {
        
        if var hexInput = hexOutlet.text {
            deleteCharactersThatAreNotInNumberSystem(fromString: &hexInput, 16)
            if !hexInput.isEmpty {
                hexOutlet.text = hexInput
                decimalOutlet.text = "\(getNumber(fromString: hexInput, inNumberSystem: 16))"
                binaryOutlet.text = getString(fromNumber: getNumber(fromString: hexInput, inNumberSystem: 16), inNumberSystem: 2)
                octalOutlet.text = getString(fromNumber: getNumber(fromString: hexInput, inNumberSystem: 16), inNumberSystem: 8)
            } else {
                clearAllOutlets()
            }
        }
    }
    
    
    /// function that gets called when the octalOutlet's text property gets updated
    func octalTextChanged() {
        if var octalInput = octalOutlet.text {
            deleteCharactersThatAreNotInNumberSystem(fromString: &octalInput, 8)
            if !octalInput.isEmpty {
                octalOutlet.text = octalInput
                decimalOutlet.text = "\(getNumber(fromString: octalInput, inNumberSystem: 8))"
                binaryOutlet.text = getString(fromNumber: getNumber(fromString: octalInput, inNumberSystem: 8), inNumberSystem: 2)
                hexOutlet.text = getString(fromNumber: getNumber(fromString: octalInput, inNumberSystem: 8), inNumberSystem: 16)
            } else {
                clearAllOutlets()
            }
        }
    }
    
    /// set the text property of all outlets to an empty string
    func clearAllOutlets() {
        binaryOutlet.text = ""
        decimalOutlet.text = ""
        hexOutlet.text = ""
        octalOutlet.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        binaryOutlet.addTarget(self, action: Selector("binaryTextChanged"), forControlEvents: UIControlEvents.EditingChanged)
        decimalOutlet.addTarget(self, action: Selector("decimalTextChanged"), forControlEvents: UIControlEvents.EditingChanged)
        hexOutlet.addTarget(self, action: Selector("hexTextChanged"), forControlEvents: UIControlEvents.EditingChanged)
        octalOutlet.addTarget(self, action: Selector("octalTextChanged"), forControlEvents: UIControlEvents.EditingChanged)
        binaryOutlet.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

