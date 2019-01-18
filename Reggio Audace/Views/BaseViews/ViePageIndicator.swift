//
//  ViePageIndicator.swift
//  Reggio Audace
//
//  Created by Michele on 04/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class ViePageIndicator: VieBase,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    // Declarations
    @IBOutlet weak var Cvi_Headcers: UICollectionView!
     private var TITLES:[String] = [String]()
    convenience init(frame: CGRect,headertitles:[String])
    {
        self.init(frame: frame)
        self.Cvi_Headcers.frame = self.CONTENTVIEW.bounds
        (self.Cvi_Headcers.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = UICollectionView.ScrollDirection.horizontal
        self.Cvi_Headcers.dataSource = self
        self.Cvi_Headcers.delegate = self
        self.TITLES.append(contentsOf:headertitles)
        self.Cvi_Headcers.register(UINib(nibName: "CvcHeader", bundle: nil), forCellWithReuseIdentifier: "Header")
    }
    
   
    
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let l_Width:CGFloat = self.Cvi_Headcers.bounds.width/CGFloat(self.TITLES.count)
        let l_Height:CGFloat = self.Cvi_Headcers.bounds.height
        return CGSize(width: l_Width, height: l_Height)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.TITLES.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let l_Inderx:Int = indexPath.item
        guard let l_Cell:CvcHeader = self.Cvi_Headcers.dequeueReusableCell(withReuseIdentifier: "Header", for: indexPath) as? CvcHeader
        else
        {
            return UICollectionViewCell()
        }
        l_Cell.lbl_title.text = self.TITLES[l_Inderx]
      return l_Cell
    }
    
    //Declarations
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let l_Cell:CvcHeader? = Cvi_Headcers.cellForItem(at:indexPath) as? CvcHeader
        l_Cell?.lbl_title.textColor = GARNETCOLOR
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
    {
        let l_Cell:CvcHeader? = Cvi_Headcers.cellForItem(at:indexPath) as? CvcHeader
        l_Cell?.lbl_title.textColor = ColorUtils.black
    }
    
   open override var NIBNAME: String
    {
        return "ViePageIndicator"
    }
    
    
}
