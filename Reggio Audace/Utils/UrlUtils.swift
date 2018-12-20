//
//  UrlUtils.swift
//  Reggio Audace FC App
//
//  Created by Michele on 23/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import Foundation

class UrlUtils
{
    //Gloabal
    public static var  URL_WEBAPP:String
    {
        return "http://portal.lensolution.it:8080/wRegia"
    }
    //Post
    public static var  URL_GETPOSTS:String
    {
        return URL_WEBAPP + "/GetPosts"
    }
    
    public static var URL_GETFILES:String
    {
        return URL_WEBAPP + "/GetFiles"
    }
    
    public static  var URL_GETFILE :String
{
    return URL_WEBAPP + "/GetFile"
}
//Like
    public static  var URL_SETLIKE:String
    {
        return URL_WEBAPP + "/SetLike"
    }
    
   
//Device
    public static  var URL_SETDEVICE:String
    {
        return URL_WEBAPP + "/SetDevice"
    }
    
    public static  var URL_GETUSERS:String
    {
        return URL_WEBAPP + "/GetUsers"
    }
    
    public static  var URL_SETUSER:String
    {
        return URL_WEBAPP + "/SetUser"
    }
    
    public static var URL_SETUSRLOGIN:String
    {
        return URL_WEBAPP + "/SetUserLogin"
    }
    
    public static var URL_SET_USERIMAGE:String
    {
        return URL_WEBAPP + "/SetUserImage"
    }
    public static  var URL_SETUSERCREATE:String
    {
        return URL_WEBAPP + "/SetUserCreate"
    }
    
    public static  var URL_GETUSER:String
    {
        return URL_WEBAPP + "/GetUser"
    }
    
    public static  var URL_SENDMESSAGE:String
    {
        return URL_WEBAPP + "/SendMessage"
    }
    
    public static  var URL_GETCHAT:String
     {
        return URL_WEBAPP + "/GetChat"
    }
    
    public static  var  URL_GETCHATS:String
    {
        return URL_WEBAPP + "/GetChats"
    }
    
    public static  var  URL_GETSEASON:String
    {
        return URL_WEBAPP  + "/GetSeason"
    }
    
    public static  var URL_GETSEASONACTIVEDAY:String
    {
        return URL_WEBAPP + "/GetSeasonActiveDay"
    }
    
    public static  var  URL_GETSEASONDAYS:String
    {
        return "/GetSeasonDays"
    }
    public static  var  URL_GETSEASONMATCHES:String
    {
        return URL_WEBAPP + "/GetSeasonMatches"
    }
    
    public static  var  URL_GETRANKING:String
    {
return URL_WEBAPP +  "/GetRanking"
    }
    
    public static  var  URL_GETTEAMACTORS:String
    {
        return URL_WEBAPP + "/GetTeamActors"
    }
    
    public static  var  URL_GETLIVE:String
    
        {
        return "/GetLive"
    }
    public static  var  URL_GETCHANNEL:String
    {
        return "/GetChannels"
    }
}


