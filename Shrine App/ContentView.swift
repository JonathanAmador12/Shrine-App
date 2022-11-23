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

    // MARK: View State
    @State var name = ""
    @State var email = ""
    @State var passwoord = ""
    @State var passowrdComfirm = ""
    @FocusState private var focusField: FormSelectedField?

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
                // Name
                Text("name")
                TextField("name", text: $name)
                    .textFieldStyle(OutLinedTextFieldStyle(focusField: focusField == .name))
                    .focused($focusField, equals: .name)
                    .submitLabel(.next)
                    .disableAutocorrection(true)
                    
                // Email
                Text("Email")
                TextField("Email", text: $email)
                    .textFieldStyle(OutLinedTextFieldStyle(focusField: focusField == .email))
                    .focused($focusField, equals: .email)
                    .submitLabel(.next)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                // password
                Text("Password")
                SecureField("password", text: $passwoord)
                    .textFieldStyle(OutLinedTextFieldStyle(focusField: focusField == .password))
                    .focused($focusField, equals: .password)
                    .submitLabel(.next)
                // Confirm Password
                Text("Confirm Password")
                SecureField("Confirm Password", text: $passowrdComfirm)
                    
                    .textFieldStyle(OutLinedTextFieldStyle(focusField: focusField == .passwordComfirm))
                    .focused($focusField, equals: .passwordComfirm)
                    .submitLabel(.done)
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
            Text("Sign up")
                .padding(EdgeInsets(top: 10, leading: 100, bottom: 10, trailing: 100))
                .background(Color("primary"))
                .font(.title2)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
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
