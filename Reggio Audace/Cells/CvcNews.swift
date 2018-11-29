//
//  TableViewCell.swift
//  VApp
//
//  Created by Michele on 9/28/18.
//  Copyright © 2018 Len Solution. All rights reserved.
//

import UIKit
class CvcNews: UICollectionViewCell,ProFileObs
{
    
    func FileLoaded(data: Data)
    {
        
        // Set image
        DispatchQueue.main.async {
            self.img_prg_file.image = UIImage(data: data)
        }
        
    }

    // Declarations
    @IBOutlet weak var lbl_des_title : UILabel!
    @IBOutlet weak var img_prg_file : UIImageView!
    @IBOutlet weak var img_prg_channel : UIImageView!
    @IBOutlet weak var lbl_dat_post : UILabel!
    @IBOutlet weak var btn_share : UIButton!
    
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
    
}
