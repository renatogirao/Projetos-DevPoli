
import UIKit
import Foundation
import AppKit

func checkPasswordComplexity(password: String) {
    
        if password.checkRangeNumbersLetters(min: 5, max: 15) {
            print("\(password): Senha precisa ter entre 5 e 15 caracateres\n")
        } else if password.checkAnySpecialCharacter() {
            print("\(password): Não pode ter caracteres especiais\n")
        }  else if !password.checkAnyLowercasedLetter() {
            print("\(password): Precisa ter ao menos uma letra minúscula\n")
        }  else if !password.checkAnyUppercasedLetter() {
            print("\(password): Precisa ter ao menos uma letra maiúscula\n")
        } else if !password.checkFirstLetterUppercased() && password.numberOfUppercasedLetter() == 1 {
            print("\(password): Primeira letra precisa ser maiúscula\n")
        } else {
            print("\(password): Senha correta\n")
        }
}

checkPasswordComplexity(password: "testanDo")
checkPasswordComplexity(password: "CaracterEspec!!")
checkPasswordComplexity(password: "123")
checkPasswordComplexity(password: "teste")
checkPasswordComplexity(password: "TESTE")
checkPasswordComplexity(password: "SEnhACorreTa")




extension String {
    func checkAnyUppercasedLetter() -> Bool {
        let uppercasedLetters = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        var numberOfUppercased = 0
        self.forEach { char in 
            let set = CharacterSet(charactersIn: String(char))
            if set.isSubset(of: uppercasedLetters) {
                numberOfUppercased += 1
            }
        }
            if numberOfUppercased > 0 {
                return true
            } else {
                return false
            }
    }
        
        func checkAnyLowercasedLetter() -> Bool {    
            let uppercasedLetters = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            let lowercasedLetters = CharacterSet.letters.subtracting(uppercasedLetters)
            var numberOfLowercased = 0
            self.forEach { char in 
                let set = CharacterSet(charactersIn: String(char))
                if set.isSubset(of: lowercasedLetters) {
                    numberOfLowercased += 1
                }
            }
                if numberOfLowercased > 0 {
                    return true
                } else {
                    return false
                }
        }
                func checkRangeNumbersLetters(min: Int, max: Int) -> Bool {
                    if self.count < min || self.count > max {
                        return true
                    } else {
                        return false
                    }
                }
            
                func checkAnySpecialCharacter() -> Bool {
                    let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
                    if self.rangeOfCharacter(from: characterset.inverted) != nil {
                        return true
                    } else {
                        return false
                    }
                }
            
                func checkFirstLetterUppercased() -> Bool {
                    if self == self.capitalized {
                        return true
                    } else {
                        return false
                    }
                }
    
    func checkAnyNumberInString() -> Bool {    
        let numbers = CharacterSet(charactersIn: "0123456789")
        var numbersCount = 0
        self.forEach { char in 
            let set = CharacterSet(charactersIn: String(char))
            if set.isSubset(of: numbers) {
                numbersCount += 1
            }
        }
            if numbersCount > 0 {
                return true
            } else {
                return false
            }
        }
        
    func numberOfUppercasedLetter() -> Int {
        let uppercasedLetters = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        var numberOfUppercased = 0
        self.forEach { char in 
            let set = CharacterSet(charactersIn: String(char))
            if set.isSubset(of: uppercasedLetters) {
                numberOfUppercased += 1
            }
        }
            return numberOfUppercased 
    }
}
