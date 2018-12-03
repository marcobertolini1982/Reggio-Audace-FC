//
//  TbrMainViewController.swift
//  Reggio Audace
//
//  Created by Michele on 03/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit
import FirebaseAuth
class TbrMainViewController: UITabBarController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener({(auth,user)in
            self.SetTabItems()
        })
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

    
    private final func SetTabItems()
    {
        guard var l_viewControllers:[UIViewController] = self.viewControllers, let l_LastItem:UIViewController = l_viewControllers.last,
          let  l_LastIndex:Int = l_viewControllers.index(of:l_LastItem)
        else
        {
            return
            
        }
        if AuthUtils.User != nil
        {
         
          
            l_viewControllers.remove(at: l_LastIndex)
            let l_LoggedINUser:UIViewController = MainStoryboard.instantiateViewController(withIdentifier: "LoggedIn")
            l_viewControllers.append(l_LoggedINUser)
            self.setViewControllers(l_viewControllers, animated: true)
        }
        
        else
        {
            l_viewControllers.remove(at: l_LastIndex)
            let l_LoggedINUser:UIViewController = MainStoryboard.instantiateViewController(withIdentifier: "LogIn")
            l_viewControllers.append(l_LoggedINUser)
            self.setViewControllers(l_viewControllers, animated: true)
        }
    }
}
