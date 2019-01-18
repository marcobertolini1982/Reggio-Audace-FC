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
    private  var PAGEINDICATOR:ViePageIndicator!
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
        self.PAGEINDICATOR = ViePageIndicator(frame:l_RECT,headertitles:self.IndicatorsText)
        //Add page indicator
        self.view.addSubview(self.PAGEINDICATOR)
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
        guard let l_NextIndex = self.ViewControllers.index(of:self.WILLTRANSITIONTO), let l_PreviouIndex:Int = self.VIEWCONTROLLERS.index(of:previousViewControllers[0])
        else
        {
         return
            
        }
           if completed
           {
            self.SetActiveIndicator(activeindex: l_NextIndex)
            self.SetPreviousIndicators(previousindex: l_PreviouIndex)
          }
       
    }
    
    
   
    
    func SetActiveIndicator(activeindex:Int)
    {
       
        let l_IndexPath:IndexPath = IndexPath(item: activeindex, section: 0)
        self.PAGEINDICATOR.Cvi_Headcers.selectItem(at: l_IndexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition.right)
       
        
    }
    
    func SetPreviousIndicators(previousindex:Int)
    {
        let l_IndexPath:IndexPath = IndexPath(item: previousindex, section: 0)
        self.PAGEINDICATOR.Cvi_Headcers.deselectItem(at: l_IndexPath, animated: true)
    }
    
    func SetSelectedIndex(index:Int)
    {
        self.setViewControllers([self.VIEWCONTROLLERS[index]], direction: UIPageViewController.NavigationDirection.forward, animated: true)
        self.WillTransitionTo = self.VIEWCONTROLLERS[index]
    }
    
    open override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        guard let l_Index:Int = self.ViewControllers.index(of:self.WillTransitionTo) else{return}
        self.SetActiveIndicator(activeindex: l_Index)
       
    }
    
    func OnItemSelected(_ indexPath:IndexPath)
    {
        let l_Cell:CvcHeader? = self.PAGEINDICATOR.Cvi_Headcers.cellForItem(at: indexPath) as? CvcHeader
        l_Cell?.lbl_title.textColor = GARNETCOLOR
    }

}
