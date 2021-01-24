//
//  Test.swift
//  MyTravelHelper
//
//  Created by Jain, Rahul on 23/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//

import UIKit
import Foundation

class FavStationRouter: PresenterToRouterFavStationProtocol {
    static func createModule() -> FavStatonViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "FavStatonViewController") as! FavStatonViewController
        let presenter: ViewToPresenterFavStationProtocol & InteractorToPresenterFavStationProtocol = FavStationPresenter()
        let interactor: PresenterToInteractorFavStationProtocol = FavStationInteractor()
        let router:PresenterToRouterFavStationProtocol = FavStationRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: nil)
    }
    
    func showSearchTrain(){
        let view = SearchTrainRouter.createModule()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.navigation?.pushViewController(view, animated: true)
    }
    
    func showSearchTrain(for station: FavStation) {
        let view = SearchTrainRouter.createModule()
        view.presenter?.selectStationAsFav(station: station)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.navigation?.pushViewController(view, animated: true)
    }
}


