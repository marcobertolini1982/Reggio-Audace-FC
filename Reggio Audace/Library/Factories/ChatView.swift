//
//  chatView.swift
//  Reggio Audace
//
//  Created by Michele on 29/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import Foundation

class ChatView
{
    //Declarations
    private lazy var proChatObss:[ProChatObs] = [ProChatObs]()
    

    func SetOnChatsLoaded(proChatObss:ProChatObs)
    {
        //Add observer
        self.proChatObss.append(proChatObss)
    }
    func RaiseChatLoaded(chats:[Chat])
    {
        for l_proChatObs in self.proChatObss
        {
            //Raise events
            l_proChatObs.ChatLoaded(chats: chats)
        }
    }
    func LoadChat(cod_user:String?)
    {
        var l_Chats:[Chat] = [Chat]()
        let l_Json : [String: Any?] = ["cod_user":cod_user]
        let l_JsonData = try? JSONSerialization.data(withJSONObject: l_Json)
        
        // Create Chat request
        let l_Url = URL(string: "http://portal.lensolution.it:8080/wRegia/GetChats")!
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
                guard let l_JsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: .allowFragments) as? [[String: Any]]
                else
                {
                    return
                }
                // Declarations
                var l_Chat:Chat
                
                for dict in l_JsonResponse
                {
                    
                    // Init
                    l_Chat = Chat()
                    l_Chat.prg_chat = dict["prg_chat"] as? Int64
                    l_Chat.prg_user  = dict["prg_user"] as? Int64
                    l_Chat.des_user = dict["des_user"] as? String
                    l_Chat.cod_user  = dict["cod_user"] as? String
                    l_Chat.des_lastmessage = dict["des_lastmessage"] as? String
                  // l_Chat.dat_last_modified = dict["dat_lastmodified"] as? String
                   
                    
                    // Add
                  l_Chats.append(l_Chat)
                    
                }
                
            }
            catch let e as NSError
            {
                print(e.localizedDescription)
            }
            // Raise event
            self.RaiseChatLoaded(chats:l_Chats)
            
        }
        
        // Exec task
        l_Task.resume()
        
    }
}
