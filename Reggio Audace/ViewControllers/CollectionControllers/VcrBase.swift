//
//  VcrBase.swift
//  Reggio Audace
//
//  Created by Michele on 29/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit
class VcrBase: UICollectionViewController,UITextFieldDelegate
{
   
    open var reuseIdentifier:String
    {
        return String()
    }
    
    open var NibNabe:String
    {
        return String()
    }
    
    open func Init()
    {
        // Register control
        self.collectionView?.register(UINib(nibName: self.NibNabe, bundle: nil), forCellWithReuseIdentifier: self.reuseIdentifier)
    }
    
    open override func viewDidLoad()
    {
        super.viewDidLoad()
        self.SetKeyBoardDismissable()
        self.SetTextFieldsDelegate()
        
    }
    func SetLayoutVertical(heigth: CGFloat)
    {
        
        // Declarations
        let l_Layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        // Set layout properties
        l_Layout.sectionInset = UIEdgeInsets(top:0,left:0,bottom:0,right:0)
        l_Layout.itemSize = CGSize(width: collectionView.bounds.width, height: heigth)
        l_Layout.minimumLineSpacing = 0
        
        // Set layout
        self.collectionView.collectionViewLayout = l_Layout
        
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
}
