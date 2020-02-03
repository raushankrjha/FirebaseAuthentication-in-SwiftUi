//
//  SessionStore.swift
//  Firebase Authentication
//
//  Created by Hitesh Choudhary on 24/10/19.
//  Copyright © 2019 Raushan jha. All rights reserved.
//
import SwiftUI
import Firebase
import Combine

class SessionStore : ObservableObject {
    var objectWillChange = PassthroughSubject<SessionStore, Never>()
    var isLoggedIn = false { didSet { self.objectWillChange.send(self) }}
    @Published var session: User? { didSet { self.objectWillChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?
    init(session: User? = nil) {
        self.session = session
    }
    func listen () {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                
                self.isLoggedIn = true
                self.session = User(
                    uid: user.uid,
                    displayName: user.displayName,
                    email: user.email
                    
                )
                
            } else {
                self.isLoggedIn = false
                // if we don't have a user, set our session to nil
                self.session = nil
            }
        }
    }
    
    
    func signUp(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            self.session = nil
            return true
        } catch {
            return false
        }
    }
    
    func unbind () {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    // additional methods (sign up, sign in) will go here
}
