//
//  Regitration Sqlite File.swift
//  Local DataBase Login Page
//
//  Created by R95 on 13/02/24.
//

import Foundation
import UIKit
import SQLite3


struct user {
    var email  : String
    var password  : String
}

class RegitrationSqliteFile {
    
    static var file : OpaquePointer?
    
    static func createFile() {
        var a = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        a.appendPathExtension("My User Data.db")
        sqlite3_open(a.path, &file)
        print(a.path)
        print("Create a File")
        createTable()
    }
    
    static func createTable() {
        let q = "Create Table if not exists User (email text,password text)"
        var table : OpaquePointer?
        sqlite3_prepare(file, q, -1, &table, nil)
        sqlite3_step(table)
        print("Create A Table")
    }
    
    static func addData(email: String,password: String) {
        let q = "insert into user values ('\(email)','\(password)')"
        var addData : OpaquePointer?
        sqlite3_prepare(file, q, -1, &addData, nil)
        sqlite3_step(addData)
        print("Add Data")
    }
    
    
    static func getData(){
        let q = "SELECT * FROM user"
        var read: OpaquePointer?
        sqlite3_prepare(file, q, -1, &read, nil)
        
        while sqlite3_step(read) == SQLITE_ROW {
            
            if let email = sqlite3_column_text(read, 0) {
                print(String(cString: email))
            }
            if let password = sqlite3_column_text(read, 1) {
                print(String(cString: password))
            }
            print("\n")
        }
    }
    
        func checkdata(email : String , password : String) -> Bool {
        var arr = [user]()
        let q = "select email,password from user WHERE email = '\(email) 'and password = '\(password)'"
        var table : OpaquePointer?
            sqlite3_prepare(RegitrationSqliteFile.file, q, -1, &table, nil)
        while sqlite3_step(table) == SQLITE_ROW{
            let id = sqlite3_column_int64(table, 1)

            print("\(id)")

            if let Cstring = sqlite3_column_text(table, 0){
                let name = String(cString: Cstring)
                arr.append(user(email: String(id), password: name))
                print("Name = \(name)")
            } else {
                print( "************************")
            }
        }

        print("your data is recevied SuccessFully..")
        return (arr.count != 0)
    }
    
    static func deleteData(email: String,password: String) {
        let quary = "DELETE FROM user WHERE email = '\(email)'"
        var delete : OpaquePointer?
        
        sqlite3_prepare(file, quary, -1, &delete, nil)
        sqlite3_step(delete)
        print("Delete Data")
    }
    
}
