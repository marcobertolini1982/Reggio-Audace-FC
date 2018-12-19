//
//  VcrLoginViewController.swift
//  Reggio Audace
//
//  Created by Michele on 03/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit
import FirebaseAuth
class CtlUserLogin: CtlBase
{
    @IBOutlet weak var txt_DesUserr:UITextField!
    @IBOutlet weak var txt_Password:UITextField!
    @IBOutlet weak var btn_LogIn:UIButton!
    
    @IBAction public func  OnSingInButtonClick(_ sender:UIButton)
    {
        Auth.auth().signIn(withEmail:txt_DesUserr.text!,password:txt_Password.text!){(dataResult:AuthDataResult?,error:Error?)in
            if error == nil, let l_user:FirebaseAuth.User = dataResult?.user
            {
                
                l_user.reload()
            }
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
