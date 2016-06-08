//
//  Quote.swift
//  Quotely
//
//  Created by Zach Smoroden on 2016-06-08.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

import UIKit

class Quote: NSObject {
    
    var text    : String
    var author  : String
    var photo   : Photo?
    
    init(text:String, author:String) {
        self.text = text
        self.author = author
    }

}
