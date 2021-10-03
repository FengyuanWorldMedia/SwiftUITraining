// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation
public class DateUtil {
    
    private static let LOCALE_IDENTIFIER = "en_US_POSIX"
    
    public static let DATE_FORMAT_YMD = "yyyyMMdd"
    
    public static let DATE_FORMAT_YMDHMS = "yyyyMMddHHmmss"
    
    public static let DATE_FORMAT_YMDHMSSSS = "yyyyMMddHHmmssSSS"
    
    public static let DATE_FORMAT_YMD_SLASH = "yyyy/MM/dd"
    
    public static let DATE_FORMAT_HIS_TIME = "yyyy/MM/dd HH:mm"
    
    private static func getDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: LOCALE_IDENTIFIER)
        dateFormatter.timeZone = TimeZone(identifier: "JST")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        return dateFormatter
    }
    
    private static func validateDateFormat(_ format: String) -> Bool {
        switch format {
            case DATE_FORMAT_YMD:
                return true
            case DATE_FORMAT_YMDHMS:
                return true
            case DATE_FORMAT_YMD_SLASH:
                return true
            case DATE_FORMAT_HIS_TIME:
                return true
            case DATE_FORMAT_YMDHMSSSS:
                return true
            default:
                return false
        }
    }
    
    /// Converte history date to string
    /// - Parameter historyDate provide history date
   public static func getHistoryTime(hisDate historyDate: Date) -> String {
        return stringFromDate(date: historyDate, format: DATE_FORMAT_HIS_TIME)
    }
    
    /// Converts a date in provide format to a date in the specified format
    /// - Parameter fromDateFormat: provide format
    /// - Parameter outFormat: specified format
    /// - Parameter dateYmd:provide date string
   public static func format(fromDateFormat:String = DATE_FORMAT_YMD, outFormat: String, dateYmd: String) -> String {
        let formatter = getDateFormatter()
        formatter.dateFormat = fromDateFormat
        
        let date:Date? = formatter.date(from: dateYmd)
        if date == nil {
            return "Error converting : \"\(dateYmd)\" convert to date in \"\(fromDateFormat)\" format."
        }
        
        formatter.dateFormat = outFormat
        return formatter.string(from: date!)
    }
    
    /// Converte string to date
    /// - Parameters:
    ///   - string: provide date string
    ///   - format: provide format
   public class func dateFromString(string: String, format: String) -> Date {
        
        guard validateDateFormat(format) else {
            return Date(timeIntervalSince1970: 0.0)
        }

        let formatter = getDateFormatter()
        formatter.dateFormat = format
        
        var convertDate:Date? = formatter.date(from: string)
        if convertDate == nil {
            convertDate = Date(timeIntervalSince1970: 0.0)
        }
        
        return convertDate!
    }
    
    /// Converte date to string
    /// - Parameters:
    ///   - date: provide date
    ///   - format: provide format
   public class func stringFromDate(date: Date, format: String) -> String {
        
        guard validateDateFormat(format) else {
            return "error date format:\(format)"
        }
        
        let formatter = getDateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    /// Provide local time
    /// - Parameter format: provide format
   public class func getCurrentDate(format: String = DateUtil.DATE_FORMAT_YMDHMS) -> String {
        
        guard validateDateFormat(format) else {
            return "error date format:\(format)"
        }
        
        let formatter = getDateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: NSDate.now)
    }
    
     /// Provide local timestamp
     /// - Parameter format: provide format
    public class func getCurrentTimestamp(format: String = DateUtil.DATE_FORMAT_YMDHMSSSS) -> String {
         guard validateDateFormat(format) else {
             return "error date format:\(format)"
         }
         let formatter = getDateFormatter()
         formatter.dateFormat = format
         return formatter.string(from: Date())
     }
    
    
    public class func addSeconds(date paramDate: Date, seconds paramSeconds: Int) -> Date {
        return paramSeconds == 0 ? paramDate : paramDate.addingTimeInterval(TimeInterval(paramSeconds))
    }
    
    // date: yyyyMMddHHmmssSS
    public class func addSeconds(dateString paramDateString: String,
                                 seconds paramSeconds: Int,
                                 dateFormat : String = DATE_FORMAT_YMDHMSSSS) -> Date {
       // let dateString = dateFromString(string: date, format: DATE_FORMAT_YMDHMSSSS)
        let dateObj =  DateUtil.dateFromString(string: paramDateString, format: dateFormat)
        return paramSeconds == 0 ? dateObj : addSeconds(date: dateObj, seconds: paramSeconds)
    }
    
    public class func compare(_ date1: Date, _ date2: Date) -> Int {
        return date1 == date2 ? 0 : (date1 > date2 ? 1 : -1)
    }
    

}
