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
    @IBOutlet weak var txt_User:UITextField!
    @IBOutlet weak var txt_Password:UITextField!
    @IBOutlet weak var btn_Register:UIButton!
    
    @IBAction func OnBtnRegisterClick(_ sender:UIButton)
    {
    
        AuthUtils.Authentication.createUser(withEmail: txt_User.text!, password: txt_User.text!){(authResult,error)in
            guard error != nil else{ return}
            
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
