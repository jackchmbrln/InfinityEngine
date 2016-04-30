// InfinityEngine
//
// Copyright (c) 2016
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
 Defines a struct used when incoporating an InfinteCollectionView.
 
 - parameter collectionView:            Reference to a UICollectionView, whether it be an Object or IBOutlet reference.
 - parameter collectionViewCells:       Will need to define the name of your cells and id.
 - parameter modifiers:                 See InfinityModiers - modifiers the behavior of InfinityEngine, 
                                        in reference to a UICollectionView.
  
 */

public struct InfinityCollectionView {
    let collectionView: UICollectionView!
    let collectionViewCells: [(nib: UINib, id: String)]!
    let modifiers: InfinityModifers!
    
    public init(collectionView: UICollectionView!, collectionViewCells: [(nib: UINib, id: String)]!, modifiers: InfinityModifers? = InfinityModifers()) {
        self.collectionView = collectionView
        self.collectionViewCells = collectionViewCells
        self.modifiers = modifiers
    }
}

/**
 Defines a Protocol to be Implemented on a UIViewControl
 
 - parameter Road: For streets or trails.
 - parameter Touring: For long journeys.
 - parameter Cruiser: For casual trips around town.
 - parameter Hybrid: For general-purpose transportation.
 */

public protocol InfinityCollectionViewDelegate: InfinityView {
    func infinityCellItemForIndexPath(indexPath: NSIndexPath, placeholder:Bool) -> UICollectionViewCell
}

/**
 Defines a Protocol to be Implemented on a UIViewControl
 
 - parameter Road: For streets or trails.
 - parameter Touring: For long journeys.
 - parameter Cruiser: For casual trips around town.
 - parameter Hybrid: For general-purpose transportation.
 */


extension InfinityCollectionViewDelegate where Self: UIViewController {
    public func startInfinityCollectionView(infinityCollectionView infinityCollection:InfinityCollectionView, withDelegate: InfinityCollectionViewDelegate) {
        //self.collectionViewEngine = CollectionViewEngine(infinityCollectionView: infinityCollection, delegate: withDelegate)
        InfinityEngineRoom.sharedInstances.append(CollectionViewEngine(infinityCollectionView: infinityCollection, delegate: withDelegate))
    }
}