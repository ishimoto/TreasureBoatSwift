//
//  File.swift
//  
//
//  Created by Ken Ishimoto on 2022/10/14.
//

import Foundation

public class TBServerToMobileData {
    
    #warning("Use shared Key")
    static let SHARED_KEY: String = "bba0a0ec-3154-4f69-80c5-6a8f0a321598"
    
    var task: String
    
    private var _queryDescription: String = ""
    private var _sortDescription: String = ""
    private var _batch: String = "*"
    private var _dpk: String = ""
    
    private var _personID: String = ""
    private var _treasureboatID = SHARED_KEY
    
    private var _searchValue: String = "";
    
    private var _oldQuery: String = "" // OLD
    private var _oldSort: String = "" // OLD
    
    private var _imageRender: String = ""
    
    
    public init(task: String) {
        self.task = task
    }
    
    public var queryDescription: String {
        get {
            return self._queryDescription
        }
        set {
            if newValue.isEmpty {
                fatalError("invalid value for queryDescription")
            } else {
                self._queryDescription = newValue
            }
        }
    }
    
    public var sortDescription: String {
        get {
            return self._sortDescription
        }
        set {
            if newValue.isEmpty {
                fatalError("invalid value for sortDescription")
            } else {
                self._sortDescription = newValue
            }
        }
    }
    
    public var batch: String {
        get {
            return self._batch
        }
        set {
            if newValue.isEmpty {
                fatalError("invalid value for batch")
            } else {
                self._batch = newValue
            }
        }
    }
    
    public var dpk: String {
        get {
            return self._dpk
        }
        set {
            if newValue.isEmpty {
                fatalError("invalid value for dpk")
            } else {
                self._dpk = newValue
            }
        }
    }
    
    public var personID: String {
        get {
            return self._personID
        }
        set {
            if newValue.isEmpty {
                fatalError("invalid value for personID")
            } else {
                self._personID = newValue
            }
        }
    }

    public var treasureboatID: String {
        get {
            return self._treasureboatID
        }
        set {
            
            if newValue.isEmpty {
                self._treasureboatID = TBServerToMobileData.SHARED_KEY
            } else {
                if UUID.isValid(newValue) {
                    self._treasureboatID = newValue
                } else {
                    self._treasureboatID = TBServerToMobileData.SHARED_KEY
                }
            }
        }
    }
    
    public var searchValue: String {
        get {
            return self._searchValue
        }
        set {
            if newValue.isEmpty {
                fatalError("invalid value for searchValue")
            } else {
                self._searchValue = newValue
            }
        }
    }
    
    public var oldQuery: String {
        get {
            return self._oldQuery
        }
        set {
            if newValue.isEmpty {
                fatalError("invalid value for oldQuery")
            } else {
                self._oldQuery = newValue
            }
        }
    }
    
    public var oldSort: String {
        get {
            return self._oldSort
        }
        set {
            if newValue.isEmpty {
                fatalError("invalid value for oldSort")
            } else {
                self._oldSort = newValue
            }
        }
    }
   
    public var imageRender: String {
        get {
            return self._imageRender
        }
        set {
            if newValue.isEmpty {
                fatalError("invalid value for imageRender")
            } else {
                self._imageRender = newValue
            }
        }
    }
   
    public func postHeader() -> [String:String] {
        let postHeader: [String:String] = [
            "Content-Type" : "text/json"
        ]
        return postHeader;
    }

    func postData() -> [String:Any] {
        
        #warning("FIXME  queryDescription {}")
        print("searchValue = \(searchValue)")
        
        
        
        let postData: [String:Any] = [
            "task" : task,
            "dpk" : dpk,
            "queryDescription" : queryDescription,
            "sortDescription" : sortDescription,
            "batch" : batch,
            
            "query" : oldQuery,
            "sort" : oldSort,
            
            // Person ID (can be null and use tbid instead)
            "pid" : personID,
            "tbid" : treasureboatID,
            
            // Rendering
            "imageRender" : imageRender,
            
            // set the app Version Build to show which Client Version is connecting
            // in some cases this help to return an error for please update your App
            "appBuild" : Bundle.appVersionBuild,
            
            // return current OS Version
            "iOS" : Bundle.getOSInfo(),
            
            // FIXME Number of Navigation (TODO)
            "navigation" : 0
        ]
        return postData;
    }
    
    
    public func httpBody() -> Data {
        guard let httpBody = try? JSONSerialization.data(withJSONObject: postData(), options: []) else {
            print("Invalid HttpBody Serialization")
            return Data()
        }
        return httpBody
    }
    
}
