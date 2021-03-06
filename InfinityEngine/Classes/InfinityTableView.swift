// InfinityEngine
//
// Copyright Ryan Willis (c) 2016
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

/**
 Defines a struct used when incoporating an InfinityTableView.
 
 - parameter tableView:                 Reference to a UICollectionView, whether it be an Object or IBOutlet reference.
 - parameter tableViewCells:            Will need to define the name of your cells and id.
 - parameter modifiers:                 See InfinityModiers - modifiers the behavior of InfinityEngine,
                                        in reference to a UICollectionView.
 */

public struct InfinityTableView {
    let tableView: UITableView!
    let tableViewCellNibNames: [String]!
    let tableViewLoadingCellINibName: String!
    let modifiers: InfinityModifers!
    
    public init(tableView: UITableView, tableViewCellNibNames: [String]!, tableViewLoadingCellINibName:String, modifiers: InfinityModifers? = InfinityModifers()) {
        self.tableView = tableView
        self.tableViewCellNibNames = tableViewCellNibNames
        self.tableViewLoadingCellINibName = tableViewLoadingCellINibName
        self.modifiers = modifiers
    }
}

/**
 Defines a Protocol to be Implemented on a UIViewControl
 
 - func infinityCellForIndexPath:       Used to return the the corect cell in either placeholder, or live data state.
 - func infinityLoadingCell:            Used to return the desired loading cell you would like to appear at the bottom of the pages InfinityTableView.
 - func infinityTableView:              Used to define the height of each cell, excluding the loading cell.
 */


public protocol InfinityTableViewProtocol: InfinityTableViewProtocolOptional, InfinityDataSource {
    func infinityCellForIndexPath(indexPath: NSIndexPath, withData data:[AnyObject]?, withPlaceholder placeholder:Bool) -> UITableViewCell
    func infinityLoadingCell(indexPath: NSIndexPath) -> UITableViewCell
    func infinityTableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
}

/**
 Defines an Optional Protocol to be Implemented on a UIViewControl
 
 - func infinityTableView:              Used to return the loading cell height, else the default will be kLoadingCellHeight.
 */

@objc public protocol InfinityTableViewProtocolOptional: class {
    optional func infinityTableView(tableView: UITableView, heightForLoadingCellAtIndexPath indexPath: NSIndexPath) -> CGFloat
}

/**
 Defines an extension to be Implemented on a UIViewController
 
 - func startInfinityTableView:         Used to start the InfinityTableView session.
 - func resetInfinityTable:             Used to reset/restart the InfinityTableView session.
 */


extension InfinityTableViewProtocol where Self: UIViewController {
    public func startInfinityTableView(infinityTableView infinityTable:InfinityTableView, withDelegate: InfinityTableViewProtocol) {
        InfinityEngineRoom.sharedTableInstances.append(TableViewEngine(infinityTableView: infinityTable, delegate: withDelegate))
    }
    
    public func resetInfinityTable() {
        
        for collectionInstance in InfinityEngineRoom.sharedTableInstances {
            collectionInstance.engine.resetData()
            collectionInstance.initiateEngine()
        }
    }
}