//
//  ViewController.swift
//  playpart_task
//
//  Created by Vlad Koval on 23.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
   let colorPPgreen = UIColor(#colorLiteral(red: 0.7620484233, green: 0.8155090213, blue: 0.2797752321, alpha: 1))
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPassButton: UIButton!
    @IBOutlet weak var logInOutlet: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func logInButton(_ sender: Any) {
        if(logInCheck()){
            if let navController = self.navigationController, let viewController = self.storyboard?.instantiateViewController(withIdentifier: "HelloViewController") as? HelloViewController{
                navController.pushViewController(viewController, animated: true)
            }
        }
        else{
            print("errror")
        }
    }
    @IBAction func forgotPassButton(_ sender: Any) {
    }
    @IBAction func googleLinkButton(_ sender: Any) {
    }
    @IBAction func signUpButton(_ sender: Any) {
    }
    @IBAction func facebookLinkButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewsParts()
    }
    
    func logInCheck()->Bool{
        let emailAdmin = "kvladkoval@gmail.com"
        let passwordAdmin = "qWeasdf3"
        print(isValidEmail(email: emailTextField.text), isValidPassword(password: passwordTextField.text))
        print(emailAdmin, passwordAdmin)
        if(isValidEmail(email: emailTextField.text) && emailTextField.text! == emailAdmin && isValidPassword(password: passwordTextField.text) && passwordTextField.text! == passwordAdmin){
            errorLabel.textColor = .clear
            return true
        }
            errorLabel.textColor = .systemRed
            return false
    }
    
    
    func isValidPassword(password:String?) -> Bool {
        guard password != nil else {
            return false }

        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    func initViewsParts(){
        self.view.backgroundColor = UIColor.black
        errorLabel.textColor = .clear
        emailTextField.attributedPlaceholder =  NSAttributedString(string: "insert your email", attributes: [NSAttributedString.Key.foregroundColor: colorPPgreen])
        emailTextField.setLeftPaddingPoints(10)
        emailTextField.textColor = colorPPgreen
        
        passwordTextField.attributedPlaceholder =  NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: colorPPgreen])
        passwordTextField.textColor = colorPPgreen
        passwordTextField.setLeftPaddingPoints(10)
        
        forgotPassButton.titleLabel?.font = .systemFont(ofSize: 10)
        forgotPassButton.setTitleColor(colorPPgreen, for: .normal)
        forgotPassButton.backgroundColor = UIColor.clear
    }
}


func isValidEmail(email:String?) -> Bool {
    
    guard email != nil else { return false }
    
    let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
    return pred.evaluate(with: email)
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
