//
//  SignUpVM.swift
//  Shrine App
//
//  Created by JonathanA on 23/11/22.
//

import Foundation

class SignUpVM: ObservableObject {
    // MARK: View State
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var comfirmPassword = ""

    // MARK: Error variables
    @Published var passoworComfirmationError: String?
    @Published var nameError: String?
    @Published var emailError: String?
    @Published var passwordError: String?
    
    func validateAllField() -> Void {
        validateName(name: name)
        validateEmail(email: email)
        validatePassword(password: password)
        validatePasswordConfirmation(password: password, passwordConfirmation: comfirmPassword)
        
    }
    
    func validateName(name: String) -> Void {
        nameError = nil
        if name.isEmpty{
            nameError = "Name is empy"
        }else if name.count <= 1 {
            nameError = "Name just contains a character"
        }
    }
    
    func validateEmail(email: String) -> Void {
        emailError = nil
        if email.isEmpty{
            emailError = "Email is empty"
        }else if !email.contains("@gmail.com") && !email.contains("@hotmail.com") && !email.contains("@yahoo.com") {
            emailError = "Email is invalid"
        }
    }
    
    func validatePassword(password: String) -> Void {
        let lowercasePassword = password.lowercased()
        passwordError = nil
        
        if password.isEmpty {
            passwordError = "Password is empty"
        }else if password.count < 8{
            passwordError = "At leat you need to enter eight characteres"
        }else if password == lowercasePassword{
            passwordError = "At leat you need to put a uppercase"
        }
    }
    
    func validatePasswordConfirmation(password: String, passwordConfirmation: String) -> Void {
        if passwordConfirmation.isEmpty{
            passoworComfirmationError = "Password confirmation is empty"
        }else if password != passwordConfirmation{
            passoworComfirmationError = "Passwords aren't the same"
        }else{
            passoworComfirmationError = nil
        }
    }
}
