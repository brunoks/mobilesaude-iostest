//
//  MobileSaude_testeiosUITests.swift
//  MobileSaude-testeiosUITests
//
//  Created by Mac Novo on 08/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import XCTest

class MobileSaude_testeiosUITests: XCTestCase {

    let app = XCUIApplication()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        print(app.label)
        
    }

    func testfluxoFavoritar() {
        let myTable = app.tables.matching(identifier: "myUniqueTableViewIdentifier")
        let cell = myTable.cells.element(matching: .cell, identifier: "myCell_2")
        cell.tap()
        
        let bu = app.buttons["unlike"]
        bu.accessibilityElementsHidden = false
        bu.tap()

    }

}
