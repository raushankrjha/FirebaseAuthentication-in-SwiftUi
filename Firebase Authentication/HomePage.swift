//
//  HomePage.swift
//  Firebase Authentication
//
//  Created by Hitesh Choudhary on 24/10/19.
//  Copyright © 2019 Raushan jha. All rights reserved.
//

import SwiftUI
import Firebase
struct HomePage: View {
    
    @State var email: String = ""
    @EnvironmentObject var session: SessionStore
    func signIn () {
        
        
        
        session.signOut()
        
    }
    
    
    var handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        // ...
        print("Got new name: \(String(describing: user?.email?.localizedUppercase))")
        
    }
    
    
    var body: some View {
        VStack(spacing:10)
        {
            
            
            Text("You are logged in!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20
            )
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                
                .padding(.bottom, 75)
            Button(action: signIn)
            {
                //Design Button
                Text("Logout")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.blue)
                    .cornerRadius(15.0)
                
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
