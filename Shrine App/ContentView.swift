//
//  ContentView.swift
//  Shrine App
//
//  Created by JonathanA on 18/11/22.
//

import SwiftUI

struct ContentView: View {
    enum FormSelectedField: Hashable{
        case name
        case email
        case password
        case passwordComfirm
    }
    @FocusState private var focusField: FormSelectedField?
    @ObservedObject var signUpVM = SignUpVM()

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 10)
            Image("Logo")
                .padding(.bottom)
            Text("SHRINE")
                .font(.title)
                .fontWeight(.heavy)
            Spacer()
                .frame(height: 10)
            VStack(alignment: .leading){
                // MARK: Name section
                Group{
                    TextField("name", text: $signUpVM.name)
                        .textFieldStyle(OutLinedTextFieldStyle(focusField: focusField == .name))
                        .focused($focusField, equals: .name)
                        .submitLabel(.next)
                        .disableAutocorrection(true)
                    if let error = signUpVM.nameError{
                        Text(error)
                            .foregroundColor(.red)
                    }
                }
                // MARK: Email sectioon
                Group{
                    TextField("Email", text: $signUpVM.email)
                        .textFieldStyle(OutLinedTextFieldStyle(focusField: focusField == .email))
                        .focused($focusField, equals: .email)
                        .submitLabel(.next)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                    if let error = signUpVM.emailError{
                        Text(error)
                            .foregroundColor(.red)
                    }
                }
                // MARK: Password section
                Group{
                    SecureField("password", text: $signUpVM.password)
                        .textFieldStyle(OutLinedTextFieldStyle(focusField: focusField == .password))
                        .focused($focusField, equals: .password)
                        .submitLabel(.next)
                    if let error = signUpVM.passwordError{
                        Text(error)
                            .foregroundColor(.red)
                    }
                }
                
                // MARK: Password confirmation section
                Group{
                    SecureField("Confirm Password", text: $signUpVM.comfirmPassword)
                        .textFieldStyle(OutLinedTextFieldStyle(focusField: focusField == .passwordComfirm))
                        .focused($focusField, equals: .passwordComfirm)
                        .submitLabel(.done)
                    if let error = signUpVM.passoworComfirmationError{
                        Text(error)
                            .foregroundColor(.red)
                    }
                }
            }
            .onSubmit {
                switch focusField{
                case .name:
                    focusField = .email
                case .email:
                    focusField = .password
                case .password:
                    focusField = .passwordComfirm
                default:
                    focusField = nil
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            Spacer()
                .frame(height: 5)
            // Sign Up
            Button(action: {
                signUpVM.validateAllField()
            }) {
                Text("Sign up")
                    .padding(EdgeInsets(top: 10, leading: 100, bottom: 10, trailing: 100))
                    .foregroundColor(Color("tertiaryColor"))
                    .background(Color("primary"))
                    .font(.title2)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .foregroundColor(Color("tertiaryColor"))
                    }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
