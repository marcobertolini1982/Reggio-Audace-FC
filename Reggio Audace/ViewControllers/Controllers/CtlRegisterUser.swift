//
//  VcrRegisterViewController.swift
//  Reggio Audace
//
//  Created by Michele on 03/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit
import FirebaseAuth
class CtlRegisterUser: CtlBase
{
    // Declarations
    @IBOutlet weak var txt_User:UITextField!
    @IBOutlet weak var txt_Password:UITextField!
    @IBOutlet weak var txt_password_confirm:UITextField!
    @IBOutlet weak var btn_Register:UIButton!
    
    @IBAction func OnBtnRegisterClick(_ sender:UIButton)
    {
    
        AuthUtils.Authentication.createUser(withEmail: txt_User.text!, password: txt_User.text!){(authResult,error)in
            guard error != nil && self.txt_Password.text == self.txt_password_confirm.text  else{ return}
            
            let l_user:User
            let l_Device:Device
            l_user.cod_user = AuthUtils.Uid
            l_user.des_user = AuthUtils.UserEmail
            
        }
       
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
