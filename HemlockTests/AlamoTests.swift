//
//  AlamoTests.swift
//  HemlockTests
//
//  Created by Ken Cox on 4/12/18.
//  Copyright © 2018 Ken Cox. All rights reserved.
//

import XCTest
import Alamofire
@testable import Hemlock

class AlamoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func printInfo(_ name: String, _ value: Any) {
        let t = type(of: value)
        print("\(name) has type \(t)")
    }

    func test_basicGet() {
        let request = Alamofire.request(API.directoryURL)

        debugPrint(request)
        request.responseJSON { response in
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(response.result)")
            self.printInfo("response.result", response.result);

            XCTAssertTrue(response.result.isSuccess)
            
            XCTAssertTrue(response.result.value != nil, "result has value")
            guard let json = response.result.value else {
                return
            }
            self.printInfo("json", json);
            debugPrint(json)

            XCTAssertTrue(json is [Any], "is array");
            XCTAssertTrue(json is Array<Dictionary<String,Any>>, "is array of dictionaries");
            XCTAssertTrue(json is [[String: Any]], "is array of dictionaries"); //shorthand
            guard let libraries = response.result.value as? [[String: Any]] else {
                return
            }
            for library in libraries {
                let lib: [String: Any] = library
                debugPrint(lib)
            }
        }
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
