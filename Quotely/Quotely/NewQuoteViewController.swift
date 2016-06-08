//
//  NewQuoteViewController.swift
//  Quotely
//
//  Created by Zach Smoroden on 2016-06-08.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NewQuoteViewController: UIViewController {
    
    var quote : Quote?
    
    var quoteView :QuoteView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Load the quote view
        
        if let objects = NSBundle.mainBundle().loadNibNamed("QuoteView", owner: nil, options: [:]),
            quoteView = objects.first as? QuoteView {
            // set up view in view hierarchy
            
            self.view.addSubview(quoteView)
            
            view.translatesAutoresizingMaskIntoConstraints = false
            
            self.view.addConstraint(NSLayoutConstraint(item: quoteView, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: quoteView, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: quoteView, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: quoteView, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Trailing, multiplier: 1, constant: 0))
            
            
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getNewImage(sender: UIButton) {
    }

    @IBAction func getNewQuote(sender: UIButton) {
        newQuote()
    }
    
    func newQuote() {
        Alamofire.request(.GET, "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json").responseJSON { response in
            
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    self.quote = Quote(text: json["quoteText"].stringValue, author: json["quoteAuthor"].stringValue)
                    
                    if let quoteView = self.quoteView, quote = self.quote {
                        quoteView.setupWithQuote(quote)
                    }
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol QuoteDelegate {
    func newQuote(quote:Quote)
}
