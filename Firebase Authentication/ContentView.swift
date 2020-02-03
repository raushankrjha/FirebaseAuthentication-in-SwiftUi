//
//  ContentView.swift
//  Firebase Authentication
//
//  Created by Hitesh Choudhary on 23/10/19.
//  Copyright © 2019 Raushan jha. All rights reserved.
//

import SwiftUI
import Firebase
struct ContentView: View {
    
    @EnvironmentObject var session: SessionStore
    
    func getUser () {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                HomePage()
            } else {
                
                SignInView()
            }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SessionStore())
    }
}

