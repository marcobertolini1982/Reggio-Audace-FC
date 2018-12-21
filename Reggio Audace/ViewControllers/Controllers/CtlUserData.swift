//
//  CtlUserData.swift
//  Reggio Audace
//
//  Created by Michele on 06/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class CtlUserData: CtlBase,ProUserObs, UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
   
    
    
    // Declarations
   
    @IBOutlet weak  var img_User:UIImageView!
    @IBOutlet weak var lbl_email:UILabel!
    @IBOutlet var txt_UserData:[UITextField]!
    @IBOutlet weak var btn_SetUserImage:UIButton!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        guard let l_Image:UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
        let l_Data:Data = l_Image.jpegData(compressionQuality: 1.0)
        else
        {
            self.dismiss(animated:true)
            return
            
        }
        // Declarations
        let l_Base64String:String = l_Data.base64EncodedString()
        let l_UserView:UserView = UserView()
        // Set Properties
        self.img_User.image = UIImage(data:l_Data)
        l_UserView.SetUserImage(cod_user: AuthUtils.Uid, bin_file: l_Base64String)
        self.dismiss(animated: true)
    }
    
    @IBAction func OnBtnSetUserImageClick(_ sender:UIButton)
    {
        
        let l_ImagePicker:UIImagePickerController = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum)
        {
            l_ImagePicker.delegate = self
            l_ImagePicker.allowsEditing = false
            l_ImagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
            self.present(l_ImagePicker, animated: true)
        }
    }
    
    func UserLoaded(user: User)
    {
        
        self.LoadUserData(user: user)
      
     
    }
    
    private final func LoadUserData(user:User)
    {
        DispatchQueue.main.async
            {
                self.txt_UserData[0].text = user.des_user
                self.txt_UserData[1].text = user.des_topic
                self.txt_UserData [2].text = user.des_presentation
                self.lbl_email.text = self.lbl_email.text! + user.des_email!
                
            }
    }
    
    override func viewDidLoad()
    {
        //Call base function
        super.viewDidLoad()
        self.SetUserData()
        self.LoadUserImage()
        
       
    }
    
    open override func viewWillAppear(_ animated: Bool)
    {
        // Call super method
        super.viewWillAppear(animated)
        // Disable text fields
        self.SetUserInfoEnabled(false)
        // Show edit button
        self.SetEditButton()
       
       
      
    }
    
    
    
    open override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        self.SetUserInfoEnabled(false)
    }
    
    open override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.HideEditButton()
    }
    private final func SetEditButton()
    {
        let l_EditButton:UIBarButtonItem  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.edit, target: self, action:SelectorUtils.EditSelector)
        
        self.tabBarController?.navigationItem.rightBarButtonItem = l_EditButton
    }
    
    private final func HideEditButton()
    {
        
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }
    
    private final func SetUserInfoEnabled(_ enabled:Bool)
    {
        // Set all text fields disabled
        for txt_UserInfo in txt_UserData
        {
            txt_UserInfo.isEnabled = enabled
        }
    }
    
    private final func SetDoneButton()
    {
        let l_DoneButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action:SelectorUtils.DoneSelector)
        self.tabBarController?.navigationItem.rightBarButtonItem = l_DoneButton
    }
    
    //Actions
    @objc func OnEditClick(_ sender:UIBarButtonItem)
    {
        self.SetDoneButton()
        SetUserInfoEnabled(true)
      
    }
    
    @objc func OnDoneClick(_ sender:UIBarButtonItem)
    {
        // Declarations
        let l_User:User  = User()
        l_User.cod_user = AuthUtils.Uid
        l_User.des_email = AuthUtils.UserEmail
        l_User.des_user = txt_UserData[0].text
        l_User.des_topic = txt_UserData[1].text
        l_User.des_presentation = txt_UserData[2].text
        let l_UserView:UserView = UserView()
        l_UserView.SetUser(user: l_User)
        self.SetEditButton()
        self.SetUserInfoEnabled(false)
    }
    
    private final func LoadUserImage()
    {
        
        
        let l_FileManager:FileManager = FileManager.default
        let l_Url:URL = URL(fileURLWithPath: PathUtils.UserImageFile )
        if l_FileManager.fileExists(atPath:l_Url.path)
        {
            do
            {
                 let l_Data:Data = try Data(contentsOf: l_Url)
                self.img_User.image = UIImage(data:l_Data)
            }
            catch let e as NSError
            {
                print(e.localizedDescription)
            }
        }
    }
    
    private final func SetUserData()
    {
        let l_UserView:UserView = UserView()
        l_UserView.AddUserObs(prouserobs:self)
        l_UserView.GetUser(cod_user: AuthUtils.Uid!)
    }
}
