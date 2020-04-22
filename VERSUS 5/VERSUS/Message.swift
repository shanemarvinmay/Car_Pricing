//
//  Message.swift
//  VERSUS
//
//  Created by student on 4/21/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation

final class Message: Codable {
    var id: Int?
    var message: String
    init(message: String) {
        self.message = message
    }
}
