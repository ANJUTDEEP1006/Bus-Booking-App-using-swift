//
//  SignInViewController.swift
//  Lava Bus
//
//  Created by Vismaya on 13/09/24.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var userNameTxtFld: UITextField!
    
    @IBOutlet weak var paaswordTextFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Sign In"
    }
        
    

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        print("Submit button tapped")
        let userDefaults = UserDefaults.standard
        
        var userArray = [[String: String?]]()
        if let decoded  = userDefaults.data(forKey: "sampleArray"){
             userArray = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [[String:String?]]
        }
        
        var isValid = false
        
        for i in (0 ..< userArray.count) {
            let userDict = userArray[i]
            if (userDict["username"]==userNameTxtFld.text && userDict["password"]==paaswordTextFld.text){
                
               
                isValid = true
                break
            }
            
            
        }
        if isValid == true{
            print("correct credentials")
            navigateToHomePage()
            
        }else{
            showAlert(withTitle: "Error", message: "invalid credentials or sign up")
        }
        
        
        func navigateToHomePage() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let nextVC = storyboard.instantiateViewController(withIdentifier: "HomeViewControllerID") as? HomeViewController {
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
            }
        
        func showAlert(withTitle title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func forgetButtonTapped(_ sender: UIButton) {
        
       
        
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let nextVC = storyboard.instantiateViewController(withIdentifier: "ForgotPassViewControllerID") as? ForgotPassViewController {
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    @IBAction func SignUpButtonTapped(_ sender: UIButton) {
        print("Submit button tapped")
        
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let nextVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewControllerID") as? SignUpViewController {
            self.navigationController?.pushViewController(nextVC, animated: true)
            
        }
       

    }
    func showAlert(withTitle title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
        
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            
            
            present(alert, animated: true, completion: nil)
        }
}










