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
    @IBOutlet weak var Cvi_Headcers: CviHeader!
     private var TITLES:[String] = [String]()
    convenience init(frame: CGRect,headertitles:[String])
    {
        self.init(frame: frame)
        
        (self.Cvi_Headcers.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = UICollectionView.ScrollDirection.horizontal
        self.Cvi_Headcers.dataSource = self
        self.Cvi_Headcers.delegate = self
        self.TITLES.append(contentsOf:headertitles)
        self.Cvi_Headcers.register(UINib(nibName: "CvcHeader", bundle: nil), forCellWithReuseIdentifier: "Header")
    }
    
   
    
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        guard let l_FloewLayout:UICollectionViewFlowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        else
        {
            return CGSize(width: 0.0, height:0.0)
        }
        
    
        let l_Insets:UIEdgeInsets = l_FloewLayout.sectionInset
        let l_Spacing:CGFloat = l_FloewLayout.minimumInteritemSpacing * CGFloat(self.TITLES.count - 1)
        let l_Space:CGFloat = l_Insets.left + l_Insets.right + l_Spacing
        let l_Size:CGFloat = (self.Cvi_Headcers.bounds.width - l_Space)/CGFloat(self.TITLES.count)
        return CGSize(width: l_Size, height: l_Size)
        
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
        self.Cvi_Headcers.proCviHeader?.Item_Selected(indexpath: indexPath)
       
        
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
