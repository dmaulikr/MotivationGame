//
//  ViewController.swift
//  MotivationGame
//
//  Created by ecchilds on 7/19/16.
//  Copyright © 2016 LaLiza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let dataSource = [false, false, false, true, false]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func highlightCell(indexPath : NSIndexPath, flag: Bool) {

        let cell = collectionView.cellForItemAtIndexPath(indexPath)

        if flag {
            cell?.contentView.backgroundColor = UIColor.magentaColor()
        } else {
            cell?.contentView.backgroundColor = nil
        }
    }

}


extension ViewController : UICollectionViewDataSource {

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Peg",forIndexPath:indexPath) as! Peg

        cell.pegLabel.text = dataSource[indexPath.row] ? "YES!" : "NO!"

        return cell
    }


}

// MARK:- UICollectionViewDelegate Methods

extension ViewController : UICollectionViewDelegate {

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        highlightCell(indexPath, flag: true)
    }

    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        highlightCell(indexPath, flag: false)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    // MARK:- UICollectioViewDelegateFlowLayout methods

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        // http://stackoverflow.com/questions/28872001/uicollectionview-cell-spacing-based-on-device-sceen-size

        let length = (UIScreen.mainScreen().bounds.width-15)/2
        return CGSizeMake(length,length);
    }
}