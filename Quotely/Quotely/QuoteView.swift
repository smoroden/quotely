//
//  QuoteView.swift
//  Quotely
//
//  Created by Zach Smoroden on 2016-06-08.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

import UIKit

class QuoteView: UIView {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    
    func setupWithQuote(quote: Quote) {
        quoteLabel.text = quote.text
        authorLabel.text = quote.author
        imageView.image = quote.photo?.image
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }

}
