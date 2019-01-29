//
//  TvcPostMessage.swift
//  Reggio Audace
//
//  Created by Michele on 17/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class TvcPostMessage: TvcBase,ProFileObs
{
    
    @IBOutlet weak var img_prg_file: UIImageView!
    
    @IBOutlet weak var txt_message: UITextView!
    
 
    override func Init()
    {
      super.Init()
        self.backgroundColor = ColorUtils.clear
        self.txt_message.layer.borderWidth = 1.0
        self.txt_message.layer.borderColor = GARNETCOLOR.cgColor
        self.txt_message.contentInset = UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0)
    }
    
    func FileLoaded(data: Data)
    {
        DispatchQueue.main.async
            {
                self.img_prg_file.image = UIImage(data: data)
        }
        
    }
    func SetUiImageFile(prg_file: Int64?)
    {
        
        // Declarations
        let l_FileView : FileView = FileView()
        
        // Add event
        l_FileView.SetOnFileLoaded(proFileObs: self)
        // Load file
        l_FileView.LoadFile(prg_file: prg_file)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.img_prg_file.image = nil
    }
}
