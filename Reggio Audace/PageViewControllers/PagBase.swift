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
    private var WILLTRANSITIONTO:UIViewController?
    // Declarations
    
    open var IndicatorsText:[String]
    {
        return [String]()
    }
    
    override var transitionStyle: TransitionStyle
    {
        return TransitionStyle.scroll
    }
    
    private var VIEWCONTROLLERS:[UIViewController]?
    private var PAGEINDICATOR:ViePageIndicator?
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
        self.PAGEINDICATOR = ViePageIndicator(frame:l_RECT)
        self.SetIndicatorLabels()
        //Add page indicator
        self.view.addSubview(self.PAGEINDICATOR!)
        if self.VIEWCONTROLLERS != nil
        {
            // Set Initial controller
            self.setViewControllers([self.ViewControllers[0]], direction: NavigationDirection.forward, animated: true)
        }
        self.dataSource = self
        self.delegate = self
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
    
    open func pageViewController(_ pageViewController:UIPageViewController,willTransitionTo willTrasitionTo:[UIViewController])
    {
        self.WILLTRANSITIONTO = willTrasitionTo[0]
    }
    
    
    open func pageViewController(_ pageViewController:UIPageViewController,didFinishAnimating finished:Bool,previousViewControllers:[UIViewController],transitionCompleted completed:Bool)
    {
        guard  let l_PreviousIndex:Int = self.ViewControllers.index(of:previousViewControllers[0]), let l_NextIndex = self.ViewControllers.index(of:self.WILLTRANSITIONTO!)
        else
        {
            return
        }
        
        if completed
        {
            self.PAGEINDICATOR![l_PreviousIndex].textColor = UIColor.black
            self.PAGEINDICATOR![l_NextIndex].textColor = GARNETCOLOR
        }
        
        else
        {
             self.PAGEINDICATOR![l_PreviousIndex].textColor = GARNETCOLOR
             self.PAGEINDICATOR![l_NextIndex].textColor     = UIColor.black
        }
    }
    
    
    open func SetIndicatorLabels()
    {
        var i:Int = 0
        while i < self.IndicatorsText.count
        {
           self.PAGEINDICATOR![i].text = self.IndicatorsText[i]
            i += 1
        }
    }
}
