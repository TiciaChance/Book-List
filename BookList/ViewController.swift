//
//  ViewController.swift
//  BookList
//
//  Created by Laticia Chance on 12/17/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, BookInformationDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bookTest = DataManager(delegate: self)

    
        bookTest.getBooks { (_: [String], _: [JSON]) in
            print("WORKING")
        }
    }
    
    func didGetBookInfo(book: Books) {
        //what happens when i get the book
    }
    
    func didNotGetBookInfo(error: Error) {
        //what happens if i don't
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

