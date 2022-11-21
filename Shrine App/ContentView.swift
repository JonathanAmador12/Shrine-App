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
        case confirmPassword
    }

    // MARK: View State
    @State var name = ""
    @State var email = ""
    @State var passwoord = ""
    @State var confirmPassowrd = ""
    @FocusState private var focusField: FormSelectedField?

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 40)
            Image("Logo")
                .padding(.bottom)
            Text("SHRINE")
                .font(.title)
                .fontWeight(.heavy)
            Spacer()
                .frame(height: 50)
            VStack(alignment: .leading){
                // Name
                Text("name")
                TextField("name", text: $name)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 20))
                    .overlay{
                        if focusField == .name{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("primary"))
                        }else{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                        }
                    }
                    .focused($focusField, equals: .name)
                    .submitLabel(.next)
                    .disableAutocorrection(true)
                    
                // Email
                Text("Email")
                TextField("Email", text: $email)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 20))
                    .overlay{
                        if focusField == .email{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("primary"))
                        }else{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                        }
                    }
                    .focused($focusField, equals: .email)
                    .submitLabel(.next)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                // password
                Text("Password")
                SecureField("password", text: $passwoord)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 20))
                    .overlay{
                        if focusField == .password{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("primary"))
                        }else{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                        }
                    }
                    .focused($focusField, equals: .password)
                    .submitLabel(.next)
                // Confirm Password
                Text("Confirm Password")
                SecureField("Confirm Password", text: $confirmPassowrd)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 20))
                    .overlay{
                        if focusField == .confirmPassword{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("primary"))
                        }else{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                        }
                    }
                    .focused($focusField, equals: .confirmPassword)
                    .submitLabel(.done)
            }
            .onSubmit {
                switch focusField{
                case .name:
                    focusField = .email
                case .email:
                    focusField = .password
                case .password:
                    focusField = .confirmPassword
                default:
                    focusField = nil
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            Spacer()
                .frame(height: 50)
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
