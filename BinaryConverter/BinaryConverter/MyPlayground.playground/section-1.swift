func getNumberFromCharacter(character: String) -> Int {
    
    
    // iterate over 0-9
    let unicodeBase0: UnicodeScalar = UnicodeScalar("0")
    for var index = 0; index < 10; index++ {
        
        let unicodeCharAsInt: UInt32 = unicodeBase0.value + index // get the Integer value for the character
        let unicodeChar = String(UnicodeScalar(unicodeCharAsInt)) // use the integer to get a character
        
        if character == unicodeChar {
            return index // return the index because the index starts at 0
        }
    }
    
    
    // iterate over A-Z
    let unicodeBaseA: UnicodeScalar = UnicodeScalar("A")
    for var index = 0; index < 26; index++ {
        
        let unicodeCharAsInt: UInt32 = unicodeBaseA.value + index // get the Integer value for the character
        let unicodeChar = String(UnicodeScalar(unicodeCharAsInt)) // use the integer to get a character
        
        if character == unicodeChar {
            return index + 10 // return the index + 10 because A comes after 9
        }
        
    }
    
    
    // if we reach this point, the character is invalid
    println("error, invalid character given at numberFromCharacter")
    return 0
}
