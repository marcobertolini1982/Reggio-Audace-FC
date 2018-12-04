//
//  PagBase.swift
//  Reggio Audace
//
//  Created by Michele on 30/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class PagBase: UIPageViewController, UIPageViewControllerDataSource
{
    // Declarations
    private var VIEWCONTROLLERS:[UIViewController]?
    public var ViewControllers:[UIViewController]
    {
        get
        {
            // Declarations
            guard let l_ViewControllers:[UIViewController] = self.VIEWCONTROLLERS else{return [UIViewController]()}
            // Return
            return l_ViewControllers
        }
        set
        {
            //Set
            self.VIEWCONTROLLERS = newValue
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.dataSource = self
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        guard let l_Index:Int = self.ViewControllers.index(of:viewController), l_Index > 0  else{return nil}
        
        return self.ViewControllers[l_Index - 1]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let l_Index:Int = self.ViewControllers.index(of:viewController), l_Index < self.ViewControllers.count - 1  else{return nil}
        
        return self.ViewControllers[l_Index + 1]
    }
}
