// Playground - noun: a place where people can play

import Foundation


func getNumber(fromString string: String, inNumberSystem numberSystem: Int) -> Int {
    
    var result: Int = 0
    
    var factor: Int = 1 // the multiplier of the number
    
    for var index: Int = 0; index < countElements(string); index++ {
        
        let indexOfCharacter: Int = countElements(string) - index - 1; // the index of the character in the string
        
        let characterAtIndex: Character = Array(string)[indexOfCharacter] // the character that is at that index
        
        if let numberFromCharacter: Int = String(characterAtIndex).toInt() { // check if there's a number at that index
            
            if (numberFromCharacter < numberSystem) {
                // add the value for that character to the result
                result += factor * numberFromCharacter
                
            } else {
                // the number is bigger than the numbersystem
                println("error, invalid character: '\(characterAtIndex) in \(numberSystem)")
            }
            
        } else {
            // the character doesn't contain a number
            println("error, invalid character: '\(characterAtIndex)'")
        }
        
        factor *= numberSystem // increase factor for next number
    }
    
    return result
}


func getString(var fromNumber numberInput: Int, inNumberSystem numberSystem: Int) -> String {
    
    
    if (numberSystem > 36) {
        // 0-9 + A-Z = 36 characters
        println("Error: Cannot handle number system > 36")
    }
    
    var result: String = ""
    
    
    while (numberInput > 0) {
        
        let remainder = numberInput % numberSystem
        
        numberInput = (remainder - remainder) / numberSystem
        
        result = "\(getCharacterFromNumber(remainder))" + result // add the new character to the beginning of the string
    }
    
    if (result.isEmpty) {
        result = "0"
    }
    
    return result
}

func getCharacterFromNumber(number : Int) -> String {
    
    let valueIsSmallerThan10 = number < 10 // if the value is smaller than 10 we can just use numbers
    
    let unicodeBase = UnicodeScalar(valueIsSmallerThan10 ? "0" : "A") // the base number, if it's smaller than 10 use 0-9, if it's bigger than 9 use A-Z
        
    let unicodeCharAsInt: UInt32 = unicodeBase.value + (valueIsSmallerThan10 ? number : number - 10) // the Int value for the Unicode character
        
    let unicodeChar = String(UnicodeScalar(unicodeCharAsInt)) //The actual character that is made using the Int value
    
    return unicodeChar
}


