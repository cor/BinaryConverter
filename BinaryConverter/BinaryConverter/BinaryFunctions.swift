import Foundation


func getNumber(fromString string: String, inNumberSystem numberSystem: Int) -> Int {
    
    var result: Int = 0
    
    var factor: Int = 1 // the multiplier of the number
    
    for var index: Int = 0; index < string.characters.count; index++ {
        
        let indexOfCharacter: Int = string.characters.count - index - 1; // the index of the character in the string
        
        let characterAtIndex: Character = Array(string.characters)[indexOfCharacter] // the character that is at that index
        
        let numberFromCharacter: Int = getNumberFromCharacter("\(characterAtIndex)")!  // check if there's a number at that index
            
        if (numberFromCharacter < numberSystem) {
            // add the value for that character to the result
            result += factor * numberFromCharacter
            
        } else {
            // the number is bigger than the numbersystem
            print("error, invalid character: '\(characterAtIndex) in \(numberSystem)")
        }
            
         
        
        factor *= numberSystem // increase factor for next number
    }
    
    return result
}


func getString(var fromNumber numberInput: Int, inNumberSystem numberSystem: Int) -> String {
    
    
    if (numberSystem > 36) {
        // 0-9 + A-Z = 36 characters
        print("Error: Cannot handle number system > 36")
    }
    
    var result: String = ""
    
    
    while (numberInput > 0) {
        
        let remainder = numberInput % numberSystem
        
        numberInput = (numberInput - remainder) / numberSystem
        
        result = "\(getCharacterFromNumber(remainder))" + result // add the new character to the beginning of the string
    }
    
    if (result.isEmpty) {
        result = "0"
    }
    
    return result
}

func getCharacterFromNumber(number: Int) -> String {
    
    let valueIsSmallerThan10 = number < 10 // if the value is smaller than 10 we can just use numbers
    
    let unicodeBase = UnicodeScalar(valueIsSmallerThan10 ? "0" : "A") // the base number, if it's smaller than 10 use 0-9, if it's bigger than 9 use A-Z
    
    let unicodeCharAsInt: UInt32 = unicodeBase.value + UInt32(valueIsSmallerThan10 ? number : number - 10) // the Int value for the Unicode character
    
    let unicodeChar: String = String(UnicodeScalar(unicodeCharAsInt)) //The actual character that is made using the Int value
    
    return unicodeChar
}


func getNumberFromCharacter(character: String) -> Int? {
    
    // iterate over 0-9
    let unicodeBase0: UnicodeScalar = UnicodeScalar("0")
    for var index: Int = 0; index < 10; index++ {
        
        let unicodeCharAsInt: UInt32 = unicodeBase0.value + UInt32(index) // get the Integer value for the character
        let unicodeChar = String(UnicodeScalar(unicodeCharAsInt)) // use the integer to get a character
        
        if character == unicodeChar {
            return index // return the index because the index starts at 0
        }
    }
    
    
    // iterate over A-Z
    let unicodeBaseA: UnicodeScalar = UnicodeScalar("A")
    for var index: UInt32 = 0; index < 26; index++ {
        
        let unicodeCharAsInt: UInt32 = unicodeBaseA.value + index // get the Integer value for the character
        let unicodeChar = String(UnicodeScalar(unicodeCharAsInt)) // use the integer to get a character
        
        if character == unicodeChar {
            return Int(UInt32(index) + UInt32(10))// return the index + 10 because A comes after 9
        }
        
    }
    
    return nil
}


func deleteCharactersThatAreNotInNumberSystem(inout fromString string: String, numberSystem: Int) {
    var result = ""
    
    
    for character in string.characters {
        if let numberFromCharacter = getNumberFromCharacter("\(character)") {
            if numberFromCharacter < numberSystem {
                result.append(character)
            }
        }
    }
    
    string = result
}


