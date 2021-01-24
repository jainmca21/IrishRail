//
//  SearchTrainInteractorTest.swift
//  MyTravelHelperTests
//
//  Created by Jain, Rahul on 23/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//

import XCTest
@testable import MyTravelHelper

class FavStationPresenterTests:XCTestCase{

    var presenter: FavStationPresenter?
    var view:FavStationMockView?
    var interactor : FavStationInteractor?
    var rotuer : FavStationRouter?

    override func setUp() {
        super.setUp()
        
        presenter = FavStationPresenter()
        view = FavStationMockView()
        interactor = FavStationInteractorMock()
        rotuer = FavstatinRouterMock() as FavStationRouter
        presenter?.router = rotuer
        presenter?.view = view
        presenter?.interactor = interactor
        interactor?.presenter = presenter
    }
    
    func testGetFavStationList(){
        let favStations = presenter?.getFavStationList()
        guard let stations = favStations else { return }
        XCTAssertTrue(stations.count > 0)
    }
    
    func testShowFavStationInSearchTrain(){
        let favStation = FavStation(sourceStation: "Belfast", destStation: "Lisburn")
        presenter?.router?.showSearchTrain(for: favStation)
        let mock =  presenter?.router as! FavstatinRouterMock
        XCTAssertTrue(mock.isFavStationShownInFaviourite, "Favioute station opted")
    }
    
    
    func  testShowAllSavedFavStationInList(){
        presenter?.showFavStationInFavList(stations: [FavStation(sourceStation: "Belfast", destStation: "Lisburn")])
        XCTAssertTrue(view!.isAllFavStationShownInList, "Faviourite station shown in list")
    }
    
    override func tearDown() {
        presenter = nil
        view = nil
        interactor = nil
        
        super.tearDown()
    }
    
}

class FavStationMockView:PresenterToViewFavStationProtocol {
    var presenter:ViewToPresenterFavStationProtocol?
    var isAllFavStationShownInList = false

    func showFavStationInFavList(stations: [FavStation]) {
        isAllFavStationShownInList = true
    }
    
}


class FavstatinRouterMock:FavStationRouter{
    var isFavStationShownInFaviourite = false

    override func showSearchTrain(for station:FavStation){
        isFavStationShownInFaviourite = true
    }

}


class FavStationInteractorMock:FavStationInteractor{
   override func getFavStationList() -> [FavStation]?{
        return [FavStation(sourceStation: "Belfast", destStation: "Lisburn")]
    }
}
