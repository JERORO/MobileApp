//
//  BucketItem.swift
//  ios-mini-app-xiongchen
//
//  Created by Jiahong Chen on 2/11/18.
//  Copyright © 2018 Jiahong Chen. All rights reserved.
//

import Foundation
class BucketItem {
    
    var name: String
    var date: Date!
    var description: String
    var finished: Bool
    var latitude: String
    var longitude: String
    
    init(name: String, date: String, description: String, finished: Bool, latitude: String, longitude: String) {
        self.name = name
        self.description = description
        self.finished = finished
        self.latitude = latitude
        self.longitude = longitude
        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .short
//        self.date = dateFormatter.date(from: date)
        
        dateFormatter.dateFormat = "MM/dd/yy"
        self.date = dateFormatter.date(from: date)
        
    }

}
