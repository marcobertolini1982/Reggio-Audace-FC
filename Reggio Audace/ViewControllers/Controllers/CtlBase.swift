//
//  CtlBase.swift
//  Reggio Audace
//
//  Created by Michele on 06/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class CtlBase: UIViewController,UITextFieldDelegate
{
    open var Parent:PagPost?
    {
        return self.parent as? PagPost
    }
    
    var reuseIdentifier: String
    {
        return String()
    }
    
    var NibName: String
    {
        return String()
    }
    
    var EdgeInset: UIEdgeInsets
    {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
   open func Init()
   {
    super.viewDidLoad()
   }
    override func viewDidLoad()
    {
        
        self.Init()
        self.SetKeyBoardDismissable()
        self.SetTextFieldsDelegate()
        // Do any additional setup after loading the view.
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
    
    func BindData()
    {
        
    }
}
