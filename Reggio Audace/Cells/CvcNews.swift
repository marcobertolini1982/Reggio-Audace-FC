//
//  TableViewCell.swift
//  VApp
//
//  Created by Michele on 9/28/18.
//  Copyright © 2018 Len Solution. All rights reserved.
//

import UIKit
class CvcNews: CvcBase,ProFileObs,ProChannelObs
{
    func ChannelLoaded(data: Data)
    {
        DispatchQueue.main.async {
            self.img_prg_channel.image = UIImage(data: data)
        }
    }
    
    
    func FileLoaded(data: Data)
    {
        
        // Set image
        DispatchQueue.main.async
        {
            self.img_prg_file.image = UIImage(data: data)
        }
        
    }

    // Declarations
    @IBOutlet weak var lbl_des_title : UILabel!
    @IBOutlet weak var img_prg_file : UIImageView!
    @IBOutlet weak var img_prg_channel : UIImageView!
    @IBOutlet weak var lbl_dat_post : UILabel!
    @IBOutlet weak var btn_share : UIButton!
    @IBOutlet weak var lbl_Comments: UILabel!
    @IBOutlet weak var lbl_Reactions: UILabel!
    @IBOutlet weak var btn_Comments: UIButton!
    private var BTNCOMMENTSEVENT:((_ cell:UICollectionViewCell)-> Void)?
    public final var BtnCommentsEvent:((_ cell:UICollectionViewCell)->Void)?
        
        {
        get{return self.BTNCOMMENTSEVENT}
        set{self.BTNCOMMENTSEVENT = newValue}
    }
    @IBAction func OnBtnComemntsClick(_ sender: UIButton)
    {
        guard self.BTNCOMMENTSEVENT != nil else{return}
        self.BTNCOMMENTSEVENT!(self)
    }
   
    // Raised when the xib merge is execute
    override func awakeFromNib()
    {
        
        // Self
        super.awakeFromNib()
        // Set word wrap for the label
        self.lbl_des_title.lineBreakMode = NSLineBreakMode.byWordWrapping
    }
    
    func SetUiImageFile(prg_file: Int64) {
        
        // Declarations
        let l_FileView : FileView = FileView()
        
        // Add event
        l_FileView.SetOnFileLoaded(proFileObs: self)
        
        // Load file
        l_FileView.LoadFile(prg_file: prg_file)
        
    }
    func setChannelImage(prg_file:Int64)
    {
        
        // Declarations
        let l_ChannelView : ChannelView = ChannelView()
        
        // Add event
        l_ChannelView.SetOnChannelLoaded(proChannelObs: self)
        
        // Load file
        //l_ChannelView.LoadChannel(prg_file: prg_file)
    }
}
