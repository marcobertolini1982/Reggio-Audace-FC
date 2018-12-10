//
//  CtlUserData.swift
//  Reggio Audace
//
//  Created by Michele on 06/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class CtlUserData: CtlBase
{
    // Declarations
    @IBOutlet var txt_UserData:[UITextField]!
    
    
    override func viewDidLoad()
    {
        //Call base function
        super.viewDidLoad()
        //Init
        
       
    }
    
    open override func viewWillAppear(_ animated: Bool)
    {
        // Call super method
        super.viewWillAppear(animated)
        // Disable text fields
        self.SetUserInfoEnabled(false)
        // Show edit button
        self.SetEditButton()
    }
    
   
    
    open override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        self.SetUserInfoEnabled(false)
    }
    
    open override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.HideEditButton()
    }
    private final func SetEditButton()
    {
        let l_EditButton:UIBarButtonItem  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.edit, target: self, action:SelectorUtils.EditSelector)
        
        self.tabBarController?.navigationItem.rightBarButtonItem = l_EditButton
    }
    
    private final func HideEditButton()
    {
        
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }
    
    private final func SetUserInfoEnabled(_ enabled:Bool)
    {
        // Set all text fields disabled
        for txt_UserInfo in txt_UserData
        {
            txt_UserInfo.isEnabled = enabled
        }
    }
    
    private final func SetDoneButton()
    {
        let l_DoneButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action:SelectorUtils.DoneSelector)
        self.tabBarController?.navigationItem.rightBarButtonItem = l_DoneButton
    }
    
    //Actions
    @objc func OnEditClick(_ sender:UIBarButtonItem)
    {
        SetUserInfoEnabled(true)
       self.SetDoneButton()
    }
    
    @objc func OnDoneClick(_ sender:UIBarButtonItem)
    {
        self.SetEditButton()
        self.SetUserInfoEnabled(false)
    }
}
