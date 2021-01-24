//
//  FavStationInteractorTest.swift
//  MyTravelHelperTests
//
//  Created by Jain, Rahul on 24/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//

import XCTest
@testable import MyTravelHelper

class FavStationInteractorTest:XCTestCase{
    var favStationInteractor:FavStationInteractor?
    override func setUp() {
        super.setUp()
        favStationInteractor = FavStationInteractor()
    }
    
    func testGetSavedFavStationList(){
        let favStations = favStationInteractor?.getFavStationList()
        XCTAssertNotNil(favStations, "Faviourite station exist")
    }
    
    override func tearDown() {
        favStationInteractor = nil
        super.tearDown()
    }
}
