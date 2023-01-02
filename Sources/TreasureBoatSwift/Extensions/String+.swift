//
//  String+.swift
//  
//
//  Created by Ken Ishimoto on 2022/06/24.
//

import Foundation

extension String {

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
