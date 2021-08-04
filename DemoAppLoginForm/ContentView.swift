//
//  ContentView.swift
//  DemoAppLoginForm
//
//  Created by IOSDEV1 on 03/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var txtEmail: String = ""
    @State var txtPassword: String = ""
    @State var selection: Int? = nil
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 5, content: {
                
                Form{
                    TextField("Enter email", text: $txtEmail)
                    SecureField("Enter password", text: $txtPassword)
                }
                .padding()
                
                NavigationLink(destination: SecondView(), tag: 1, selection: $selection) {
                    Button(action: {
                        print("login tapped")
                        showingAlert = true
                        self.selection = 1
                    }) {
                        HStack {
                            Spacer()
                            Text("Login")
                                .font(.title2).fontWeight(.medium).bold()
                            Spacer()
                        }
                    }
                    .frame(width: 200, height: 50, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
                    
                    
                }
                
                Spacer(minLength: 350)
            })
            .navigationBarTitle(Text("Login Form"), displayMode: .inline)
        }
         
        
    }
    func getNext() -> some View{
        return SecondView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
