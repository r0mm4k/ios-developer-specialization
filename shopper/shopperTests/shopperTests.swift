//
//  shopperTests.swift
//  shopperTests
//
//  Created by Роман Макаров on 19.03.21.
//

import XCTest

class shopperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetHours() {
        XCTAssert(Wage.getHours(forWage: 25, andPrice: 100 ) == 4)
        XCTAssert(Wage.getHours(forWage: 15.50, andPrice: 250.53 ) == 17)
    }

}
