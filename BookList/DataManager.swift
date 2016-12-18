//
//  DataManager.swift
//  BookList
//
//  Created by Laticia Chance on 12/17/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol BookInformationDelegate {
    func didGetBookInfo(book: Books)
    func didNotGetBookInfo(error: Error)
}

class DataManager {
    
    let baseURL = "http://prolific-interview.herokuapp.com/580a6f457252b50009068a43/books"
    
    var bookTitles = [String]()
    var author = [String]()
    var publisher = [String]()
    var tags = [String]()
    var id = [Int]()
    var bookInformation = [JSON]()
    
    var delegate: BookInformationDelegate
    
    init(delegate: BookInformationDelegate) {
        self.delegate = delegate
    }
    
    
    
    func getBooks(completion: @escaping (_ title: [String], _ info: [JSON]) -> Void) {
        
        
        //every time that getBooks is called I remove anything that is added to the original array
        //self.bookTitles.removeAll()
        //self.bookInformation.removeAll()
        
        Alamofire.request(self.baseURL).responseJSON { response in
            
            if response.result.value != nil {
                
                let jsonObject = JSON(data: response.data!).arrayValue
                
                for dictionariesOfInfo in jsonObject {
                    
                    self.bookInformation.append(dictionariesOfInfo)
                    self.bookTitles.append(dictionariesOfInfo["title"].stringValue)
                    self.author.append(dictionariesOfInfo["author"].stringValue)
                    self.publisher.append(dictionariesOfInfo["publisher"].stringValue)
                    self.tags.append(dictionariesOfInfo["categories"].stringValue)
                    self.id.append(dictionariesOfInfo["id"].intValue)
                    
                    let books = Books(title: self.bookTitles, author: self.author, publisher: self.publisher, tag: self.tags, id: self.id)
                    
                    self.delegate.didGetBookInfo(book: books)
                    
                    completion(self.author, self.bookInformation)
                }
                
                print(self.bookInformation)
                
                
            }
        }
        
    }
}

