//
//  BinaryFunctions.swift
//  BinaryConverter
//
//  Created by Cor Pruijs on 01-11-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

import Foundation

func getDecimal(fromBinary binaryNumber: Int) -> Int {
    
    let numberString: String = String(binaryNumber) // convert number to string for iteration
    let numberStringLength = countElements(numberString) // get the length of the String
    
    var total: Int = 0 // keep track of the total
    
    for var index = numberStringLength - 1; index >= 0; index-- {
        
        let characterAtIndex: Character = Array(numberString)[index] // the Character at the index of the string
        let numberAtIndex: Int = String(characterAtIndex).toInt()! // Integer value from the Character
        
        let multiplier = Int(pow(2.0, Double(numberStringLength - index - 1))) // the multiplier ( 2^index )
        let decimalValue = numberAtIndex * multiplier // the decimal value
        
        total += decimalValue // add the decimal value to the total
    }
    
    return total // return the result
}


func getBinary(var fromInt intNumber: Int) -> Int {
    
    var result: String = ""
    
    while intNumber >= 1 {
        if intNumber % 2 == 0 {
            result = "0" + result
        } else {
            result = "1" + result
            --intNumber
        }
        
        intNumber /= 2
    }
    
    return result.toInt()!
}