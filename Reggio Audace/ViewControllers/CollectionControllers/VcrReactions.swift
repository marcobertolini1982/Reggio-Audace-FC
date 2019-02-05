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
   // Properties
    private weak var PROVCRREACTIONSOBS:ProVcrReactionsObs?
    private var PRGPOST:Int64?
    private var num_reactions:Int64?
    private var REACTIONS:[Reaction] = [Reaction]()
    public final  var PrgPost:Int64?
    {
        get{return self.PRGPOST}
        set{self.PRGPOST = newValue}
    }
   
    public final var proVcrReactionsObs:ProVcrReactionsObs?
    {
        get{return self.PROVCRREACTIONSOBS}
        set{PROVCRREACTIONSOBS = newValue}
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
        let l_Index:Int = indexPath.item
        guard let l_Parent:UIAlertController = self.parent as? UIAlertController else{return}
        let l_ReactionView:ReactionsView = ReactionsView()
        l_ReactionView.SaveReaction(prg_post: self.PRGPOST,prg_reaction:self.REACTIONS[l_Index].prg_reaction)
        self.PROVCRREACTIONSOBS?.Dismissed()
        l_Parent.dismiss(animated: true)
    }
    
    func ReactionsLoaded(reactions: [Reaction])
    {
        self.REACTIONS = reactions
        self.BindData()
        
    }
    
    override func Init()
    {
        super.Init()        
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
        return CGSize(width:24.0, height: 22.0)
    }
    
   
            
}


