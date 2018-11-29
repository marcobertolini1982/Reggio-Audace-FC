//
//  VcrChat.swift
//  Reggio Audace
//
//  Created by Michele on 29/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class VcrChatPage: UIPageViewController
{
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.SetPages()
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
    func SetPages()
    {
        let l_Storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let l_ChatPage:UIViewController =  l_Storyboard.instantiateViewController(withIdentifier: "Chat")
        let l_Pages:[   UIViewController] = [l_ChatPage]
        self.setViewControllers(l_Pages, direction: NavigationDirection.forward, animated: true)
    }
}
