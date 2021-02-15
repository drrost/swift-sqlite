//
//  DriverManagerTests.swift
//
//
//  Created by Rostyslav Druzhchenko on 15.02.2021.
//

import XCTest

@testable import SSQLite

class DriverManagerTests: XCTestCase {

    // MARK: - Init tests

    func testNullUrlThrows() {
        // Given
        let url: String? = nil

        // When
        XCTAssertThrowsError(try DriverManager.getConnection(url), "") { error in

            // Then
            guard let error = error as? SQLException else {
                XCTAssertTrue(false, "error must be type of SQLException")
                return
            }

            XCTAssertEqual(error.reason, "The url cannot be null")
            XCTAssertEqual(error.SQLState, "08001")
        }
    }

}

