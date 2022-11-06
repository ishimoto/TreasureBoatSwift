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
    
    public init(task: String) {
        self.task = task
    }
    
    private var _queryDescription: String = ""
    private var _sortDescription: String = ""
    private var _batch: String = "*"
    private var _dpk: String = ""
    
    private var _personID: String = ""
    private var _treasureboatID = SHARED_KEY
    
    private var _domain: String = ""
    
    private var _searchValue: String = "";
    
    private var _oldQuery: String = "" // OLD
    private var _oldSort: String = "" // OLD
    
    private var _imageRender: String = ""
    
    private var _dataPostLocation: String = ""
    private var _dataPostDictionary: [String:Any] =  [:]
    
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
    
    public var domain: String {
        get {
            return self._domain
        }
        set {
            if newValue.isEmpty {
                fatalError("invalid value for domain")
            } else {
                self._domain = newValue
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
    
    public var dataPostLocation: String {
        get {
            return self._dataPostLocation
        }
        set {
            if newValue.isEmpty {
                fatalError("invalid value for dataPostLocation")
            } else {
                self._dataPostLocation = newValue
            }
        }
    }
    
    public var dataPostDictionary: [String:Any]  {
        get {
            return self._dataPostDictionary
        }
        set {
            if newValue.isEmpty {
                fatalError("invalid value for dataPostDictionary")
            } else {
                self._dataPostDictionary = newValue
            }
        }
    }
    
    public func addToPostDictionary(key: String, value: String) {
        dataPostDictionary[key] = value
    }
    
    func postHeader() -> [String:String] {
        let postHeader: [String:String] = [
            "Content-Type" : "text/json"
        ]
        return postHeader;
    }
    
    func postData() -> [String:Any] {
        
        var postData: [String:Any] = [
            "task" : task,
            
            // set the app Version Build to show which Client Version is connecting
            // in some cases this help to return an error for please update your App
            "appBuild" : Bundle.appVersionBuild,
            
            // return current OS Version
            "iOS" : Bundle.getOSInfo(),
            
            // FIXME Number of Navigation (TODO)
            "navigation" : 0
        ]

        if !dpk.isEmpty {
            postData["dpk"] = dpk
        }

        if !batch.isEmpty {
            postData["batch"] = batch
        }

        if !oldQuery.isEmpty || !queryDescription.isEmpty {
            postData["query"] = oldQuery
            postData["queryDescription"] = queryDescription
        }

        if !oldSort.isEmpty || !sortDescription.isEmpty {
            postData["sort"] = oldSort
            postData["sortDescription"] = sortDescription
        }

        if !batch.isEmpty {
            postData["batch"] = batch
        }

        if !personID.isEmpty {
            postData["pid"] = personID
        }

        if !treasureboatID.isEmpty {
            postData["tbid"] = treasureboatID
        }

        if !domain.isEmpty {
            postData["domain"] = domain
        }

        if !imageRender.isEmpty {
            postData["imageRender"] = imageRender
        }
        
        if !dataPostLocation.isEmpty {
            // The post location
            postData["post"] = dataPostLocation
            
            // The post data Object
            postData["data"] = dataPostDictionary
        }
                
        return postData;
    }
    
    
    public func httpHeader() -> [String:String] {
        return postHeader()
    }
    
    public func httpBody() -> Data {
        guard let httpBody = try? JSONSerialization.data(withJSONObject: postData(), options: []) else {
            print("Invalid HttpBody Serialization")
            return Data()
        }
        return httpBody
    }
    
    public var debugDescription: String {
        var description: String = "\n"
        description += "HTTP HEADER:\n"
        description += "    \(postHeader())\n"
        description += "HTTP BODY:\n"
        
        postData().forEach { (key: String, value: Any) in
            description += "    \(key) -> \(value)\n"
        }
        return description
    }
}
