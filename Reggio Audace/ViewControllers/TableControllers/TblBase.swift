//
//  TblBaseTableViewController.swift
//  Reggio Audace
//
//  Created by Michele on 14/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class TblBase: UITableViewController,UITextFieldDelegate
{
    
    open var reuseIdentifier:String
    {
        return String()
    }
    
    open var NibNabe:String
    {
        return String()
    }
    
    open var EdgeInset:UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Init()
        self.SetKeyBoardDismissable()
        self.SetTextFieldsDelegate()
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    open func Init()
    {
        // Register control
       self.tableView.register(UINib(nibName: self.NibNabe, bundle: nil), forCellReuseIdentifier: self.reuseIdentifier)
       self.tableView.contentInset = self.EdgeInset
    
    }
    
    func BindData()
    {
        
        DispatchQueue.main.async
        {
            
            // Bind data
            self.tableView.reloadData()
            
        }
        
    }
    
  
    
   
    
    open func SetTextFieldsDelegate()
    {
        // Eec loop through views
        for l_TextField in self.view.subviews
        {
            // Eval
            if l_TextField is UITextField
            {
                // Add delegate to subview of main view
                (l_TextField as? UITextField)?.delegate = self
                
            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Dismiss KeyBoard
        textField.endEditing(true)
        return true
    }
    
    open func SetKeyBoardDismissable()
    {
        let l_GestureRecognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(self.DismissKeyBoard))
        l_GestureRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(l_GestureRecognizer)
    }
    
    @objc
    func DismissKeyBoard()
    {
        // Dismiss KeyBoard
        self.view.endEditing(true)
        
    }
}
