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
    private var proChatObss:[ProChatObs] = [ProChatObs]()
    

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
    func LoadChat()
    {
        var l_Chats:[Chat] = [Chat]()
        
        let l_Json : [String: String] = ["cod_device": "1"]
        let l_JsonData = try? JSONSerialization.data(withJSONObject: l_Json)
        
        // Create Chat request
        let l_Url = URL(string: "http://192.168.1.60:8080/wRegia/GetChat")!
        var l_URLRequest = URLRequest(url: l_Url)
        
        // Set properties
        l_URLRequest.httpMethod = "Chat"
        l_URLRequest.httpBody = l_JsonData
        
        // Set task
        let l_Task = URLSession.shared.dataTask(with: l_URLRequest) { data, response, error in
            
            // Eval
            guard let dataResponse = data, error == nil else { return }
            
            // Decode json
            if let l_JsonResponse = try! JSONSerialization.jsonObject(with: dataResponse, options: .allowFragments) as? [[String: Any]]
            {
                
                // Declarations
                var l_Chat:Chat
                
                for dict in l_JsonResponse {
                    
                    // Init
                    l_Chat = Chat()
                    l_Chat.prg_chat = dict["prg_Chat"] as? Int64
                    l_Chat.dat_chat = dict["dat_Chat"] as? String
                    l_Chat.des_title = dict["des_title"] as? String
                    l_Chat.des_chat = dict["des_Chat"] as? String
                    l_Chat.des_channel = dict["des_channel"] as? String
                    l_Chat.prg_file = dict["prg_file"] as? Int64
                    l_Chat.des_file = dict["des_file"] as? String
                    l_Chat.num_files = dict["num_files"] as? Int64
                    l_Chat.num_poll = dict["num_poll"] as? Int64
                    // Set data
                   
                    
                    // Add
                    l_Chats.append(l_Chat)
                    
                }
                
            }
            
            // Raise event
            self.RaiseChatLoaded(chats:l_Chats)
            
        }
        
        // Exec task
        l_Task.resume()
        
    }
}
