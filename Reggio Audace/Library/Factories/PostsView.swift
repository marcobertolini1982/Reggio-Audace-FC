//
//  Postview.swift
//  Reggio Audace
//
//  Created by Michele on 28/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

public class PostsView
{

    private var ProPostsObss:[ProPostsObs] = [ProPostsObs]()
    private var ProSinglePOstObss:[ProSinglePostObs] = [ProSinglePostObs]()
    
    func SetOnPostsLoaded(proPostsObs:ProPostsObs)
    {
        self.ProPostsObss.append(proPostsObs)
        
    }
    
    func RaisePostsLoaded(posts: [Post])
    {
        for proPostsObs in self.ProPostsObss
        {
         proPostsObs.PostsLoaded(posts: posts)
        }
    }
    
    func SetSinglePOstLoaded(proSinglePostObs:ProSinglePostObs)
    {
        self.ProSinglePOstObss.append(proSinglePostObs)
    }
    
    func RaiseOnSinglePostLoaded(post:Post)
    {
        for l_ProSinglePostObs in self.ProSinglePOstObss
        {
            l_ProSinglePostObs.SinglePostLoaded(singlepost: post)
        }
    }
    func LoadPosts(cod_device:String?)
    {
        
        // Declarations
        var l_Posts:[Post] = [Post]()
        
        let l_Json : [String: Any?] = ["cod_device": cod_device]
        let l_JsonData = try? JSONSerialization.data(withJSONObject: l_Json)
        
        // Create post request
        let l_Url = URL(string: UrlUtils.URL_LOADPOSTS)!
        var l_URLRequest = URLRequest(url: l_Url)
        
        // Set properties
        l_URLRequest.httpMethod = "POST"
        l_URLRequest.httpBody = l_JsonData
        
        // Set task
        let l_Task = URLSession.shared.dataTask(with: l_URLRequest) { data, response, error in
            
            // Eval
            guard let dataResponse = data, error == nil else { return }
            
            // Decode json
             do
            {
                guard error == nil && data != nil else{return}
              guard  let l_JsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: .allowFragments) as? [[String: Any]]
              else
              {
                return
              }
                // Declarations
                var l_Post:Post
                
                for dict in l_JsonResponse {
                    
                    // Init
                    l_Post = Post()
                    
                    // Set data
                    l_Post.prg_post = dict["prg_post"] as? Int64
                    l_Post.dat_post = dict["dat_post"] as? String
                    DateUtils.FormatStringDate(&l_Post.dat_post)
                    l_Post.des_title = dict["des_title"] as? String
                    l_Post.des_post = dict["des_post"] as? String
                    l_Post.des_channel = dict["des_channel"] as? String
                    l_Post.prg_file = dict["prg_file"] as? Int64
                    l_Post.num_files = dict["num_files"] as? Int64
                    l_Post.num_poll = dict["num_postpolls"] as? Int64
                    
                    // Add
                    l_Posts.append(l_Post)
                    
                }
                
            }
            catch let e as NSError
            {
                print(e.localizedDescription)
            }
            // Raise event
            self.RaisePostsLoaded(posts: l_Posts)
            
        }
      
        // Exec task
        l_Task.resume()
        
    }
   
    func LoadPost(prg_post:Int64?)
    {
        // Declarations
        let l_Post:Post = Post()
        let l_Json:[String:Any?] = ["prg_post":prg_post]
        guard let l_Url:URL = URL(string: UrlUtils.URL_LOADPOST) else{return}
        guard let l_Data:Data = try? JSONSerialization.data(withJSONObject: l_Json, options: []) else{return}
        var l_Request:URLRequest = URLRequest(url:l_Url)
        l_Request.httpMethod = "POST"
        l_Request.httpBody = l_Data
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_Request){(data:Data?,response:URLResponse?,error:Error?)in
            guard error == nil && data != nil else{return}
            do
            {
                guard let l_JsonResponse:[String:Any] = try JSONSerialization.jsonObject(with: data!, options:[]) as? [String:Any] else{return}
               l_Post.prg_post = l_JsonResponse["prg_post"] as? Int64
                l_Post.prg_file = l_JsonResponse["prg_file"] as? Int64
                l_Post.des_title = l_JsonResponse["des_title"] as? String
                l_Post.des_post = l_JsonResponse["des_post"] as? String
                l_Post.des_channel = l_JsonResponse["des_channel"] as? String
                l_Post.num_poll = l_JsonResponse["num_postpolls"] as? Int64
                l_Post.dat_post = l_JsonResponse["dat_post"] as? String
                DateUtils.FormatStringDate(&l_Post.dat_post)
                
            }
            catch let e as NSError
            {
                print(e.localizedDescription)
            }
            self.RaiseOnSinglePostLoaded(post: l_Post)
        }
        l_DataTask.resume()
    }
    
}
