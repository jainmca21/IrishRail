//
//  Test.swift
//  MyTravelHelper
//
//  Created by Jain, Rahul on 23/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//

import Foundation

struct FavStation: Codable {
    var sourceStation: String
    var destStation: String
    

    enum CodingKeys: String, CodingKey {
        case sourceStation = "SourceStation"
        case destStation = "destStation"
    }

    init(sourceStation: String, destStation: String) {
        self.sourceStation = sourceStation
        self.destStation = destStation
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let sourceStation = try values.decode(String.self, forKey: .sourceStation)
        let destStation = try values.decode(String.self, forKey: .destStation)
       

        self.init(sourceStation: sourceStation, destStation: destStation)
    }
}

