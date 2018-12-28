//
//  VcrRankingCollectionViewController.swift
//  Reggio Audace
//
//  Created by Michele on 28/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit


class VcrRankingCollectionViewController: VcrBase,ProRankingObs
{
    open override var reuseIdentifier: String
    {
        return "Ranking"
    }
    
    open override var NibNabe: String
    {
        return "CvcRankingItem"
    }
    
    func RankingLOaded(_ ranking: [RankingItem])
    {
        self.RANKING = ranking
        self.BindData()
    }
    
    open override func Init() {
        super.Init()
        self.SetLayoutVertical(heigth: 300)
    }
    
    var RANKING:[RankingItem] = [RankingItem]()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Init()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false


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

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.RANKING.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let l_Index:Int = indexPath.row
        let l_RankingItem:RankingItem = self.RANKING[l_Index]
      guard  let l_Cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? CvcRankingItem
        else
      {
        return UICollectionViewCell()
      }
        l_Cell.lbl_NUmRow.text = String(l_RankingItem.num_row!)
        l_Cell.lbl_DesTeam.text = l_RankingItem.des_team
        l_Cell.lbl_NUmMatches.text = String(l_RankingItem.num_matches!)
        l_Cell.lbl_NUmPoints.text = String(l_RankingItem.num_points!)
    return l_Cell
    }

    private final func LoadRecord()
    {
        let l_Rankingview:RankingView = RankingView()
        l_Rankingview.SetOnRakingLOad(self)
        l_Rankingview.LoadRanking()
    }

}
