//
//  SignInView.swift
//  Firebase Authentication
//
//  Created by Hitesh Choudhary on 24/10/19.
//  Copyright © 2019 Raushan jha. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    @EnvironmentObject var session: SessionStore
    
    @State var editusername: String = ""
    @State var editpassword: String = ""
    @State var message: String = ""
    @State var authenticationDidSucceed: Bool = false
    @State var selection: Int? = nil
    
    //signin function
    func signIn () {
        session.signIn(email: editusername, password: editpassword) { (result, error) in
            
            if error != nil {
                self.authenticationDidSucceed=false
                self.message="Information not correct. Try again."
            } else {
                
                self.authenticationDidSucceed=true
                self.editusername = ""
                self.editpassword = ""
                
            }
        }
    }
    
   
    
    var body: some View {
        ZStack {
            NavigationView {
            VStack(spacing:10)
            {
                
                
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20
                )
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                    .cornerRadius(150)
                    .padding(.bottom, 75)
                TextField("Username", text: $editusername)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                SecureField("Password", text: $editpassword)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                if !authenticationDidSucceed {
                    Text(self.message)
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                Button(action: signIn)
                {
                    //Design Button
                    Text("LOGIN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                    
                }
                //navigate to signup view
                NavigationLink(destination: SignUpView(), tag: 1, selection: $selection) {
                                   Button("SignUp Now ") {
                                       self.selection = 1
                                   }
            } .padding()
            if authenticationDidSucceed {
                Text("Login succeeded!")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                    .animation(Animation.default)
            }
            
        }
            }
        
        
    }
}

}
    
    //signupview

    struct SignUpView: View {
        
        let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
        @EnvironmentObject var session: SessionStore
        
        @State var editusername: String = ""
        @State var editpassword: String = ""
        @State var message: String = ""
        @State var authenticationDidSucceed: Bool = false
        func signUp () {
              session.signUp(email: editusername, password: editpassword) { (result, error) in
                  
                  if error != nil {
                      self.authenticationDidSucceed=false
                      self.message="Information not correct. Try again."
                  } else {
                      
                      self.authenticationDidSucceed=true
                      self.editusername = ""
                      self.editpassword = ""
                      
                  }
              }
          }
        
        var body: some View {
            ZStack {
               
                VStack(spacing:10)
                {
                    
                    
                    Text("SignUp!")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.bottom, 20
                    )
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(150)
                        .padding(.bottom, 75)
                    TextField("Username", text: $editusername)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    SecureField("Password", text: $editpassword)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    if !authenticationDidSucceed {
                        Text(self.message)
                            .offset(y: -10)
                            .foregroundColor(.red)
                    }
                    Button(action: signUp)
                    {
                        //Design Button
                        Text("Register")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.blue)
                            .cornerRadius(15.0)
                        
                    }
                   
                if authenticationDidSucceed {
                    Text("Register succeeded!")
                        .font(.headline)
                        .frame(width: 250, height: 80)
                        .background(Color.green)
                        .cornerRadius(20.0)
                        .foregroundColor(.white)
                        .animation(Animation.default)
                }
                
            }
                }
            
            
        
    }
    }
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        SignInView()
    }

}

