//
//  VcrRankingCollectionViewController.swift
//  Reggio Audace
//
//  Created by Michele on 28/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit


class VcrRanking: VcrBase,ProRankingObs
{
      // Declarations
   private lazy var RANKING:[RankingItem] = [RankingItem]()
    
    
    open override var reuseIdentifier: String
    {
        // Return
        return "Ranking"
    }
    
    open override var NibName: String
    {
        // Return
        return "CvcRankingItem"
    }
    
    func RankingLoaded(ranking: [RankingItem])
    {
        // Set property
        self.RANKING = ranking
        self.BindData()
    }
    
    override var LayoutHeight: CGFloat
    {
        return 60.0
    }

    private final func LoadRecord()
    {
        // Declarations
        let l_Rankingview:RankingView = RankingView()
        // Add ranking observer
        l_Rankingview.SetOnRakingLoaded(self)
        //
        l_Rankingview.LoadRanking()
    }
    
    override func viewDidLoad()
    {
        // Call super class method
        super.viewDidLoad()
    }

    open override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.LoadRecord()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        // Return
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        // Return
        return self.RANKING.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        // Declarations
        let l_Index:Int = indexPath.row
        let l_RankingItem:RankingItem = self.RANKING[l_Index]
        guard  let l_Cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? CvcRankingItem
        else
      {
        return UICollectionViewCell()
      }
        
        l_Cell.lbl_NUmRow.text = "\(l_RankingItem.num_row ?? Int64())"
        l_Cell.lbl_DesTeam.text = l_RankingItem.des_team
        l_Cell.lbl_NUmMatches.text = "\(l_RankingItem.num_matchs ?? Int64())"
        l_Cell.lbl_NUmPoints.text = "\(l_RankingItem.num_points ?? Int64())"
        return l_Cell
    }


}
