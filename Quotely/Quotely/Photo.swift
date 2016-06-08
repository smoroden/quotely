//
//  Photo.swift
//  Quotely
//
//  Created by Zach Smoroden on 2016-06-08.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

import UIKit

class Photo: NSObject {
    
    let apiString = "https://unsplash.it/600/300?image="
    
    var image   : UIImage?
    var filename: String
    
    init(filename: String) {
        self.filename = filename
    }
    
    

}
