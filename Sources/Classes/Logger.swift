//
//  Logger.swift
//  RudderKit
//
//  Created by Pallab Maiti on 11/07/23.
//

import Foundation

@frozen @objc public enum LogLevel: Int {
    case verbose = 5
    case debug = 4
    case info = 3
    case warning = 2
    case error = 1
    case `none` = 0
    
    func toString() -> String {
        switch self {
            case .verbose:
                return "Verbose"
            case .debug:
                return "Debug"
            case .info:
                return "Info"
            case .warning:
                return "Warning"
            case .error:
                return "Error"
            case .none:
                return ""
        }
    }
}

@objc
open class Logger: NSObject {
    let logLevel: LogLevel
    
    @objc
    public init(logLevel: LogLevel) {
        self.logLevel = logLevel
    }
    
    @objc
    public func logDebug(_ message: String) {
        rsLog(message: message, logLevel: .debug)
    }
    
    @objc
    public func logInfo(_ message: String) {
        rsLog(message: message, logLevel: .info)
    }
    
    @objc
    public func logError(_ message: String) {
        rsLog(message: message, logLevel: .error)
    }
    
    @objc
    public func logWarning(_ message: String) {
        rsLog(message: message, logLevel: .warning)
    }
    
    public func logDebug(_ message: String, function: String = #function, line: Int = #line) {
        rsLog(message: message, logLevel: .debug, function: function, line: line)
    }
    
    public func logInfo(_ message: String, function: String = #function, line: Int = #line) {
        rsLog(message: message, logLevel: .info, function: function, line: line)
    }
    
    public func logWarning(_ message: String, function: String = #function, line: Int = #line) {
        rsLog(message: message, logLevel: .warning, function: function, line: line)
    }
    
    public func logError(_ message: String, function: String = #function, line: Int = #line) {
        rsLog(message: message, logLevel: .error, function: function, line: line)
    }
    
    func rsLog(message: String, logLevel: LogLevel, function: String? = #function, line: Int? = #line) {
        if self.logLevel == .verbose || self.logLevel == logLevel {
            var metadata = ""
            if let function = function, let line = line {
                metadata = " - \(function):\(line):"
            }
            print("RudderStack:\(logLevel.toString()):\(metadata)\(message)")
        }
    }
}
