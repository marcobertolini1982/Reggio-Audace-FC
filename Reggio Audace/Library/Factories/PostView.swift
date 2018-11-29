//
//  Postview.swift
//  Reggio Audace
//
//  Created by Michele on 28/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

public class PostView
{
    
    private var ProPostsObss = [ProPostObs]()

    func SetOnPostsLoaded(proPostObs:ProPostObs)
    {
        ProPostsObss.append(proPostObs)
    }
    
    func RaisePostsLoaded(posts: [Post])
    {
        for proPostsObs in ProPostsObss
        {
            proPostsObs.PostsLoaded(posts:posts)
        }
    }
    
    func LoadPosts()
    {
        
        // Declarations
        var l_Posts:[Post] = [Post]()
        
        let l_Json : [String: String] = ["cod_device": "1"]
        let l_JsonData = try? JSONSerialization.data(withJSONObject: l_Json)
        
        // Create post request
        let l_Url = URL(string: "http://192.168.1.60:8080/wRegia/GetPosts")!
        var l_URLRequest = URLRequest(url: l_Url)
        
        // Set properties
        l_URLRequest.httpMethod = "POST"
        l_URLRequest.httpBody = l_JsonData
        
        // Set task
        let l_Task = URLSession.shared.dataTask(with: l_URLRequest) { data, response, error in
            
            // Eval
            guard let dataResponse = data, error == nil else { return }
            
            // Decode json
            if let l_JsonResponse = try! JSONSerialization.jsonObject(with: dataResponse, options: .allowFragments) as? [[String: Any]]
            {
                
                // Declarations
                var l_Post:Post
                
                for dict in l_JsonResponse {
                    
                    // Init
                    l_Post = Post()
                    
                    // Set data
                    l_Post.prg_post = dict["prg_post"] as? Int64
                    l_Post.dat_post = dict["dat_post"] as? String
                    l_Post.des_title = dict["des_title"] as? String
                    l_Post.des_post = dict["des_post"] as? String
                    l_Post.des_channel = dict["des_channel"] as? String
                    l_Post.prg_file = dict["prg_file"] as? Int64
                    l_Post.des_file = dict["des_file"] as? String
                    l_Post.num_files = dict["num_files"] as? Int64
                    l_Post.num_poll = dict["num_poll"] as? Int64
                    
                    // Add
                    l_Posts.append(l_Post)
                    
                }
                
            }
            
            // Raise event
            self.RaisePostsLoaded(posts: l_Posts)
            
        }
      
        // Exec task
        l_Task.resume()
        
    }
    
    
}
