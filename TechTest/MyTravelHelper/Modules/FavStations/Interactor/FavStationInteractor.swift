//
//  Test.swift
//  MyTravelHelper
//
//  Created by Jain, Rahul on 23/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//

import Foundation
class FavStationInteractor: PresenterToInteractorFavStationProtocol {

    
    var presenter: InteractorToPresenterFavStationProtocol?
        
    func getFavStationList() -> [FavStation]? {
        let userDef = UserDefaults.standard
        if let  jsonStr = userDef.value(forKey: "fav_station") as? String, let data = jsonStr.data(using: .utf8){
            if let fvStations = try? JSONDecoder().decode([FavStation].self, from: data){
                return fvStations
            }
        }
      
        return nil
    }
}
