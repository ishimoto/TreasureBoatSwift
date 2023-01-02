//
//  Log.swift
//  SwiftLogging
//
//  Created by Ken Ishimoto on 2022/12/04.
//  Thanks to : Aryaman Sharda for the nice idea
//

import SwiftUI
import CocoaLumberjackSwift

#if os(iOS)
import SwiftUILogger
#endif

/* https://github.com/CocoaLumberjack/CocoaLumberjack */
/* https://github.com/0xLeif/SwiftUILogger */

#if os(iOS)
let logger = SwiftUILogger(name: "Demo")
#endif

public enum Log {
    
    enum LogLevel {
        case trace
        case debug
        case info
        case warning
        case error
        
        fileprivate var prefix: String {
            switch self {
            case .trace:
                return "[TRACE]"
            case .debug:
                return "[DEBUG]"
            case .info:
                return "[INFO ]"
            case .warning:
                return "[WARN ] ⚠️"
            case .error:
                return "[ERROR] ❌"
            }
        }
    }
    
    struct Context {
        let file: String
        let function: String
        let line: Int
        var description: String {
            return "\(file.lastPathComponent):\(line) \(function)"
        }
    }
    
    public static func register() {
        register(logLevel: .info)
    }
    
    public static func register(logLevel: DDLogLevel, useFileLogger: Bool = true) {
        
        // 可能であればXcodeのコンソールにログを出力する。
        DDLog.add(DDOSLogger.sharedInstance, with: .info)
        
        // ファイルにログを出力する。
        if useFileLogger {
            let fileLogger: DDFileLogger = DDFileLogger() // File Logger
            fileLogger.rollingFrequency = 60 * 60 * 24 // 24 hours
            fileLogger.logFileManager.maximumNumberOfLogFiles = 7
            DDLog.add(fileLogger)
        }
    }
    
    public static func trace(_ str: StaticString, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .trace, str: str.description, context: context)
    }
    
    public static func trace(_ str: String, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .trace, str: str.description, context: context)
    }
    
    public static func debug(_ str: StaticString, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .debug, str: str.description, context: context)
    }
    
    public static func debug(_ str: String, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .debug, str: str.description, context: context)
    }
    
    public static func info(_ str: StaticString, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .info, str: str.description, context: context)
    }
    
    public static func info(_ str: String, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .info, str: str.description, context: context)
    }
    
    public static func warning(_ str: StaticString, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .warning, str: str.description, context: context)
    }
    
    public static func warning(_ str: String, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .warning, str: str.description, context: context)
    }
    
    public static func error(_ str: StaticString, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .error, str: str.description, context: context)
    }
    
    public static func error(_ str: String, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .error, str: str.description, context: context)
    }
    
    public static func viewEvent(_ str: StaticString, file: String = #file, function: String = #function, line: Int = #line) -> some View {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .info, str: str.description, context: context)
        return EmptyView()
    }

    public static func viewEvent(_ str: String, file: String = #file, function: String = #function, line: Int = #line) -> some View {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .info, str: str.description, context: context)
        return EmptyView()
    }

    public static func showLoggerView() -> some View {
#if os(iOS)
        return LoggerView(logger: logger)
#else
        return EmptyView()
#endif
    }
    
    fileprivate static func handleLog(level: LogLevel, str: String, context: Context) {
        let logComponents = [level.prefix, context.description, str]
        let fullString = logComponents.joined(separator: " ")
        
        switch level {
        case .trace:
            DDLogVerbose(fullString)
            
        case .debug:
            DDLogDebug(fullString)
            
        case .info:
#if os(iOS)
            logger.log(level: .info, message: fullString)
#endif
            DDLogInfo(fullString)
            
        case .warning:
#if os(iOS)
            logger.log(level: .warning, message: fullString)
#endif
            DDLogWarn(fullString)
            
        case .error:
#if os(iOS)
            logger.log(level: .error, message: fullString)
#endif
            DDLogError(fullString)
        }
        
#if os(iOS)
        // This is only a development fun log feature. so not use to much memory here we only display the last 15 logs
        if logger.logs.count > 15 {
            logger.logs.removeFirst()
        }
#endif
        
    }
}
