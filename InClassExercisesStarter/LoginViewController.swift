//
//  LoginViewController.swift
//  InClassExercisesStarter
//
//  Created by parrot on 2018-11-22.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    //MARK:- Outlets

    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: Actions
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        print("Pressed login button")
        
        Auth.auth().signIn(withEmail: txtFieldEmail.text!, password: txtFieldPassword.text!) {
            
            (user, error) in
            
            if (user != nil) {
                // 1. Found a user!
                print("User signed in! ")
                print("User id: \(user?.user.uid)")
                print("Email: \(user?.user.email)")
//                self.USERNAME = (user?.user.email)!
                
                // 2. So send them to screen 2!
                self.performSegue(withIdentifier: "segueLoginSignup", sender: nil)
            }
            else {
                // 1. A problem occured when looking up  the user
                // - doesn't meet password requirements
                // - user already exists
                print("ERROR!")
                print(error?.localizedDescription)
                self.lblResult.text = error?.localizedDescription
                // 2. Show the error in user interface
                //                self.statusMessageLabel.text = error?.localizedDescription
            }
        }
        
        // HINT:  The name of the segue that goes to the next screen is: segueLoginSignup
        // You can check the name by going to Main.storyboard > clicking on segue > looking at Attributes Inspector
    }
    
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        print("pressed signup button")

        // HINT:  The name of the segue that goes to the next screen is: segueLoginSignup
        // You can check the name by going to Main.storyboard > clicking on segue > looking at Attributes Inspector
        
        
        Auth.auth().createUser(withEmail: txtFieldEmail.text!, password: txtFieldPassword.text!) {
            
            (user, error) in
            
            if (user != nil) {
                // 1. New user created!
                print("Created user: ")
                print("User id: \(user?.user.uid)")
                print("Email: \(user?.user.email)")
                self.lblResult.text = "User created successfully"
                
                //2. @TODO: You decide what you want to do next!
                // - do you want to send them to the next page?
                // - maybe ask them to fill in other forms?
                // - show a tutorial?
                
            }
            else {
                // 1. Error when creating a user
                print("ERROR!")
                print(error?.localizedDescription)
                self.lblResult.text = "Error while creating user"

                // 2. Show the error in the UI
                //                self.statusMessageLabel.text = error?.localizedDescription
                
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
