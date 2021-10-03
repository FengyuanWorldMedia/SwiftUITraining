// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

//  FMDatabaseAdditionsVariadic.swift
//  FMDatabaseVariadic.swift
//  This extension inspired by http://stackoverflow.com/a/24187932/1271826

import Foundation
import FMDB

extension FMDatabase {
    
    /// This is a rendition of executeQuery that handles Swift variadic parameters
    /// for the values to be bound to the ? placeholders in the SQL.
    ///
    /// :param: sql The SQL statement to be used.
    /// :param: values The values to be bound to the ? placeholders
    ///
    /// :returns: This returns FMResultSet if successful. Returns nil upon error.
    
    func executeQuery(sql:String, _ values: AnyObject...) -> FMResultSet? {
        return executeQuery(sql, withArgumentsIn: values as [AnyObject]);
    }
    
    /// This is a rendition of executeQuery that handles Swift variadic parameters
    /// for the values to be bound to the ? placeholders in the SQL.
    ///
    /// :param: sql The SQL statement to be used.
    /// :param: values The values to be bound to the ? placeholders
    ///
    /// :returns: This returns FMResultSet if successful. Returns nil upon error.
    
    func executeQuery(sql:String, _ values: [AnyObject]) -> FMResultSet? {
        return executeQuery(sql, withArgumentsIn: values);
    }
    
    /// This is a rendition of executeUpdate that handles Swift variadic parameters
    /// for the values to be bound to the ? placeholders in the SQL.
    ///
    /// :param: sql The SQL statement to be used.
    /// :param: values The values to be bound to the ? placeholders
    ///
    /// :returns: This returns true if successful. Returns false upon error.
    
    func executeUpdate(sql:String, _ values: AnyObject...) -> Bool {
        return executeUpdate(sql, withArgumentsIn: values as [AnyObject]);
    }
    
    
    /// This is a rendition of executeUpdate that handles Swift variadic parameters
    /// for the values to be bound to the ? placeholders in the SQL.
    ///
    /// :param: sql The SQL statement to be used.
    /// :param: values The values to be bound to the ? placeholders
    ///
    /// :returns: This returns true if successful. Returns false upon error.
    
    func executeUpdate(sql:String, _ values: [AnyObject]) -> Bool {
        return executeUpdate(sql, withArgumentsIn: values);
    }
}
