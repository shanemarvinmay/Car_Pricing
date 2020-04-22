//
//  Validation.swift
//  VERSUS
//
//  Created by student on 4/13/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation
/*enum Alert {
    case success
    case failure
    case error
}

enum Valid {
    case success
    case failure(Alert, AlertMessages)
}

enum ValidationType {
    case mpg
    case mileage
}

enum RegEx: String {
    case mpg = "*[0-9]{2,3}*$"
    case mileage = "*[0-9]{4,6}*$"
    
    //Change RegEx according to your Requirement
}

enum AlertMessages: String {
    case inValidMPG = "Invalid miles per gallon"
    case inValidMileage = " Invalid mileage"
   
    
    case emptyMPG = "Empty MPG"
    case emptyMileage = "Empty Mileage"
    func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

class Validation: NSObject {
    
    public static let shared = Validation()
    
    func validate(values: (type: ValidationType, inputValue: String)...) -> Valid {
        for valueToBeChecked in values {
            switch valueToBeChecked.type {
            case .mpg:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .mpg, .emptyMPG, .inValidMPG)) {
                               return tempValue
                }
                case .mileage:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .mileage, .emptyMileage, .inValidMileage)) {
                               return tempValue
                }
            }
        }
        return .success
    }
    
    func isValidString(_ input: (text: String, regex: RegEx, emptyAlert: AlertMessages, invalidAlert: AlertMessages)) -> Valid? {
        if input.text.isEmpty {
            return .failure(.error, input.emptyAlert)
        } else if isValidRegEx(input.text, input.regex) != true {
            return .failure(.error, input.invalidAlert)
        }
        return nil
    }
    
    func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
}

    
    
    

    
    
    
    
    */
    
    
    
    
    /*
    //MPG validaton section - Need numbers only and also the length (how many number inputs )
       public func validateMilesPG(milesPergal: String) ->Bool {
        let milesPERGALRegex = try! NSRegularExpression(pattern: "^[0-9]{2*$")
        let trimmedString = milesPergal.trimmingCharacters(in: .whitespaces)
        let validateMPG = NSPredicate(format: "SELF MATCHES %@", milesPERGALRegex)
        let isValidateMPG = validateMPG.evaluate(with: trimmedString)
        return isValidateMPG
        }
        
        //Mileage Validation section - Need numbers only and also the length (how many number inputs ) 
        public func validateMileage1(mileAge: String) -> Bool {
            let mileageRegex = try! NSRegularExpression(pattern: " ^[0-9]{4,6}$")
            let trimmedString = mileAge.trimmingCharacters(in: .whitespaces)
            let validateMilage = NSPredicate(format: "SELF MATCHES %@",mileageRegex )
            let isValidateMileage = validateMilage.evaluate(with: trimmedString)
            return isValidateMileage
    }
*/

