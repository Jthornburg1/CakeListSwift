//
//  ViewController.swift
//  WaracleTest
//
//  Created by jonathan thornburg on 1/24/17.
//  Copyright © 2017 jonathan thornburg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var cakes: [Cake]?
    var cache: NSCache<AnyObject, AnyObject>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cache = NSCache<AnyObject, AnyObject>()
        
        let cellNib = UINib(nibName: "CakeCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Constants.cakeCellId)
        
        CakeController.module.getCakesWithUrlString(urlString: Constants.resourceString) { (cakes, error) in
            if let cks = cakes {
                self.cakes = cks
                self.tableView.reloadData()
            }
        }
    }

    // TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cks = self.cakes {
            return cks.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cakeCellId) as? CakeCell
        if let cks = self.cakes {
            cell?.nameLabel.text = cks[indexPath.row].title!
            cell?.descriptionLabel.text = cks[indexPath.row].description!
            if let image = cache?.object(forKey: (cks[indexPath.row].image! as AnyObject)) {
                cell?.cakeImage.image = image as? UIImage
                print("Image from cache")
            } else {
                CakeController.module.downloadImageFromString(urlString: cks[indexPath.row].image!, handler: { (img) in
                    if let im = img {
                        print("image from httpRequest")
                        self.cache!.setObject(im, forKey: cks[indexPath.row].image! as AnyObject)
                        cell?.cakeImage.image = im
                    }
                })

            }
        }
        return cell!
    }
    
    // TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

