//
//  User.swift
//  lab10
//
//  Created by jerry on 2022/6/1.
//

import Foundation
import FirebaseAuth
class User: ObservableObject{
    var email = ""
    var password = ""
    var name = ""
    var isLogin = false
    init(email: String, password: String,name: String) {
        self.email = email
        self.password = password
        self.name = name
    }
    init(){
        email = ""
        password = ""
        name = ""
    }
    func createUser(){
        Auth.auth().createUser(withEmail: self.email, password: self.password) { result, error in
             guard let user = result?.user,
                   error == nil else {
                 print(error?.localizedDescription)
                 return
             }
            print("registered")
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = self.name
            changeRequest.commitChanges(completion: { error in
               guard error == nil else {
                   print(error?.localizedDescription)
                   return
               }
                print("已新增名字")
            })
        }
    }
    func signIn(){
        Auth.auth().signIn(withEmail: self.email, password: self.password) { result, error in
             guard error == nil else {
                print(error?.localizedDescription)
                return
             }
            self.isLogin = true
            print("已登入")
        }
    }
    func setName(){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = self.name
        changeRequest?.commitChanges(completion: { error in
           guard error == nil else {
               print(error?.localizedDescription)
               return
           }
            print("已新增名字")
        })
    }
    func singOut(){
        do {
           try Auth.auth().signOut()
            self.isLogin = false
            print("已登出")
        } catch {
           print(error)
        }
    }

}
