//
//  ValidationService.swift
//  viperDemo
//
//  Created by Phillip Kelly-Ayo on 29/07/2020.
//  Copyright © 2020 Phillip Kelly-Ayo. All rights reserved.
//

import Foundation

struct ValidationService {
    func validateName(_ name:String?) throws -> String {
        guard let name = name else { throw ValidationError.invalidValue }
        guard name.count > 0 else { throw ValidationError.nameIsEmpty }
        return name
    }
}

enum ValidationError: LocalizedError {
    case invalidValue
    case nameIsEmpty
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "You have entered an invalid value."
        case .nameIsEmpty:
            return "Name returned from db is Empty."
        }
    }
}
