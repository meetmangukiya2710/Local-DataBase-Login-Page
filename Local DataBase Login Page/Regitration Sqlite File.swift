//
//  Regitration Sqlite File.swift
//  Local DataBase Login Page
//
//  Created by R95 on 13/02/24.
//

import Foundation
import UIKit
import SQLite3

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
    
}
