//
//  JLPTechTestUITests.swift
//  JLPTechTestUITests
//
//  Created by Tom Pearson on 01/10/2022.
//

import XCTest

final class JLPTechTestUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    // This is an unreliable test as the data provided by the api could change.
    // It'd be better to load fake data when the app is being UI tested
    // to avoid reliance on the network
    func testNavigationToDetailScreen() throws {
        let boschTitle = app.staticTexts["Bosch Serie 2 SMV2ITX18G Fully Integrated Dishwasher"]
        XCTAssert(boschTitle.waitForExistence(timeout: 1))
        
        boschTitle.tap()
        
        let productCode = app.staticTexts["Product code: 88701213"]
        XCTAssert(productCode.waitForExistence(timeout: 1))
    }
}
