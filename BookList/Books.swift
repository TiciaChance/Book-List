//
//  Books.swift
//  BookList
//
//  Created by Laticia Chance on 12/17/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Books {
    
    
    
    var title: [String]
    var author: [String]
    var publisher: [String]
    var tag: [String]
    var id: [Int]
    
    init(title: [String], author: [String], publisher: [String], tag: [String], id: [Int]) {

        self.title = title
        self.author = author
        self.publisher = publisher
        self.tag = tag
        self.id = id
    }

}
