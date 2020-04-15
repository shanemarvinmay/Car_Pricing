//
//  Validation.swift
//  VERSUS
//
//  Created by student on 4/13/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation
import UIKit
class Validation {
    //MPG validaton section
       public func validateMilesPG(milesPergal: String) ->Bool {
        let milesPERGALRegex = try! NSRegularExpression(pattern: "^[0-9]*$")
        let trimmedString = milesPergal.trimmingCharacters(in: .whitespaces)
        let validateMPG = NSPredicate(format: "SELF MATCHES %@", milesPERGALRegex)
        let isValidateMPG = validateMPG.evaluate(with: trimmedString)
        return isValidateMPG
        }
        
        //Mileage Validation section
        public func validateMileage1(mileAge: String) -> Bool {
            let mileageRegex = try! NSRegularExpression(pattern: "^[0-9]*$")
            let trimmedString = mileAge.trimmingCharacters(in: .whitespaces)
            let validateMilage = NSPredicate(format: "SELF MATCHES %@",mileageRegex )
            let isValidateMileage = validateMilage.evaluate(with: trimmedString)
            return isValidateMileage
    }
    }

/*
 public func validateEmailId(emailID: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let trimmedString = emailID.trimmingCharacters(in: .whitespaces)
    let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let isValidateEmail = validateEmail.evaluate(with: trimmedString)
    return isValidateEmail
 } */
