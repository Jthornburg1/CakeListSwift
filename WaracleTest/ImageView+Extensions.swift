//
//  ImageView+Extensions.swift
//  WaracleTest
//
//  Created by jonathan thornburg on 1/28/17.
//  Copyright © 2017 jonathan thornburg. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    class func downloadImageFromString(urlString: String) {
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let err = error {
                print("Image download error: \(error?.localizedDescription)")
            } else {
                let image = UIImage(data: data!)
                
            }
        }
    }
}
