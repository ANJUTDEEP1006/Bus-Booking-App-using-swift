//
//  ForgotPassViewController.swift
//  Lava Bus
//
//  Created by Vismaya on 13/09/24.
//

import UIKit

class ForgotPassViewController: UIViewController {
    @IBOutlet weak var enterEmailTxtFld: UITextField!
    @IBOutlet weak var verifyBtn: UIButton!
    @IBOutlet weak var enterPassBtn: UITextField!
    @IBOutlet weak var reenterPassBtn: UITextField!
    @IBOutlet weak var changePassBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Forgot Password"


        // Do any additional setup after loading the view.
        
        enterPassBtn.isHidden = true
        reenterPassBtn.isHidden = true
        changePassBtn.isHidden = true
        
    }
    
    @IBAction func verifyBtnClicked(_ sender: Any) {
        
        if enterEmailTxtFld.text == "anju@gmail.com"
        {
            enterPassBtn.isHidden = false
            reenterPassBtn.isHidden = false
            changePassBtn.isHidden = false
        }else{
            
            showAlert(withTitle: "Error", message: "Incorrect email. Please try again.")
            
        }
        func showAlert(withTitle title: String, message: String) {
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
            
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                
                
                present(alert, animated: true, completion: nil)
            }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
