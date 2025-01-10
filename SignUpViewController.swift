//
//  SignUpViewController.swift
//  Lava Bus
//
//  Created by Vismaya on 13/09/24.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var usernameTxtFld: UITextField!
    @IBOutlet weak var passTxtFld: UITextField!
    @IBOutlet weak var confirmpassTxtFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title="SignUp"
        
        
    }
    @IBAction func signUpBtnClicked(_ sender: Any) {
        
        if emailTxtFld.text!.count > 0 && usernameTxtFld.text!.count > 0 && passTxtFld.text!.count > 0 && confirmpassTxtFld.text!.count > 0
        {
            if isAllFieldsCorrect(){
                createDict()
            }
          
        }
        else{
            
            showAlert(withTitle: "Error", message: "Please fill in all the fields.")
        }
       
    }
    func showAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        
        present(alert, animated: true, completion: nil)
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func isValidUsername() -> Bool{
        
        if usernameTxtFld.text!.count >= 5
        {
            return true
        }else{
            return false
        }
    }
    func isPasswordMatch() -> Bool{
        if passTxtFld.text == confirmpassTxtFld.text
        {
            return true
        }
        else
        {
            return false
        }
    }
    func isAllFieldsCorrect()->Bool{
        if isValidEmail(emailTxtFld.text!)==true
        {
            print( "Valid email.")
            if isValidUsername() == true{
                print( "Valid Username.")

                if isPasswordMatch()
                {
                    print("Password Matched.")
                }
                else{
                    showAlert(withTitle: "Error", message: "Passwords do not match. Please try again.")
                    return false
                }

            }else{
                showAlert(withTitle: "Error", message: "Username must be at least 5 characters long.")
                return false

            }
        }else{
            showAlert(withTitle: "Error", message: "Invalid email format. Please try again.")
            return false
        }
        return true
    }
    
    func createDict(){
        
        
        let userDefaults = UserDefaults.standard
        
        var userArray = [[String: String?]]()
        if let decoded  = userDefaults.data(forKey: "sampleArray"){
             userArray = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [[String:String?]]
        }
        
        
        let userDict = ["username":usernameTxtFld.text,"password":passTxtFld.text,"email":emailTxtFld.text]
        userArray.append(userDict)
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: userArray)
        userDefaults.set(encodedData, forKey: "sampleArray")
        self.navigationController?.popViewController(animated: false)
        
    }
    
}
