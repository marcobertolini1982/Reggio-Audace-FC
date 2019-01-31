//
//  VcrSeasonMenuCollectionViewController.swift
//  Reggio Audace
//
//  Created by Michele on 10/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit


class VcrSeasonMenu: VcrBase
{
    open override var reuseIdentifier: String
    {
       return "IDSEASONMENU"
    }
    
    open override var NibNabe: String
    {
        return "CvcSeasonMenu"
    }
    override var LayoutHeight: CGFloat
    {
        return self.collectionView.bounds.height
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Init()
      

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let l_Cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? CvcSeasonMenu else{return UICollectionViewCell()}
    
        // Configure the cell
    
        return l_Cell
    }
    
    @objc
    public func OnRanking_Click(_ sender:UIButton)
    {
        // Declarations
        let l_VcrRanking:UIViewController = MainStoryboard.instantiateViewController(withIdentifier: "VcrRanking")
        // Show ranking
        self.tabBarController?.navigationController?.pushViewController(l_VcrRanking, animated: true)
    }

}
