//
//  VcrLoginViewController.swift
//  Reggio Audace
//
//  Created by Michele on 03/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit
import FirebaseAuth
class VcrLoginViewController: UIViewController
{
    @IBOutlet weak var usermame:UITextField!
    @IBOutlet weak var password:UITextField!
    @IBOutlet weak var signinbutton:UIButton!
    
    @IBAction public func  OnSingInButtonClick(_ sender:UIButton)
    {
        Auth.auth().signIn(withEmail:usermame.text!,password:password.text!)
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
