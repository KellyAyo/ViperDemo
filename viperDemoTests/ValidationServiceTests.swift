//
//  ValidationServiceTests.swift
//  viperDemoTests
//
//  Created by Phillip Kelly-Ayo on 29/07/2020.
//  Copyright © 2020 Phillip Kelly-Ayo. All rights reserved.
//

@testable import viperDemo
import XCTest

class ValidationServiceTests: XCTestCase {

    var validation: ValidationService!
    
    override func setUp() {
        super.setUp()
        validation = ValidationService()
    }
    
    override func tearDown() {
        validation = nil
        super.tearDown()
    }

    func test_is_name_empty() throws {
        XCTAssertNoThrow(try validation.validateName("Phillip Kelly-Ayo"))
    }
    
    func test_name_is_nil() throws {
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateName(nil)) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        
        XCTAssertEqual(expectedError.errorDescription, error.debugDescription)
    }
}
