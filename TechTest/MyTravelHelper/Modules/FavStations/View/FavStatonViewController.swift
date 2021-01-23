//
//  Test.swift
//  MyTravelHelper
//
//  Created by Jain, Rahul on 23/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//


import UIKit

class FavStatonViewController: UIViewController {
    
    @IBOutlet weak var favStationTable:UITableView!
    
    var favStations:[FavStation]?
    var presenter:ViewToPresenterFavStationProtocol?
    
    @IBAction func searchTrainAction(_ sender: Any) {
        presenter?.searchTrainTapped()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Travel Helper"
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favStations = presenter?.getFavStationList()
        if let _ = favStations{
            favStationTable.reloadData()
        }
    }
}


extension FavStatonViewController:PresenterToViewFavStationProtocol{
    func showFavStationInFavList(stations: [FavStation]) {
        favStations = stations
        favStationTable.reloadData()
    }
    
}

extension FavStatonViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String?{
        return favStations?.count == 0 ? nil : (favStations?.count ?? 0 > 1 ? "Faviourate Stations" : "Faviourate Station")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favStations?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favStation", for: indexPath) as! FavStationCell
        if let favStation = favStations?[indexPath.row]{
            cell.sourceStation.text = favStation.sourceStation
            cell.destinationStation.text = favStation.destStation
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let station = favStations?[indexPath.row] else { return }
        presenter?.showSearchTrain(for: station)
    }
    
}

