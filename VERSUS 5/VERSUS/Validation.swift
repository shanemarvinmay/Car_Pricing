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
    //MPG validaton section - Need numbers only and also the length (how many number inputs )
       public func validateMilesPG(milesPergal: String) ->Bool {
        let milesPERGALRegex = try! NSRegularExpression(pattern: "^[0-9]*$")
        let trimmedString = milesPergal.trimmingCharacters(in: .whitespaces)
        let validateMPG = NSPredicate(format: "SELF MATCHES %@", milesPERGALRegex)
        let isValidateMPG = validateMPG.evaluate(with: trimmedString)
        return isValidateMPG
        }
        
        //Mileage Validation section - Need numbers only and also the length (how many number inputs ) 
        public func validateMileage1(mileAge: String) -> Bool {
            let mileageRegex = try! NSRegularExpression(pattern: " ^[0-9]*$") 
            let trimmedString = mileAge.trimmingCharacters(in: .whitespaces)
            let validateMilage = NSPredicate(format: "SELF MATCHES %@",mileageRegex )
            let isValidateMileage = validateMilage.evaluate(with: trimmedString)
            return isValidateMileage
    }
    }


