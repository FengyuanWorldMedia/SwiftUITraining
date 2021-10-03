// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

//  _SafeSQLiteManager.swift
//  https://github.com/ccgus/fmdb
// There are three main classes in FMDB:

// FMDatabase - Represents a single SQLite database. Used for executing SQL statements.  (Not Thread Safety)
// FMResultSet - Represents the results of executing a query on an FMDatabase.
// FMDatabaseQueue - If you're wanting to perform queries and updates on multiple threads, you'll want to use this class. It's described in the "Thread Safety" section below.


import Foundation
import FMDB

class _SafetySQLiteManager: NSObject {
    
    // MARK: 1、singleton
    private static let manager: _SafetySQLiteManager = _SafetySQLiteManager()
    // database full path
    private let dbFullPath = String.cacheDir() + "/test.sqlite"
    
    class func shareManager() -> _SafetySQLiteManager {
        return manager
    }
    // MARK: 2、（Thread Safety）database
    // FMDatabaseQueue will run the blocks on a serialized queue (hence the name of the class). So if you call FMDatabaseQueue’s methods from multiple threads at the same time, they will be executed in the order they are received. This way queries and updates won’t step on each other’s toes, and every one is happy.
    
    // The calls to FMDatabaseQueue’s methods are blocking. So even though you are passing along blocks, they will not be run on another thread.
    var dbQueue: FMDatabaseQueue?
    
    // Create a database and create tables.
    func openDB() {
        
        // 1.Get the full path of database file
        // dbFullPath
        // 2.Create database Object（Thread safety）
        dbQueue = FMDatabaseQueue(path: dbFullPath)
        
        // 3. FMDatabaseQueue: create database , it is not needed to open database ,cause done automatically.
        // https://ccgus.github.io/fmdb/html/Classes/FMDatabaseQueue.html
        
        // dropTable()
        // 4、create tables
        createTable()
    }
    
     // MARK: 3、drop tables
    private func dropTable() {
         
         // 1.Create sql statement
         // https://www.sqlite.org/lang_createtable.html
         // https://www.sqlite.org/withoutrowid.html
         let sql = "DROP TABLE BOOK_INFO;"
         // 2.execute sql
         // Comment: In FMDB, executeQuery or executeUpdate
         dbQueue!.inDatabase { (db) in
             db.executeUpdate(sql, withArgumentsIn: [])
         }
     }
    
    
    func isDbExist(dBName: String) -> Bool {
        var created = false
        if !FileManager.default.fileExists(atPath: dbFullPath) {
            created = true
        }
        return created
    }
    // MARK: 3、create tables
    private func createTable() {
        // https://www.sqlite.org/lang_createtable.html
        // https://www.sqlite.org/withoutrowid.html
        // 1.Create sql statement
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
        // inDatabase           : Synchronously perform database operations on queue.
        // inTransaction        : Synchronously perform database operations on queue, using transactions.
        // inDeferredTransaction: Synchronously perform database operations on queue, using deferred transactions.
        // inSavePoint          : Synchronously perform database operations using save point.
        dbQueue!.inDatabase { (db) in
            db.executeUpdate(sql, withArgumentsIn: [])
        }
    }
}
