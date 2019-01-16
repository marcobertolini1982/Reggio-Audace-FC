//
//  TbrMainViewController.swift
//  Reggio Audace
//
//  Created by Michele on 03/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseInstanceID
class TabMain: UITabBarController,UITabBarControllerDelegate
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        let l_ImageView:UIImageView   = UIImageView(image: UIImage(named: "Image"))
        self.navigationItem.titleView = l_ImageView
        Auth.auth().addStateDidChangeListener({(auth,user)in
           
            self.SetTabItems(user: user)
        })
        
        self.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    open func tabBarController(_ tabBarcontroller:UITabBarController,shouldSelect viewController:UIViewController)->Bool
    {
        
        // Declarations
        
        let l_tag:Int = viewController.tabBarItem.tag
        
        // Eval User and email
        
        if AuthUtils.User == nil || !AuthUtils.User!.isEmailVerified
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

    
    private final func SetTabItems(user:FirebaseAuth.User?)
    {
        guard let l_user:FirebaseAuth.User = user
        else
        {
            self.SetLoggedOutItems()
            return
            
        }
        
        
        if l_user.isEmailVerified
        {
          self.SetLoggedInItems()
            
        }
        
        else
        {
            return
            
        }
        }
    
    private final func SetLoggedInItems()
    {
        // Declarations
        let l_AccountPage :UIViewController = MainStoryboard.instantiateViewController(withIdentifier: "PagAccount")
        l_AccountPage.tabBarItem = UITabBarItem(title: "Account", image: UIImage(named: "IconaAccountRegistrato"), selectedImage: UIImage(named: "IconaAccountRegistrato"))
        
        // Eval
        guard  var l_ViewControllers:[UIViewController] = self.viewControllers else{return}
        guard let l_LastIncdex:Int = l_ViewControllers.index(of:l_ViewControllers.last!) else {return}
        // Replace last tababar view controller
        l_ViewControllers.remove(at:l_LastIncdex)
        l_ViewControllers.append(l_AccountPage)
        self.setViewControllers(l_ViewControllers, animated: true)
    }
    private final func SetLoggedOutItems()
    {
        // Declaration
            let l_LogInPage :UIViewController = MainStoryboard.instantiateViewController(withIdentifier: "PagLogin")
            l_LogInPage.tabBarItem = UITabBarItem(title: "Account", image: UIImage(named: "IconaAccount"), selectedImage: UIImage(named: "IconaAccount"))
        
        // Eval
        guard var l_ViewControllers:[UIViewController] = self.viewControllers, let l_LastIndex:Int = l_ViewControllers.index(of:l_ViewControllers.last!)
        else
        {
        return
            
        }
        // Replace last tabbar view controller
        l_ViewControllers.remove(at:l_LastIndex)
        l_ViewControllers.append(l_LogInPage)
        self.setViewControllers(l_ViewControllers, animated: true)
    }
 
}
