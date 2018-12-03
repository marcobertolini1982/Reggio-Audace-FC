//
//  PagLogin.swift
//  Reggio Audace
//
//  Created by Michele on 03/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class PagLogin: PagBase, UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        guard let l_Index:Int = self.VIEWCONTROLLERS.index(of:viewController), l_Index > 0  else{return nil}
        
        return self.VIEWCONTROLLERS[l_Index - 1]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let l_Index:Int = self.VIEWCONTROLLERS.index(of:viewController), l_Index < self.VIEWCONTROLLERS.count - 1  else{return nil}
        
        return self.VIEWCONTROLLERS[l_Index + 1]
    }
    
    let VIEWCONTROLLERS:[UIViewController] = [
                                                MainStoryboard.instantiateViewController(withIdentifier: "VcrLogin"),
                                                MainStoryboard.instantiateViewController(withIdentifier: "VcrRegister"),
                                                MainStoryboard.instantiateViewController(withIdentifier: "VcrPrivacy")
                                             ]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setViewControllers([self.VIEWCONTROLLERS[0]], direction: NavigationDirection.forward, animated: true)
        self.dataSource = self
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
