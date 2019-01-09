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
    //Declarations
    private var ProPostsObss:[ProPostsObs] = [ProPostsObs]()
    private var ProSinglePOstObss:[ProSinglePostObs] = [ProSinglePostObs]()
    private var ProPostFilesObss:[ProPostFilesObs] = [ProPostFilesObs]()
    private var ProPostMessageObss:[ProPostMessageObs] = [ProPostMessageObs]()
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
    func RaisePoastFilesLoaded(postfiles:[File])
    {
        for proPostFilesObs in self.ProPostFilesObss
        {
            proPostFilesObs.PostFilesLoaded(postfiles: postfiles)
        }
    }
    
    func SetOnPostFilesLoaded(proPostFilesObs:ProPostFilesObs)
    {
        self.ProPostFilesObss.append(proPostFilesObs)
    }
    
   final func SetOnProPostMessageLoadded(propostMessageobs:ProPostMessageObs)
    {
        self.ProPostMessageObss.append(propostMessageobs)
    }
    
    final func RaisePostMessagesLoaded(postmessages:[PostMessage])
    {
        for propostmessageobs in self.ProPostMessageObss
        {
            propostmessageobs.PostMessagesLoaded(postmessages: postmessages)
            
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
                    
                    // Get response data
                    l_Post.prg_post = dict["prg_post"] as? Int64
                    l_Post.dat_post = dict["dat_post"] as? String
                    DateUtils.FormatStringDate(&l_Post.dat_post)
                    l_Post.des_title = dict["des_title"] as? String
                    l_Post.des_post = dict["des_post"] as? String
                    l_Post.des_channel = dict["des_channel"] as? String
                    l_Post.prg_file = dict["prg_file"] as? Int64
                    l_Post.num_reactions = dict["num_reactions"] as? Int64
                    l_Post.num_postmessages = dict["num_postmessages"] as? Int64
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
                // Get response data
                l_Post.prg_post = l_JsonResponse["prg_post"] as? Int64
                l_Post.dat_post = l_JsonResponse["dat_post"] as? String
                DateUtils.FormatStringDate(&l_Post.dat_post)
                l_Post.des_title = l_JsonResponse["des_title"] as? String
                l_Post.des_post = l_JsonResponse["des_post"] as? String
                l_Post.des_channel = l_JsonResponse["des_channel"] as? String
                l_Post.prg_file = l_JsonResponse["prg_file"] as? Int64
                l_Post.num_reactions = l_JsonResponse["num_reactions"] as? Int64
                l_Post.num_postmessages = l_JsonResponse["num_postmessages"] as? Int64
                l_Post.num_files = l_JsonResponse["num_files"] as? Int64
                l_Post.num_poll = l_JsonResponse["num_postpolls"] as? Int64
                
            }
            catch let e as NSError
            {
                print(e.localizedDescription)
            }
            self.RaiseOnSinglePostLoaded(post: l_Post)
        }
        l_DataTask.resume()
    }
    
    
    final func GetPostsFiles(prg_post:Int64?)
    {
        var l_Files:[File] = [File]()
        // Declarations
        let l_Json:[String:Any?] = ["prg_post":prg_post]
        // Eval
        guard let l_Url:URL = URL(string:UrlUtils.URL_GETPOSTFILES) else {return}
        guard let l_Data:Data = try? JSONSerialization.data(withJSONObject:l_Json, options:[]) else{return}
        // Declarations
        var l_Request:URLRequest = URLRequest(url:l_Url)
        // Set Properties
        l_Request.httpMethod = "POST"
        l_Request.httpBody = l_Data
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with:l_Request){(data:Data?,response:URLResponse?,error:Error?)in
            guard error == nil && data != nil else{return}
            
            do
            {
                // Try to convert data to json
                guard let l_JsonResponse:[[String:Any]] = try JSONSerialization.jsonObject(with:data!, options:[]) as? [[String:Any]]
                else
                {
                    // Return
                    return
                    
                }
                // Declarations
                var  l_File:File
                for l_JsonObj in l_JsonResponse
                {
                    // Declarations
                    l_File = File()
                    // Get data
                    l_File.prg_file = l_JsonObj["prg_file"] as? Int64
                    l_File.des_file = l_JsonObj["des_file"] as? String
                    l_Files.append(l_File)
                }
            }
            catch let e as NSError
            {
                print(e.localizedDescription)
            }
            self.RaisePoastFilesLoaded(postfiles: l_Files)
        }
        l_DataTask.resume()
    }
    
    final func LoadPostMessages(prg_post:Int64?)
    {
        
        let l_Json:[String:Any?] = ["prg_post":prg_post]
        guard let l_Data:Data = try? JSONSerialization.data(withJSONObject: l_Json, options:[]) else{return}
        guard let l_Url:URL = URL(string: UrlUtils.URL_LOADPOSTMESSAGES) else{return}
        var l_Request:URLRequest = URLRequest(url:l_Url)
        l_Request.httpMethod = "POST"
        l_Request.httpBody = l_Data
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_Request){(data:Data?,repsonse:URLResponse?,error:Error?)in
            var l_PostMessages:[PostMessage] = [PostMessage]()
            var l_PostMessage:PostMessage
            
            guard error == nil && data != nil else{return}
                 l_PostMessage = PostMessage()
                do
                {
                    l_PostMessage = PostMessage()
                    guard let l_JsonArray:[[String:Any]] = try JSONSerialization.jsonObject(with: data!, options:[]) as? [[String:Any]] else{return}
                    for l_JsonResponse in l_JsonArray
                    {
                    l_PostMessage.prg_postmessage = l_JsonResponse["prg_postmessage"] as? Int64
                    l_PostMessage.prg_user = l_JsonResponse["prg_user"] as? Int64
                    l_PostMessage.prg_post = l_JsonResponse["prg_post"] as? Int64
                    l_PostMessage.cod_user = l_JsonResponse["cod_user"] as? String
                    l_PostMessage.des_user = l_JsonResponse["des_user"] as? String
                    l_PostMessage.dat_message = l_JsonResponse["dat_message"] as? String
                    DateUtils.FormatStringDateForPostMessage(&l_PostMessage.dat_message)
                    l_PostMessage.des_message = l_JsonResponse["des_message"] as?String
                    l_PostMessage.prg_file = l_JsonResponse["prg_file"] as? Int64
                    l_PostMessages.append(l_PostMessage)
                    }
                }
                catch let e as NSError
                {
                    print(e.localizedDescription)
                }
            self.RaisePostMessagesLoaded(postmessages: l_PostMessages)
            }
          l_DataTask.resume()
        }
    
    }

