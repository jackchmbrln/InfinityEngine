//
//  TestTableViewController.swift
//  InfintyEngineV2
//
//  Created by Ryan Willis on 26/04/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit
import InfinityEngine

class TestTableViewController: UIViewController, InfinityTableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    init() {
        super.init(nibName: "TestTableViewController", bundle: NSBundle.mainBundle())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor.lightGrayColor()
        
        let tableViewStruct:InfinityTableView = InfinityTableView(tableView: self.tableView,
            tableViewCellNibNames: ["TestTableViewCell"], tableViewLoadingCellINibName: "LoadingTableViewCell")
        
        startInfinityTableView(infinityTableView: tableViewStruct, withDelegate: self)
    }
    
    func infinityCellForIndexPath(indexPath: NSIndexPath, placeholder: Bool) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("TestTableViewCell", forIndexPath: indexPath) as! TestTableViewCell
        if placeholder == true {
            cell.contentView.backgroundColor = UIColor.redColor()
        } else {
            cell.contentView.backgroundColor = UIColor.orangeColor()
        }
        return cell
    }
    
    func infinityLoadingCell(indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("LoadingTableViewCell", forIndexPath: indexPath) as! LoadingTableViewCell
        cell.backgroundColor = UIColor.purpleColor()
        return cell
    }
    
    func infinityDidSelectItemAtIndexPath(indexPath: NSIndexPath) {
        
    }
    
    func infinityData(atPage page: Int, withModifiers modifiers: InfinityModifers, completion: (responsePayload: ResponsePayload) -> ()) {
        let data:String = "test"
        var datas:[AnyObject] = [AnyObject]()
        
        datas.append(data)
        datas.append(data)
        datas.append(data)
        datas.append(data)
        datas.append(data)
        datas.append(data)
        datas.append(data)
        datas.append(data)
        datas.append(data)
        datas.append(data)
        
        delay(1.0) {
            completion(responsePayload: ResponsePayload(data: datas, count: 10, lastPage: false, perPage: 10, total: 10))
        }
    }
}