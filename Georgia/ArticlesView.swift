//
//  ArtclesView.swift
//  Georgia
//
//  Created by MOZI Development on 10/15/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class ArticlesView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dataManager = DataManager()

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var bannerButton: UIButton!
    
    @IBOutlet var filters: UIBarButtonItem!
   
    @IBOutlet var settings: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItems = [self.filters, self.settings] as [AnyObject]
        self.navigationItem.title = "News Feed"
        var backButton = UIBarButtonItem(image: UIImage(named: "feed_back_button@3x.png"), style: .Plain, target: self, action: "closeView")
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.setHidesBackButton(false, animated: true)
        self.dataManager.getBanners({(image: UIImage) -> Void in
            dispatch_async(dispatch_get_main_queue(), {() -> Void in
                self.bannerButton.setBackgroundImage(image, forState: UIControlState.Normal)
            })
    })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Articles Cell", forIndexPath: indexPath) as! ArticlesCell
        cell.setParametrs()
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 109.0
    }
    
    func closeView() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.barTintColor = UIColor.redColor()
    }

}
