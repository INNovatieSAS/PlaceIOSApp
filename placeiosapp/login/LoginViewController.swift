//
//  LoginViewController.swift
//  placeiosapp
//
//  Created by IngR10 on 10/21/14.
//  Copyright (c) 2014 Innovatie. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var labelUserNameError: UILabel!
    @IBOutlet var labelPasswordError: UILabel!
    @IBOutlet var labelEmailError: UILabel!
    
    let loginUtil = LoginUtil()
    
    
    @IBAction func ingresar(sender: AnyObject) {
        
        println("Button 'sign in' pressed")
        println("UserName :"+userNameField.text+"Password :"+passwordField.text+"Email :"+emailField.text)
        
        validateUserName()
        validatePassword()
        validateEmail()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func validateUserName() {
        labelEmailError.text = ""
        if(loginUtil.validateIfIsEmpty(userNameField.text)){
            labelUserNameError.text = "USERNAME NO PUEDE ESTAR VACIO"
        }
    }
    
    func validatePassword(){
        labelPasswordError.text = ""
        if(loginUtil.validateIfIsEmpty(passwordField.text)){
            labelPasswordError.text = "PASSWORD NO PUEDE ESTAR VACIO"
        } else if(!loginUtil.validatePasswordLength(passwordField.text)){
            labelPasswordError.text = "PASSWORD DEBE SER DE LONGITUD MENOR A 15 Y MAYOR A 6"
        } else {
            println("VAMOS BIEN!!")
        }
    }
    
    func validateEmail() {
        labelEmailError.text = ""
        if(loginUtil.validateIfIsEmpty(emailField.text)){
            labelEmailError.text = "EMAIL NO PUEDE ESTAR VACIO"
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        var emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluateWithObject(emailField.text)
        if(!result){
            labelEmailError.text = "EMAIL NO ES CORRECTO"
        }
    }

}
