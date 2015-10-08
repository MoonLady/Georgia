//
//  ArticlesCell.swift
//  Georgia
//
//  Created by MOZI Development on 10/8/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class ArticlesCell: UITableViewCell {
    
    let dataManager = DataManager()
    
    @IBOutlet weak var pablisher: UILabel!
    
    @IBOutlet weak var title: UITextView!
    
    @IBOutlet weak var articleImage: UIImageView!
    
    func setParametrs() {
        dataManager.getArticles({ (id: Int, title: String) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.title.text = title
            })
        })
    }
    
}
