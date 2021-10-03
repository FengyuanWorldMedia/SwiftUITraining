// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

//  _SQLiteManager.swift 
// There are three main classes in FMDB:
//
// FMDatabase - Represents a single SQLite database. Used for executing SQL statements.  (Not Thread Safety)
// FMResultSet - Represents the results of executing a query on an FMDatabase.
// FMDatabaseQueue - If you're wanting to perform queries and updates on multiple threads, you'll want to use this class. It's described in the "Thread Safety" section below.

import Foundation
import FMDB

class _SQLiteManager: NSObject {
    
    // MARK: 1、singleton
    private static let manager: _SQLiteManager = _SQLiteManager()
    // database full path
    private let dbFullPath = String.cacheDir() + "/test.sqlite"
    
    class func shareManager() -> _SQLiteManager {
        return manager
    }
    // 1.Get the full path of database file
    // dbFullPath
    // MARK: 2、（Not thread safety）database
    var db: FMDatabase?
    
    // Create a database and create tables.
    func openDB() {
        
        // 2.Create database Object
        db = FMDatabase(path: dbFullPath)
        // 3.Open databse
        // Open method Comment :if the database file exists, open it .Otherwise ,create a new one.
        if !db!.open() {
            LogUtil.logInfo(string: "Fails to open database. A new one created!")
            return
        }
        // dropTable()
        createTable()
    }
    
    func isDbExist() -> Bool {
        var created = false
        if !FileManager.default.fileExists(atPath: dbFullPath) {
            created = true
        }
        return created
    }
    
     // MARK: 3、drop tables
    private func dropTable() {
         
         // 1.Create sql statement
         // https://www.sqlite.org/lang_createtable.html
         // https://www.sqlite.org/withoutrowid.html
         let sql = "DROP TABLE BOOK_INFO;"
         
         // 2.execute sql
         // Comment: In FMDB, executeQuery or executeUpdate
         if db!.executeUpdate(sql: sql, AnyObject.self as AnyObject){
             LogUtil.logInfo(string: "Drop table successfully")
         } else {
             LogUtil.logInfo(string: "Drop to create table.")
         }
     }
    
    // MARK: 3、create tables
   private func createTable() {
        
        // 1.Create sql statement
        // https://www.sqlite.org/lang_createtable.html
        // https://www.sqlite.org/withoutrowid.html
        let sql = "CREATE TABLE IF NOT EXISTS BOOK_INFO( \n" +
            "BOOK_ID TEXT PRIMARY KEY, \n" +
            "BOOK_NO TEXT, \n" +
            "TOKEN_ID TEXT, \n" +                         
            "IS_USED INTEGER, \n" +                   // when 1, it means a tempory card,otherwise(0), it mearns registered card.
            "REGIST_TIME TEXT, \n" +                      // REGIST_TIME(format:yyyyMMddHH24missSSS)
            "TOKENID_EXPIRED_TIME TEXT, \n" +             // TOKENID_EXPIRED_TIME(format:yyyyMMddHH24missSSS)
            "CREATE_TIME TEXT, \n" +                      // CREATE_TIME(format:yyyyMMddHH24missSSS)
            "UPDATE_TIME TEXT \n" +                       // UPDATE_TIME(format:yyyyMMddHH24missSSS)
        ") WITHOUT ROWID ; \n"
        
        // 2.execute sql
        // Comment: In FMDB, executeQuery or executeUpdate
        if db!.executeUpdate(sql: sql, AnyObject.self as AnyObject){
            LogUtil.logInfo(string: "Create table successfully")
        } else {
            LogUtil.logInfo(string: "Fails to create table.")
        }
    }
}
