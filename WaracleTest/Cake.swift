//
//  Cake.swift
//  WaracleTest
//
//  Created by jonathan thornburg on 1/24/17.
//  Copyright © 2017 jonathan thornburg. All rights reserved.
//

import Foundation

struct Cake {
    
    var title: String?
    var description: String?
    var image: String?
    
    init(dictionary: [String : AnyObject]) {
        self = fromDictionary(dictionary: dictionary)
    }
    
    mutating func fromDictionary(dictionary: [String : AnyObject]) -> Cake {
        if let title = dictionary["title"] as? String {
            self.title = title
        }
        if let description = dictionary["desc"] as? String {
            self.description = description
        }
        if let image = dictionary["image"] as? String {
            self.image = image
        }
        return self;
    }
}
