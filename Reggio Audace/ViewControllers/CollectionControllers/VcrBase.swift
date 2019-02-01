//
//  VcrBase.swift
//  Reggio Audace
//
//  Created by Michele on 29/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit
class VcrBase: UICollectionViewController,UITextFieldDelegate,UICollectionViewDelegateFlowLayout
{
   open  var LayoutInsets:UIEdgeInsets
    {
     return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    open  var LayoutLineSpacing:CGFloat
    {
        return 0.0
    }
    open var reuseIdentifier:String
    {
        return String()
    }
    
    open var NibNabe:String
    {
        return String()
    }
    
    open var LayoutHeight:CGFloat
    {
        return 50.0
    }
    open func Init()
    {
        // Register control
        self.collectionView.register(UINib(nibName: self.NibNabe, bundle: nil), forCellWithReuseIdentifier: self.reuseIdentifier)
        (self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumLineSpacing = LayoutLineSpacing
        self.collectionView.delegate = self
    }
    
    open override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Init()
        self.SetKeyBoardDismissable()
        self.SetTextFieldsDelegate()
        
    }
 

    func BindData()
    {
        
        DispatchQueue.main.async {
            
            // Bind data
            self.collectionView?.reloadData()
            
        }
        
    }
    
   
    open func SetKeyBoardDismissable()
    {
        let l_GestureRecognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(self.DismissKeyBoard))
        l_GestureRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(l_GestureRecognizer)
    }
    @objc
    func DismissKeyBoard()
    {
        // Dismiss KeyBoard
        self.view.endEditing(true)
        
    }
    open func SetTextFieldsDelegate()
    {
        // Eec loop through views
        for l_TextField in self.view.subviews
        {
            // Eval
            if l_TextField is UITextField
            {
                // Add delegate to subview of main view
                (l_TextField as? UITextField)?.delegate = self
                
            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Dismiss KeyBoard
        textField.endEditing(true)
        return true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width:collectionView.bounds.width, height:self.LayoutHeight)
    }
   
}
