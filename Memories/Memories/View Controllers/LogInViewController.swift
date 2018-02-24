//
//  LogInViewController.swift
//  Memories
//
//  Created by Sarah Villegas  on 2/21/18.
//  Copyright © 2018 Sarah Villegas . All rights reserved.
//

import UIKit
import Parse

class LogInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func SignIn(_ sender: Any) {
        
        if userNameTextField.text != nil && passwordTextField.text != nil{
            
            PFUser.logInWithUsername(inBackground: userNameTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: Error?) in
                
                if user != nil{
                    
                    print("User logged in.")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
       
    }
    
    @IBAction func registerNewUser(_ sender: Any) {
        
        let newUsers = PFUser()
        
        newUsers.username = userNameTextField.text
        newUsers.password = passwordTextField.text
        
        newUsers.signUpInBackground { (success: Bool , error: Error?) in
            
            if success{
                print("Created a new user")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            if let error = error {
                
                print(error.localizedDescription)
                
//                if error?.code == 202 {
//
//                    print("User name is taken.")
//                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
