//
//  SearchTrainInteractorTest.swift
//  MyTravelHelperTests
//
//  Created by Jain, Rahul on 24/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//

import XCTest
@testable import MyTravelHelper

class SearchTrainInteractorTest:XCTestCase{
    var searchTrainInteractor:SearchTrainInteractor?
    
    override func setUp() {
        super.setUp()
        searchTrainInteractor = SearchTrainInteractor()
    }
    
    
    func testFetchAllStations(){
        searchTrainInteractor?.cloudConnector.connectWith(urlStr: "http://api.irishrail.ie/realtime/realtime.asmx/getAllStationsXML", callback: { (data, error) in
            XCTAssertNil(error, "Fetch all station list")
        })
    }
    
    func testFetchTrainFromSource() {
        let sourceCode = "1357"
        searchTrainInteractor?.cloudConnector.connectWith(urlStr: "http://api.irishrail.ie/realtime/realtime.asmx/getStationDataByCodeXML?StationCode=\(sourceCode)", callback: { (data, error) in
            XCTAssertNil(error, "Fetch train from source")
        })
    }
    
    func testForRequestTimeOut(){
        var isRequestTimout = false
        let timeoutExpectation = expectation(description: "requestTimeout")
        let currentTime = Date()
        searchTrainInteractor?.cloudConnector.connectWith(urlStr: "http://api.irishrail.ie/realtime/realtime.asmx/getAllStationsXML", callback: { (data, error) in
            let timDiff = Calendar.current.dateComponents([.second], from: currentTime, to:Date())
            if let sec = timDiff.second, sec >= 30{
                isRequestTimout = true
            }
            timeoutExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 31) { (err) in
            XCTAssertFalse(isRequestTimout, "Request timeout in 30 Sec")
        }
    }
    
    
    override func tearDown() {
        searchTrainInteractor = nil
        super.tearDown()
    }
}
