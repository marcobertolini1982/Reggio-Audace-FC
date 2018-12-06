//
//  TbrMainViewController.swift
//  Reggio Audace
//
//  Created by Michele on 03/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit
import FirebaseAuth
class TabMain: UITabBarController,UITabBarControllerDelegate
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener({(auth,user)in
            self.SetTabItems()
        })
        
        self.delegate = self
      // try? Auth.auth().signOut()
        
        // Do any additional setup after loading the view.
    }
    
    open func tabBarController(_ tabBarcontroller:UITabBarController,shouldSelect viewController:UIViewController)->Bool
    {
        
        // Declarations
        
        let l_tag:Int = viewController.tabBarItem.tag
        
        // Eval User and email
        if AuthUtils.User == nil 
        {
           switch l_tag
           {
           case 0:
            return true
           case 4:
            return true
           default:
            tabBarcontroller.selectedIndex = 4
            }
            // Retrun
            return false
        }
        
        // Return
       return true
        
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
            let l_LoggedINUser:UIViewController = MainStoryboard.instantiateViewController(withIdentifier: "PagAccount")
            l_LoggedINUser.tabBarItem = UITabBarItem(title: "Account", image: UIImage(named: "IconaAccountRegistrato"),selectedImage: UIImage(named:"IconaAccountRegistrato"))
            l_viewControllers.append(l_LoggedINUser)
            self.setViewControllers(l_viewControllers, animated: true)
        }
        
        else
        {
            l_viewControllers.remove(at: l_LastIndex)
            let l_LoggedINUser:UIViewController = MainStoryboard.instantiateViewController(withIdentifier: "PagLogin")
            l_viewControllers.append(l_LoggedINUser)
            l_LoggedINUser.tabBarItem = UITabBarItem(title: "Account", image: UIImage(named: "IconaAccount"),selectedImage: UIImage(named:"IconaAccount"))
            self.setViewControllers(l_viewControllers, animated: true)
        }
    }
}
