//
//  LoginView.swift
//  DemoAppLoginForm
//
//  Created by IOSDEV1 on 05/08/21.
//

import SwiftUI

struct LoginView: View {
    
    let emailPredicated =  NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
    let passwordPredicated = NSPredicate(format: "SELF MATCHES %@", "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$")
    
    @State var txtEmail: String = ""
    @State var txtPassword: String = ""
    @State var passwordIconChanging:Bool = false
    @State var selection: Int? = nil
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                
                Text("Login")
                    .font(.largeTitle).bold()
                    .padding(.top)
                
                VStack(alignment: .leading) {
                    
                    // MARK: - Email Textfield
                    
                    if !txtEmail.isEmpty {
                        Text("Email")
                            .foregroundColor(.blue)
                            .padding(.bottom,-10)
                            .transition(AnyTransition.opacity.animation(.easeIn))
                    }
                    
                    TextField("Enter email", text: $txtEmail)
                        .frame(height: 40)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    
                    if !emailPredicated.evaluate(with: txtEmail) && !txtEmail.isEmpty {
                        Text("Invalid email address")
                            .font(.footnote)
                            .foregroundColor(Color.red)
                            .transition(AnyTransition.opacity.animation(.easeIn))
                    }
                    
                    // MARK: - Password Textfield
                    
                    if !txtPassword.isEmpty {
                        Text("Password")
                            .foregroundColor(.blue)
                            .padding(.bottom,-10)
                            .transition(AnyTransition.opacity.animation(.easeIn))
                    }
                    
                    if self.passwordIconChanging {
                        TextField("Enter password", text: $txtPassword)
                            .frame(height: 40)
                            .overlay(
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        self.passwordIconChanging.toggle()
                                    }, label: {
                                        Image(systemName: self.passwordIconChanging ? "eye.fill" : "eye.slash.fill")
                                            .foregroundColor(.gray)
                                            .transition(AnyTransition.opacity.animation(.easeIn))
                                    })
                                }
                            )
                    } else {
                        SecureField("Enter password", text: $txtPassword)
                            .frame(height: 40)
                            .overlay(
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        self.passwordIconChanging.toggle()
                                    }, label: {
                                        Image(systemName: self.passwordIconChanging ? "eye.fill" : "eye.slash.fill")
                                            .foregroundColor(.gray)
                                            .transition(AnyTransition.opacity.animation(.easeIn))
                                    })
                                }
                            )
                    }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    
                    if !passwordPredicated.evaluate(with: txtPassword) && !txtPassword.isEmpty {
                        Text("Invalid password")
                            .font(.footnote)
                            .foregroundColor(Color.red)
                            .transition(AnyTransition.opacity.animation(.easeIn))
                    }
                    
                } .padding(.horizontal)
                .padding(.bottom, 40)
                
                if self.emailPredicated.evaluate(with: txtEmail) && self.passwordPredicated.evaluate(with: txtPassword){
                    
                    Button(action: {
                        print("login tapped")
                    }, label: {
                        
                        Text("Login")
                            
                            .font(.title2).fontWeight(.medium).bold()
                    }).frame(width: 200, height: 50, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .padding(.bottom,20)
                    .transition(AnyTransition.opacity.animation(.easeIn))
                }
                
            }.padding(.horizontal)
            .padding(.bottom, 540)
            
        }.navigationBarTitle(Text("Login Form"), displayMode: .inline)
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
