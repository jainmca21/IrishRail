//
//  Test.swift
//  MyTravelHelper
//
//  Created by Jain, Rahul on 23/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//

import Foundation
class FavStationPresenter:ViewToPresenterFavStationProtocol {
   
    weak var view: PresenterToViewFavStationProtocol?
    var interactor: PresenterToInteractorFavStationProtocol?
    var router: PresenterToRouterFavStationProtocol?
    
    //var favStations:[FavStation] = [FavStation]()
    func getFavStationList() -> [FavStation]? {
        return interactor?.getFavStationList()
    }
    
    func searchTrainTapped() {
        router?.showSearchTrain()
    }
    
    func showSearchTrain(for station: FavStation) {
        router?.showSearchTrain(for: station)
    }
    
    
}

extension FavStationPresenter: InteractorToPresenterFavStationProtocol {
    func showFavStationInFavList(stations: [FavStation]) {
        view?.showFavStationInFavList(stations: stations)
    }
    
  /*  func showFavStationInFavList(station: FavStation) {
        
        if !favStations.contains(where: {($0.sourceStation == station.sourceStation &&
                       $0.destStation == station.destStation)}){
                       favStations.append(station)
            view?.addFavStation(station: station)
        }
    }*/
}
