//
//  PagBase.swift
//  Reggio Audace
//
//  Created by Michele on 30/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class PagBase: UIPageViewController, UIPageViewControllerDataSource,UIPageViewControllerDelegate
{
    // Declarations
    
    override var transitionStyle: TransitionStyle
    {
        return TransitionStyle.scroll
    }
    
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
   
    
    // Override viewDidLoad
    override func viewDidLoad()
    {
        // Call base class method
        super.viewDidLoad()
        let l_WIDTH:CGFloat  = self.view.bounds.width
        let l_RECT:CGRect    = CGRect(x: 0, y: 0, width: l_WIDTH, height:21)
        let l_PAGEINDICATOR:ViePageIndicator = ViePageIndicator(frame:l_RECT)
        //Add page indicator
        self.view.addSubview(l_PAGEINDICATOR)
        if self.VIEWCONTROLLERS != nil
        {
            // Set Initial controller
            self.setViewControllers([self.ViewControllers[0]], direction: NavigationDirection.forward, animated: true)
        }
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
