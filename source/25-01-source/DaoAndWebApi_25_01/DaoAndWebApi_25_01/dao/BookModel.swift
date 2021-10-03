// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation
import FMDB

public class BookModel: Equatable, Hashable {
    
    public var bookId: String
    public var bookNo: String
    public var tokenId: String
    public var isUsed : Int8
    public var registTime : String?
    public var tokenIdExpiredTime : String?
    private var createTime : String
    private var updateTime : String

    public static var lastError : Error?
    public static var lastErrorCode : Int32?
    public static var lastErrorMessage : String?
    
    public init(id paraId: String , bookNo parambookNo :String) {
        self.bookId           = paraId
        self.bookNo             = parambookNo
        self.tokenId           = ""
        self.isUsed        = 0
        self.createTime        = ""
        self.updateTime        = ""
    }
    
    public init(id paraId: String,
                bookNo parambookNo: String,
                tokenId paramTokenId: String,
                isUsed paramIsUsed: Int8,
                registTime paramRegistTime: String,
                tokenIdExpiredTime paramTokenIdExpiredTime :String,
                createTime paramCreateTime: String,
                updateTime paramUpdateTime: String) {
        self.bookId            = paraId
        self.bookNo              = parambookNo
        self.tokenId            = paramTokenId
        self.isUsed         = paramIsUsed
        self.registTime         = paramRegistTime
        self.tokenIdExpiredTime = paramTokenIdExpiredTime
        self.createTime         = paramCreateTime
        self.updateTime         = paramUpdateTime
    }
    
    public static func == (lhs: BookModel, rhs: BookModel) -> Bool {
         return (lhs.bookId == rhs.bookId)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.bookNo + self.bookId)
    }
        
    public var description: String {
        return "bookId = \(bookId),bookNo = \(bookNo),"
                + "tokenId = \(tokenId),isUsed = \(isUsed),"
                + "tokenIdExpiredTime = \(tokenIdExpiredTime ?? ""),"
                + "registTime = \(registTime ?? ""),createTime = \(createTime),"
                + "updateTime = \(updateTime)"
    }
    
    //    // MARK: insertbookInfo
    //    public func insertbookInfo() -> Bool {
    //        // 1、create sql statement
    //        let sql = "INSERT INTO book_INFO (book_ID,book_NO,CHARGE_SETTING_FLG,IS_OSAIFU) VALUES "
    //        + "('\(id)','\(bookNo)',\(chargeSettingFlag),\(isOsaifu));"
    //        // 2、execute sql
    //        return SQLiteManager.shareManager().db!.executeUpdate(sql, withArgumentsIn: [])
    //    }
     
    public static func clearErrorInfo() {
        BookModel.lastError = nil
        BookModel.lastErrorCode = nil
        BookModel.lastErrorMessage = nil
    }
    
    private static func setSQLException(_ lastError:Error, _ lastErrorCode:Int32, _ lastErrorMessage: String) {
        BookModel.lastError = lastError
        BookModel.lastErrorCode = lastErrorCode
        BookModel.lastErrorMessage = lastErrorMessage
    }
    
    private func executeUpdate(sql:String, _ values: AnyObject...) -> Bool {
        let db:FMDatabase = _SQLiteManager.shareManager().db!
        let successFlg = db.executeUpdate(sql: sql, values as [AnyObject])
        if !successFlg {
            BookModel.setSQLException(db.lastError(), db.lastErrorCode(), db.lastErrorMessage())
        }
        return successFlg
    }
    
    private static func executeUpdate(sql:String, withArgumentsIn: [AnyObject]) -> Bool {
        let db:FMDatabase = _SQLiteManager.shareManager().db!
        let successFlg = db.executeUpdate(sql, withArgumentsIn : withArgumentsIn)
        if !successFlg {
            BookModel.setSQLException(db.lastError(), db.lastErrorCode(), db.lastErrorMessage())
        }
        return successFlg
    }
    
    private func executeQuery(sql:String, _ values: AnyObject...) -> FMResultSet? {
        let db:FMDatabase = _SQLiteManager.shareManager().db!
        let result:FMResultSet? = db.executeQuery(sql: sql, values as [AnyObject])
        if result == nil {
            BookModel.setSQLException(db.lastError(), db.lastErrorCode(), db.lastErrorMessage())
        }
        return result
    }
    
    private static func executeQuery(sql:String, withArgumentsIn: [AnyObject]) -> FMResultSet? {
        let db:FMDatabase = _SQLiteManager.shareManager().db!
        let result:FMResultSet? = db.executeQuery(sql, withArgumentsIn: withArgumentsIn)
        if result == nil {
            BookModel.setSQLException(db.lastError(), db.lastErrorCode(), db.lastErrorMessage())
        }
        return result
    }
    // 20200316 JIN End
    
    /**
     insertbookInfo(Preparement）
     */
    public func insertbookInfo() -> Bool {
        // 1、create sql statement
        let sql = "INSERT INTO book_INFO"
                   + "(book_ID,book_NO,TOKEN_ID,IS_USED,REGIST_TIME,TOKENID_EXPIRED_TIME,CREATE_TIME,UPDATE_TIME)"
                   + " VALUES (?,?,?,?,?,?,?,?);"
        // 2、execute sql
        return self.executeUpdate(sql: sql, bookId as AnyObject,
                                            bookNo as AnyObject,
                                            tokenId as AnyObject,
                                            isUsed as AnyObject,
                                            registTime as AnyObject,
                                            tokenIdExpiredTime as AnyObject,
                                            DateUtil.getCurrentTimestamp() as AnyObject,
                                            DateUtil.getCurrentTimestamp() as AnyObject)
    }
    
    // MARK: Update
    public func updatebookInfo() -> Bool {
        // 1、create sql statement
        let sql = "UPDATE book_INFO SET "
                  +  "   book_NO = ?"
                  +  " , TOKEN_ID = ? "
                  +  " , IS_USED = ? "
                  +  " , REGIST_TIME = ? "
                  +  " , TOKENID_EXPIRED_TIME = ? "
                  +  " , UPDATE_TIME = ? "
                  +  "  WHERE book_ID = ?;"
        // 2、execute sql
        return self.executeUpdate(sql: sql, bookNo      as AnyObject,
                                            tokenId    as AnyObject,
                                            isUsed as AnyObject,
                                            registTime as AnyObject,
                                            tokenIdExpiredTime as AnyObject,
                                            DateUtil.getCurrentTimestamp() as AnyObject,
                                            bookId    as AnyObject)
    }
    
    // MARK: delete
    public func deletebookInfoByKey() -> Bool {
        // 1、create sql statement
        let sql = "DELETE FROM book_INFO WHERE book_ID = ?;"
        // 2、execute sql
        return self.executeUpdate(sql: sql, bookId as AnyObject)
    }
    
    public func deletebookInfoBybookNo() -> Bool {
        // 1、create sql statement
        let sql = "DELETE FROM book_INFO WHERE book_NO = ?;"
        // 2、execute sql
        return self.executeUpdate(sql: sql, bookNo as AnyObject)
    }
    
    // MARK: Get all bookNo books info.
    public class func getbookInfoByKey(bookId parambookId:String) -> BookModel? {
        let sql = "SELECT * FROM book_INFO WHERE book_ID = ?;"
        let res = BookModel.executeQuery(sql: sql, withArgumentsIn: [parambookId as AnyObject])
        if res == nil || !(res?.next() ?? false)  {
            return nil
        }
        return getbookInfo(resultSet:res)
    }
    
    // MARK: Get temp bookNo books info.
    public class func getTempbookInfo() -> BookModel? {
        let sql = "SELECT * FROM book_INFO WHERE IS_USED = ?;"
        let res = BookModel.executeQuery(sql: sql, withArgumentsIn: [0 as AnyObject])
        if res == nil || !(res?.next() ?? false)  {
            return nil
        }
        return getbookInfo(resultSet:res)
    }
    
    // MARK: deleteALL
    public class func deleteAllbookInfo() -> Bool {
        // 1、create sql statement
        let sql = "DELETE FROM book_INFO;"
        // 2、execute sql
        return BookModel.executeUpdate(sql: sql, withArgumentsIn: [])
    }
    
    // MARK: Get all bookNo books info.
    public class func loadbookInfos() -> [BookModel] {
        let sql = "SELECT * FROM book_INFO ORDER BY IS_USED DESC, REGIST_TIME;"
        let res = BookModel.executeQuery(sql: sql, withArgumentsIn: [])
        var models = [BookModel]()
        while res?.next() ?? false {
            models.append(getbookInfo(resultSet:res))
        }
        return models
    }
    
    private class func getbookInfo(resultSet res: FMResultSet?) -> BookModel {
        let bookInfo = BookModel(id: (res?.string(forColumn: "book_ID"))!, bookNo : (res?.string(forColumn: "book_NO"))!)
        bookInfo.tokenId            = res?.string(forColumn: "TOKEN_ID") ?? ""
        bookInfo.isUsed         = Int8(res?.int(forColumn: "IS_USED") ?? 0)
        bookInfo.registTime         = res?.string(forColumn: "REGIST_TIME") ?? ""
        bookInfo.tokenIdExpiredTime = res?.string(forColumn: "TOKENID_EXPIRED_TIME") ?? ""
        bookInfo.createTime         = res?.string(forColumn: "CREATE_TIME") ?? ""
        bookInfo.updateTime         = res?.string(forColumn: "UPDATE_TIME") ?? ""
        return bookInfo
    }
    
}
