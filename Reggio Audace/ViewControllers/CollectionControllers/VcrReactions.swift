//
//  VcrReactions.swift
//  Reggio Audace
//
//  Created by Michele on 01/02/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit



class VcrReactions: VcrBase,ProReactionObs
{
    private var REACTIONS:[Reaction] = [Reaction]()
    private var PRGPOST:Int64?
    public final  var PrgPost:Int64?
    {
        get{return self.PRGPOST}
        set{self.PRGPOST = newValue}
    }
    
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder:aDecoder)
    }


   override var reuseIdentifier: String
    {
        return "Reaction"
    }
   
    override var NibNabe: String
    {
        return "CvcReaction"
    }
    

    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
      
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.REACTIONS.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        guard let l_Cell:CvcReaction = collectionView.dequeueReusableCell(withReuseIdentifier: "Reaction", for: indexPath) as? CvcReaction
        
        else
        {
            return UICollectionViewCell()
        }
        
    
        // Configure the cell
        l_Cell.txt_des_emoticon.text = self.REACTIONS[indexPath.item].des_emoticon
        return l_Cell
    }
    
   override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
       self.navigationController?.popViewController(animated:true)
    }
    
    func ReactionsLoaded(reactions: [Reaction])
    {
        self.REACTIONS = reactions
        self.BindData()
        
    }
    
    override func Init()
    {
        super.Init()
        self.modalPresentationStyle = UIModalPresentationStyle.currentContext
        
    }
    
    func LoadRecord()
    {
        let l_ReactionView:ReactionsView = ReactionsView()
        l_ReactionView.SetReactionsLOaded(proreactionobs: self)
        l_ReactionView.LoadReactions()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.LoadRecord()
    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width:50, height: 50)
    }
}
