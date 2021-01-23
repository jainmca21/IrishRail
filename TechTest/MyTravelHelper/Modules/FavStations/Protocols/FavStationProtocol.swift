//
//  Test.swift
//  MyTravelHelper
//
//  Created by Jain, Rahul on 23/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//


import Foundation

protocol ViewToPresenterFavStationProtocol: class{
    var view: PresenterToViewFavStationProtocol? {get set}
    var interactor: PresenterToInteractorFavStationProtocol? {get set}
    var router: PresenterToRouterFavStationProtocol? {get set}
    func searchTrainTapped()
    func showSearchTrain(for station:FavStation)
    func getFavStationList() -> [FavStation]?


}

protocol PresenterToViewFavStationProtocol: class{
    func showFavStationInFavList(stations: [FavStation])
}

protocol PresenterToRouterFavStationProtocol: class {
    static func createModule()-> FavStatonViewController
    func showSearchTrain()
    func showSearchTrain(for station:FavStation)
}

protocol PresenterToInteractorFavStationProtocol: class {
    var presenter:InteractorToPresenterFavStationProtocol? {get set}
    func getFavStationList() -> [FavStation]?

}

protocol InteractorToPresenterFavStationProtocol: class {
    func showFavStationInFavList(stations: [FavStation])
}
