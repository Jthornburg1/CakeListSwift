//
//  CakeController.swift
//  WaracleTest
//
//  Created by jonathan thornburg on 1/28/17.
//  Copyright © 2017 jonathan thornburg. All rights reserved.
//

import Foundation
import UIKit

struct CakeController {
    
    public static let module = CakeController()
    private init(){}
    
    func getCakesWithUrlString(urlString: String, handler: @escaping ([Cake]?, NSError?) -> Void) {
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("Cake-getting error has occurred: \(error?.localizedDescription)")
                DispatchQueue.main.async(execute: { 
                    handler(nil, error as NSError?)
                })
            } else {
                var cakes = [Cake]()
                let cakeDelivery = self.parser(data: data!)
                for cake in cakeDelivery! {
                    let newCake = Cake(dictionary: cake)
                    cakes.append(newCake)
                }
                DispatchQueue.main.async(execute: {
                    handler(cakes, nil)
                })
            }
        }
        task.resume()
    }
    
    func parser(data: Data) -> [[String : AnyObject]]? {
        do {
            let dict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0)) as? [[String : AnyObject]]
            return dict
        } catch let error as NSError {
            print("JSON-parsing error has occurred: \(error.localizedDescription)")
        }
        return nil
    }
    
    func downloadImageFromString(urlString: String, handler: @escaping (UIImage?) -> Void) {
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let err = error {
                print("Image download error: \(err.localizedDescription)")
            } else {
                let image = UIImage(data: data!)
                DispatchQueue.main.async(execute: { 
                    handler(image)
                })
            }
        }
        task.resume()
    }
}
