//
//  CvcComments.swift
//  Reggio Audace
//
//  Created by Michele on 04/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class TvcPostMessage: UITableViewCell,ProFileObs
{
    func FileLoaded(data: Data)
    {
        DispatchQueue.main.async
            {
                self.img_prg_file.image = UIImage(data: data)
            }
    }
    // Declarations
    @IBOutlet weak var txt_message: UITextView!
    @IBOutlet weak var img_prg_file: UIImageView!
    func SetUiImageFile(prg_file: Int64)
    {
        
        // Declarations
        let l_FileView : FileView = FileView()
        
        // Add event
        l_FileView.SetOnFileLoaded(proFileObs: self)
        // Load file
        l_FileView.LoadFile(prg_file: prg_file)
        
    }
  
    
    open override func awakeFromNib()
    {
        super.awakeFromNib()
        self.txt_message.layer.borderWidth = 1.0
        self.txt_message.layer.borderColor = GARNETCOLOR.cgColor
        self.contentView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
    }
    

}
