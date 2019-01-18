//
//  CvcPostImage.swift
//  Reggio Audace
//
//  Created by Michele on 04/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class CvcPostImage: CvcBase, ProFileObs
{
    @IBOutlet weak var img_Post: UIImageView!
    func FileLoaded(data: Data)
    {
        DispatchQueue.main.async
        {
             self.img_Post.image = UIImage(data: data)
        }
       
    }
    
    func SetUiImageFile(prg_file: Int64)
    {
        
        // Declarations
        let l_FileView : FileView = FileView()
        
        // Add event
        l_FileView.SetOnFileLoaded(proFileObs: self)
        // Load file
        l_FileView.LoadFile(prg_file: prg_file)
    }
    
}
