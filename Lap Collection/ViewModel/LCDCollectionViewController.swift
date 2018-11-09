//
//  LCDCollectionViewController.swift
//  Lap Collection
//
//  Created by Marvel Alvarez Rojas on 04/11/2018.
//  Copyright © 2018 Marvel Alvarez Rojas. All rights reserved.
//

import UIKit

class LCDCollectionViewController: UICollectionViewController{
    
    var lapCollectionViewModel: LapCollectionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    func initView(){
        navigationItem.largeTitleDisplayMode = .never
        title = lapCollectionViewModel?.title
        self.collectionView!.register(LCImageCollectionViewCell.self, forCellWithReuseIdentifier: Const.cellidImage)
        self.collectionView!.register(LCContentCollectionViewCell.self, forCellWithReuseIdentifier: Const.cellidContent)
    }
    
    private func textHeight()-> CGFloat{
        let aprox = view.frame.width - 32 - 5
        let size = CGSize(width: aprox, height: 2000)
        let atrib = [kCTFontAttributeName: UIFont.systemFont(ofSize: 15)]
        var estimateheigth = CGRect()
        if let temp = lapCollectionViewModel?.description{
            estimateheigth = NSString(string: temp).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: atrib as [NSAttributedString.Key : Any], context: nil)
        }
        return estimateheigth.height
    }
}

extension LCDCollectionViewController: UICollectionViewDelegateFlowLayout{
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell = self.collectionView!.dequeueReusableCell(withReuseIdentifier: Const.cellidImage, for: indexPath) as! LCImageCollectionViewCell
            cell.lapCollection = lapCollectionViewModel
            return cell
        }
        let cell = self.collectionView!.dequeueReusableCell(withReuseIdentifier: Const.cellidContent, for: indexPath) as! LCContentCollectionViewCell
        cell.lapCollection = lapCollectionViewModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {return CGSize(width: view.frame.width, height: 300 )}
        return CGSize(width: view.frame.width, height: textHeight() + 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {return UIEdgeInsets(top: 5, left: 0, bottom: 20, right: 0)}
        return UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
    }
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
}
