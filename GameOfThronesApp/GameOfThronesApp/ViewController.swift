//
//  ViewController.swift
//  GameOfThronesApp
//
//  Created by Pravith on 23/01/19.
//  Copyright © 2019 Pravith. All rights reserved.
//

import UIKit
import IceAndFireKit

class ViewController: UIViewController {

    var booksArray : [IceAndFireBook]?
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchBookArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchBookArray(){
        
        var linkHeaders : IceAndFireLinkHeaders?
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(1, limit: 10) { (iceAndFireObjects : [IceAndFireBook]?, error : NSError?, returnedLinkHeaders : IceAndFireLinkHeaders?) -> Void in
            
            self.booksArray = iceAndFireObjects
            linkHeaders = returnedLinkHeaders
            
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksArray!.count
    }
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell?)!
        
        // set the text from the data model
        cell.textLabel?.text = self.booksArray?[indexPath.row].name
        
        return cell
    }


}

