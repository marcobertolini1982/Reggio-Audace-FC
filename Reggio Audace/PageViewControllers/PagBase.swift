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
    private lazy var WILLTRANSITIONTO:UIViewController = UIViewController()
    private lazy var VIEWCONTROLLERS:[UIViewController] = [UIViewController]()
    private lazy var PAGEINDICATOR:ViePageIndicator = ViePageIndicator()
    public var ViewControllers:[UIViewController]
    {
        get
        {
            
            // Return
            return self.VIEWCONTROLLERS
        }
        set
        {
            //Set
            self.VIEWCONTROLLERS = newValue
        }
    }
    
    func Init()
    {
        let l_WIDTH:CGFloat  = self.view.bounds.width
        let l_RECT:CGRect    = CGRect(x:0, y:0, width:l_WIDTH, height:18)
        self.PAGEINDICATOR = ViePageIndicator(frame:l_RECT)
        self.SetIndicatorLabels()
        //Add page indicator
        self.view.addSubview(self.PAGEINDICATOR)
        self.view.bringSubviewToFront(self.PAGEINDICATOR)
        // Set Initial controller
        self.dataSource = self
        self.delegate = self
    }
    public final var WillTransitionTo:UIViewController
    {
        get{return self.WILLTRANSITIONTO}
        set{self.WILLTRANSITIONTO = newValue}
    }
    
    open var IndicatorsText:[String]
    {
        return [String]()
    }
    
    override var transitionStyle: TransitionStyle
    {
        return TransitionStyle.scroll
    }
    
   
   
    
    // Override viewDidLoad
    override func viewDidLoad()
    {
        // Call base class method
        super.viewDidLoad()
        self.Init()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        guard let l_Index:Int = self.ViewControllers.index(of:viewController), l_Index > 0   else{return nil}
        
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
        guard  let l_PreviousIndex:Int = self.ViewControllers.index(of:previousViewControllers[0]), let l_NextIndex = self.ViewControllers.index(of:self.WILLTRANSITIONTO)
        else
        {
            return
        }
        
        if completed
        {
           self.SetActiveIndicator(activeindex: l_NextIndex)
           self.SetPreviousIndex(previousindex: l_PreviousIndex)
        }
        
        else
        {
          self.SetActiveIndicator(activeindex:l_PreviousIndex)
          self.SetPreviousIndex(previousindex:l_NextIndex)
        }
    }
    
    
    open func SetIndicatorLabels()
    {
        var i:Int = 0
        while i < self.IndicatorsText.count
        {
           self.PAGEINDICATOR[i].text = self.IndicatorsText[i]
            i += 1
        }
    }
    
    func SetActiveIndicator(activeindex:Int)
    {
        self.PAGEINDICATOR[activeindex].textColor =  GARNETCOLOR
        
    }
    
    func SetPreviousIndex(previousindex:Int)
    {
        self.PAGEINDICATOR[previousindex].textColor = UIColor.black
    }
    
    func SetSelectedIndex(index:Int)
    {
        self.setViewControllers([self.VIEWCONTROLLERS[index]], direction: UIPageViewController.NavigationDirection.forward, animated: true)
        self.WillTransitionTo = self.VIEWCONTROLLERS[index]
    }
    
    open override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        guard let l_Index:Int = self.ViewControllers.index(of:self.WillTransitionTo) else{return}
        self.SetActiveIndicator(activeindex: l_Index)
        var i:Int = 0
        while i < self.PAGEINDICATOR.INDICATORS.count
        {
            if i != l_Index
            {
                self.SetPreviousIndex(previousindex: i)
            }
            i += 1
        }
    }

}
