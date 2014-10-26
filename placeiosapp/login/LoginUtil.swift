//
//  LoginUtil.swift
//  placeiosapp
//
//  Created by IngR10 on 10/23/14.
//  Copyright (c) 2014 Innovatie. All rights reserved.
//

import UIKit

class LoginUtil {
   
    
    var minPasswordLength:Int = 6
    var maxPasswordLength:Int = 15
    
    func validatePasswordLength(elPassword:String) -> Bool {
        return (countElements(elPassword)>=minPasswordLength && countElements(elPassword)<=maxPasswordLength)
    }
    
    func validateIfIsEmpty(textString:String) -> Bool {
        return textString.isEmpty
    }
    
    
}
