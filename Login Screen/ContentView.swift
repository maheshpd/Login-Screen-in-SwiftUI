//
//  ContentView.swift
//  Login Screen
//
//  Created by Mahesh Prasad on 17/07/20.
//  Copyright © 2020 CreatesApp. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var user = ""
    @State var pass = ""
    @State var login = false
    @State var signup = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
            
           Login(login: $login, signup: $signup, user: $user, pass: $pass)
            
        }.alert(isPresented: $login) {
            Alert(title: Text(self.user), message: Text(self.pass), dismissButton: .none)
        }
        .sheet(isPresented: $signup) {
            signUP(signup: self.$signup)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Login: View {
    
    @Binding var login : Bool
    @Binding var signup : Bool
    @Binding var user : String
    @Binding var pass : String
    
    var body: some View {
        VStack(alignment: .center, spacing: 22, content: {
        
        Image("mahesh").resizable().frame(width: 80, height: 80).padding(.bottom, 15)
        
        HStack {
            Image(systemName: "person.fill").resizable().frame(width: 20, height: 20)
            TextField("Username", text: $user).padding(.leading, 12).font(.system(size: 20))
        }.padding(12)
            .background(Color("Color"))
            .cornerRadius(20)
        
        HStack {
            Image(systemName: "lock.fill").resizable().frame(width: 15, height: 20).padding(.leading, 3)
            SecureField("Password", text: $pass).padding(.leading, 12).font(.system(size: 20))
        }.padding(12)
            .background(Color("Color"))
            .cornerRadius(20)
        
        
        Button(action: {
            self.login.toggle()
        }) {
            Text("Login").foregroundColor(.white).padding()
        }.frame(width: 150)
            .background(LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all))
            .cornerRadius(25)
            .shadow(radius: 25)
        
        Button(action: {
            
        }) {
            Text("Forget password?").foregroundColor(.white)
        }
        
        VStack(spacing: 15) {
            Text("Don't have account yet").foregroundColor(.white)
            
            Button(action: {
                self.signup.toggle()
            }) {
                Text("SignUp").foregroundColor(.white).padding()
            }.frame(width: 150)
                .background(LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all))
                .cornerRadius(25)
                .shadow(radius: 25)
        }.padding(.top, 15)
        })
        .padding(.horizontal, 18)
    }
}

struct signUP : View {
    
    @Binding var signup : Bool
    @State var user : String = ""
    @State var pass : String = ""
    @State var repass : String = ""
    
    var body : some View {
        
        ZStack {
            LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 22, content: {
            
            Image("mahesh").resizable().frame(width: 80, height: 80).padding(.bottom, 15)
            
            HStack {
                Image(systemName: "person.fill").resizable().frame(width: 20, height: 20)
                TextField("Username", text: $user).padding(.leading, 12).font(.system(size: 20))
            }.padding(12)
                .background(Color("Color"))
                .cornerRadius(20)
            
            HStack {
                Image(systemName: "lock.fill").resizable().frame(width: 15, height: 20).padding(.leading, 3)
                SecureField("Password", text: $repass).padding(.leading, 12).font(.system(size: 20))
            }.padding(12)
                .background(Color("Color"))
                .cornerRadius(20)
            
            HStack {
                Image(systemName: "lock.fill").resizable().frame(width: 15, height: 20).padding(.leading, 3)
                SecureField("Re-Password", text: $pass).padding(.leading, 12).font(.system(size: 20))
            }.padding(12)
                .background(Color("Color"))
                .cornerRadius(20)
                
            Button(action: {
                self.signup.toggle()
            }) {
                Text("SignUp").foregroundColor(.white).padding()
            }.frame(width: 150)
                .background(LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all))
                .cornerRadius(25)
                .shadow(radius: 25)
            
            
            })
            .padding(.horizontal, 18)
        }
        
        
    }
}
