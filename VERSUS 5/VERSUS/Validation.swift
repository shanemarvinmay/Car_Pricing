//
//  Validation.swift
//  VERSUS
//
//  Created by student on 4/13/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation
class Validation {
   public func validateMPG(milesPERGAL: String) ->Bool {
    let milesPERGALRegex = "Enter Regex String "
    let trimmedString = milesPERGAL.trimmingCharacters(in: .whitespaces)
    let validationMPG = NSPredicate(format: "SELF MATCHES %@", milesPERGALRegex)
    let isValidateMPG = validationMPG.evaluate(with: trimmedString)
    return isValidateMPG
    }
    public func validateMilage(mileage: String) -> Bool {
        let mileageRegex = " Enter Regex String "
        let trimmedString = mileage.trimmingCharacters(in: .whitespaces)
        let validateMilage = NSPredicate(format: "SELF MATCHES %@",mileageRegex )
        let isValidateMileage = validateMilage.evaluate(with: trimmedString)
        return isValidateMileage
    }
}
