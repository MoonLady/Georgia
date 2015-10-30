//
//  Publishers.swift
//  
//
//  Created by MOZI Development on 10/6/15.
//
//

import UIKit
import CoreData

class PublishersView: UITableViewController {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    let dataManager = DataManager()
    
    var publishers = [Publisher]()
    
    var indexOfSelectedCell: Int!
    
    @IBOutlet weak var selectAll: UIBarButtonItem!
    
    let added = UIImage(named: "publishers_added_icon@3x.png")
    
    let add = UIImage(named: "publishers_add_icon@3x.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.dataManager.getPublishers(nil, completionHandler: {(publisherForArticle) -> Void in})
        let entityDescription = NSEntityDescription.entityForName("Publisher", inManagedObjectContext: managedObjectContext!)
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entityDescription
        let results = managedObjectContext?.executeFetchRequest(fetchRequest, error: nil)
        self.publishers = results as! [Publisher]
        for publisher in publishers {
            if publisher.isSelected as? Int == 1 {
                self.selectAll.title = "Unselect All"
                break
            }
        }
        self.tableView!.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return publishers.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Publishers cell", forIndexPath: indexPath) as! PublishersCell
        if publishers.count > 0 {
            cell.setParametrs(publishers[indexPath.row])
        }
        cell.selectAll = self.selectAll
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.barTintColor = UIColor.redColor()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "seguePublisher" {
            let publisherView = segue.destinationViewController as! PublisherView
            publisherView.publisher = publishers[indexOfSelectedCell]
        }
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        indexOfSelectedCell = indexPath.row
        return indexPath
    }
    
    @IBAction func tapSelectAll(sender: AnyObject) {
        if selectAll.title == "Select All" {
            for publisher in publishers {
                if publisher.isSelected != 1 {
                    publisher.isSelected = 1
                }
            }
            self.selectAll.title = "Unselect All"
        } else {
            if selectAll.title == "Unselect All" {
                for publisher in publishers {
                    if publisher.isSelected == 1 {
                        publisher.isSelected = 0
                    }
                }
                self.selectAll.title = "Select All"
            }
        }
        self.tableView.reloadData()
        self.managedObjectContext?.save(nil)
    }
    
    
    
}