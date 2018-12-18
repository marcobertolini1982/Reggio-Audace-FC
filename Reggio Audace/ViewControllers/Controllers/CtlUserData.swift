//
//  CtlUserData.swift
//  Reggio Audace
//
//  Created by Michele on 06/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class CtlUserData: CtlBase,ProUserObs
{
    
    // Declarations
   
    @IBOutlet weak  var img_User:UIImageView!
    @IBOutlet weak var lbl_email:UILabel!
    @IBOutlet var txt_UserData:[UITextField]!
    
    
    func UserLoaded(user: User)
    {
        
        self.LoadUserData(user: user)
      
     
    }
    
    private final func LoadUserData(user:User)
    {
        DispatchQueue.main.async
            {
                self.txt_UserData[0].text = user.des_user
                self.txt_UserData[1].text = user.des_topic
                self.txt_UserData [2].text = user.des_presentation
                self.lbl_email.text = self.lbl_email.text! + user.des_email!
                
            }
    }
    
    override func viewDidLoad()
    {
        //Call base function
        super.viewDidLoad()
        let l_UserView:UserView = UserView()
        l_UserView.AddUserObs(prouserobs:self)
        l_UserView.GetUser(cod_user: AuthUtils.Uid!)
        
        
       
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
        self.SetDoneButton()
        SetUserInfoEnabled(true)
      
    }
    
    @objc func OnDoneClick(_ sender:UIBarButtonItem)
    {
        // Declarations
        
        self.SetEditButton()
        self.SetUserInfoEnabled(false)
    }
}
