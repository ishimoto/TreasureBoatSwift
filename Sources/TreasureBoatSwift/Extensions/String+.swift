//
//  String+.swift
//  
//
//  Created by Ken Ishimoto on 2022/06/24.
//

import SwiftUI

extension String {
    
    public func trimmedAndEscaped() -> String {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }

    public func asDateFromPattern(_ pattern : String = "yyyy/MM/dd") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = pattern
        return formatter.date(from: self)
    }

    /// Swift’s string have a built-in hasPrefix() method that returns true if the string starts with specific letters,
    /// but they don’t have a way to remove those letters if they exist.
    /// - Parameter prefix: the prefix
    /// - Returns: the result string
    public func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }

    /// Swift’s string have a built-in hasPrefix() method that returns true if the string starts with specific letters,
    /// but they don’t have a way to remove those letters if they exist.
    /// - Parameter suffix: the suffix
    /// - Returns: the result string
    public func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
    
    /// Convert the url string presentation into a real URL
    /// - Returns: an URL.
    public func url() -> URL {
        return URL(string: self)!
    }
    
    /// Convert the url string presentation into a real URL
    /// - Returns: an URL.
    public func fileUrl() -> URL {
        return URL(fileURLWithPath: self)
    }

    /// Get the filename from a String
    /// - Returns: The file name.
    /// - SeeAlso: ``fileExtension()``
    public func fileName() -> String {
        return self.fileUrl().deletingPathExtension().lastPathComponent
    }
    
    /// Get the file extension from a String.
    /// - Returns: The file extension.
    /// - SeeAlso: ``fileName()``
    public func fileExtension() -> String {
        return self.fileUrl().pathExtension
    }

    /// returns the last path seperated by '/'
    public var lastPathComponent: String {
        return String(self.split(separator: "/").last ?? "")
    }

    // Credit: https://gist.github.com/BetterProgramming/ac4f639c915ef0560fcca5208d9456f9#file-firstoccur-swift
    public  func indices(of occurrence: String) -> [Int] {
        var indices = [Int]()
        var position = startIndex
        while let range = range(of: occurrence, range: position ..< endIndex) {
            let i = distance(from: startIndex,
                             to: range.lowerBound)
            indices.append(i)
            let offset = occurrence.distance(from: occurrence.startIndex,
                                             to: occurrence.endIndex) - 1
            guard let after = index(range.lowerBound, offsetBy: offset, limitedBy: endIndex) else {
                break
            }
            position = index(after: after)
        }
        return indices
    }
    
    /*
         let string = "0123456789"
         
         print(string[3]) // -> "3"
         print(string[-3]) // -> "7"
         print(string[1...5]) // -> "12345"
         print(string[1..<5]) // -> "1234"
         print(string[...5])  // -> "012345"
         print(string[...(-3)])  // -> "01234567"
         print(string[..<5])  // -> "01234"
         print(string[..<(-3)])  // -> "0123456"
         print(string[5...])  // -> "56789"
         print(string[(-3)...])  // -> "789"
     */
    
    /// String extension for convenient of substring
    /// Thanks to ' H.Kitano'
    
    /// Index with using position of Int type
    public func index(at position: Int) -> String.Index {
        return index((position.signum() >= 0 ? startIndex : endIndex), offsetBy: position)
    }
    
    /// Subscript for using like a "string[i]"
    public subscript (position: Int) -> String {
        let i = index(at: position)
        return String(self[i])
    }
    
    /// Subscript for using like a "string[start..<end]"
    public subscript (bounds: CountableRange<Int>) -> String {
        let start = index(at: bounds.lowerBound)
        let end = index(at: bounds.upperBound)
        return String(self[start..<end])
    }
    
    /// Subscript for using like a "string[start...end]"
    public subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(at: bounds.lowerBound)
        let end = index(at: bounds.upperBound)
        return String(self[start...end])
    }
    
    /// Subscript for using like a "string[..<end]"
    public subscript (bounds: PartialRangeUpTo<Int>) -> String {
        let i = index(at: bounds.upperBound)
        return String(prefix(upTo: i))
    }
    
    /// Subscript for using like a "string[...end]"
    public subscript (bounds: PartialRangeThrough<Int>) -> String {
        let i = index(at: bounds.upperBound)
        return String(prefix(through: i))
    }
    
    /// Subscript for using like a "string[start...]"
    public subscript (bounds: PartialRangeFrom<Int>) -> String {
        let i = index(at: bounds.lowerBound)
        return String(suffix(from: i))
    }
    
    /// let text: String = "<!DOCTYPE html><html>"
    /// print(text.substring(from: "<", to: ">")!)
    /// print(text.substring(from: "<", to: ">", ignoreDelimiter: true)!)
    public func substring(from: Character, to: Character) -> String? {
        return substring(from: from, to: to, ignoreDelimiter: false)
    }
    
    public func substring(from: Character, to: Character, ignoreDelimiter: Bool) -> String? {
        if let startIndex = self.firstIndex(of: from), let endIndex = self.firstIndex(of: to) {
            return self[self.index(startIndex, offsetBy: (ignoreDelimiter == true ? 1 : 0) )...self.index(endIndex, offsetBy: (ignoreDelimiter == true ? -1 : 0) )].description
        }
        return nil
    }

#if canImport(UIKit)
    public func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
#endif

    
    
    
    
    
    
    
    
    
    
    
    // TODO next
    
    // var myData = readCSV(inputFile: "input.csv", separator: ",")
    public func readCSV(inputFile: String, separator: String) -> [String] {
        // Split the file name
        let fileExtension = inputFile.fileExtension()
        let fileName = inputFile.fileName()
        
        // Get the file URL
        let fileURL = try! FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileToRead = fileURL.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
        
        // Get Data
        do {
            let savedData = try String(contentsOf: fileToRead)
            return savedData.components(separatedBy: separator)
        } catch {
            return ["Error file couldn`t be found"]
        }
        
    }

}
