//
//  ReactionsView.swift
//  Reggio Audace
//
//  Created by Michele on 22/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import Foundation
class ReactionsView
{
    var PROREACTIONOBSS:[ProReactionObs] = [ProReactionObs]()
    func SetReactionsLOaded(proreactionobs:ProReactionObs)
    {
        self.PROREACTIONOBSS.append(proreactionobs)
    }
    
    func RaisePostReactionsLoaded(reactions:[Reaction])
    {
        for l_proreactionobs in self.PROREACTIONOBSS
        {
            l_proreactionobs.PostReactionsLoaded?(reactions: reactions)
        }
    }
    
    func RaiseReactionsLoaded(reactions:[Reaction])
    {
        for l_proreactionobs in self.PROREACTIONOBSS
        {
            l_proreactionobs.ReactionsLoaded?(reactions: reactions)
            
            
        }
    }
    
    final func LoadPostReactions(prg_post:Int64?)
   {
    
    
    guard let l_Url:URL = URL(string: UrlUtils.URL_LOADPOSTREACTIONS)else{return}
    var l_Request:URLRequest = URLRequest(url:l_Url)
     l_Request.setValue(RequestUtils.APPLICATION_JSON, forHTTPHeaderField:RequestUtils.HTTPCONTENTTYPE)
    let  l_Json:[String:Any?] = ["prg_post":prg_post]
   
    let l_Data:Data? = try? JSONSerialization.data(withJSONObject: l_Json, options: [])
    l_Request.httpMethod = "POST"
    l_Request.httpBody = l_Data
    let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_Request){(data:Data?,response:URLResponse?,error:Error?)in
        var l_Reactions:[Reaction] = [Reaction]()
        var l_Reaction:Reaction
        guard error == nil && data != nil else{return}
        
        do
        {
            guard let l_JsonArray:[[String:Any]] = try JSONSerialization.jsonObject(with:data!, options: []) as? [[String:Any]] else{return}
           
            for l_JsonResponse in l_JsonArray
            {
            l_Reaction = Reaction()
            l_Reaction.prg_reaction = l_JsonResponse["prg_reaction"] as? Int64
            l_Reaction.des_reaction = l_JsonResponse["des_reaction"] as? String
            l_Reaction.des_emoticon = l_JsonResponse["des_emoticon"] as? String
            l_Reaction.des_user = l_JsonResponse["des_user"] as? String
            l_Reaction.prg_file = l_JsonResponse["prg_file"] as? Int64
            l_Reaction.dat_lastmodified = DateUtils.StringToDate(l_JsonResponse["dat_lastmodified"] as? String, DateUtils.STRINGDATEFORMAT.FULL_WITH_MILLISECONDS)
            l_Reactions.append(l_Reaction)
            }
        }
       catch let e as NSError
       {
        print(e.localizedDescription)
        }
        self.RaisePostReactionsLoaded(reactions: l_Reactions)
    }
   l_DataTask.resume()
 }
    
    
    func LoadReactions()
    {
        guard let l_Urll:URL = URL(string:UrlUtils.URL_LOADREACTIONS) else{return}
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with:l_Urll){(data:Data?,response:URLResponse?,error:Error?)in
            
            var l_Reactiuons:[Reaction] = [Reaction]()
            var l_Reaction:Reaction
            guard error == nil && data != nil else{return}
            do
            {
                guard  let l_JsonArray:[[String:Any]] = try  JSONSerialization.jsonObject(with: data!, options:[]) as? [[String:Any]]
                
                else
                {
                    return
                }
                
                for l_JsonObj in l_JsonArray
                {
                    l_Reaction = Reaction()
                    l_Reaction.des_emoticon = l_JsonObj["des_emoticon"] as? String
                    l_Reaction.des_reaction = l_JsonObj["des_reaction"] as? String
                    l_Reactiuons.append(l_Reaction)
                }
                
            }
            catch let e as NSError
            {
                print(e.localizedDescription)
            }
            self.RaiseReactionsLoaded(reactions: l_Reactiuons)
        }
        l_DataTask.resume()
    }
    
    
    final func SaveReaction(prg_post:Int64?,des_emoticon:String?)
    {
        guard let l_Url:URL = URL(string:UrlUtils.URL_SAVEPOSTREACTION) else {return}
        var l_Request:URLRequest = URLRequest(url:l_Url)
        let l_JsonInput:[String:Any?] = ["prg_post":prg_post,"cod_user":AuthUtils.Uid,"des_emoticon":des_emoticon]
        l_Request.httpMethod = "POST"
        l_Request.setValue(RequestUtils.APPLICATION_JSON, forHTTPHeaderField:RequestUtils.HTTPCONTENTTYPE)
        l_Request.httpBody = try? JSONSerialization.data(withJSONObject: l_JsonInput, options: [])
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with:l_Request)
        {(data:Data?,repsonse:URLResponse?,error:Error?)in
          guard data != nil && error == nil
          else
            {
                return
            }
            print(String(data: data!, encoding: String.Encoding.utf8))
        }
        
        l_DataTask.resume()
    }
}
