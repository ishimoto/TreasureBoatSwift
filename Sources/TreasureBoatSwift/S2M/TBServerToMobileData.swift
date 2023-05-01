//
//  TBServerToMobileData.swift
//  
//
//  Created by Ken Ishimoto on 2022/10/14.
//

import SwiftUI
import MagicUI

public class TBServerToMobileData {
    
    static let serverConnectVersion1: String = "/s2m/v1"
    static let serverConnectVersion2: String = "/s2m/v2"
    public static let treasureBoat: String = "www.treasureboat.org"
    static let version1: String = "/TB/GWare" + serverConnectVersion1
    static let version2: String = "/TB/GWare" + serverConnectVersion2

    /* TASK */
    var task: String
    
    /* a Service Call to TreasureBoat.org */
    public var serviceCall: Bool
    
    public init(task: String, serviceCall: Bool = false) {
        self.task = task
        self.serviceCall = serviceCall
    }
    
    //********************************************************************
    // Error Information
    //********************************************************************
    
    private var _errorMessage: String = ""
    public var errorMessage: String {
        get {
            return self._errorMessage
        }
        set {
            self._errorMessage = newValue
            Log.error(errorMessage)
        }
    }

    public func isValid() -> Bool {
        return errorMessage.isEmpty
    }
    
    //********************************************************************
    // Server Information
    //********************************************************************
    
    private var _schema: ETBHTTPSchema = .https
    public var schema: ETBHTTPSchema {
        get {
            return self._schema
        }
        set {
            self._schema = newValue
        }
    }

    private var _fullUrl: String = ""
    public var fullUrl: String {
        get {
            return self._fullUrl
        }
        set {
            self._fullUrl = newValue
        }
    }

    private var _host: String = treasureBoat
    public var host: String {
        get {
            return self._host
        }
        set {
            self._host = newValue
        }
    }

    private var _path: String = version2
    public var path: String {
        get {
            return self._path
        }
        set {
            self._path = newValue
        }
    }

    private var _port: String = ""
    public var port: String {
        get {
            return self._port
        }
        set {
            self._port = newValue
        }
    }

    private var _method: ETBHTTPMethod = .post
    public var method: ETBHTTPMethod {
        get {
            return self._method
        }
        set {
            self._method = newValue
        }
    }

    private var _debug: Bool = false
    public var debug: Bool {
        get {
            return self._debug
        }
        set {
            self._debug = newValue
        }
    }
    
    //********************************************************************
    // Authentication
    //********************************************************************

    /* Connection to the TB Server */
    
    private var _treasureboatID = TBConstant.SharedID.SharedTreasureBoatID
    public var treasureboatID: String {
        get {
            return self._treasureboatID
        }
        set {
            if newValue.isEmpty {
                self._treasureboatID = TBConstant.SharedID.SharedTreasureBoatID
            } else {
                Log.info("set treasureboatID for request to \(newValue)")
                if UUID.isValid(newValue) {
                    self._treasureboatID = newValue
                } else {
                    self._treasureboatID = TBConstant.SharedID.SharedTreasureBoatID
                }
            }
        }
    }

    /* Connection to your setup Server */

    private var _personID: String = ""
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

    private var _domain: String = ""
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

    //********************************************************************
    // Rendering
    //********************************************************************

    private var _imageRender: String = ""
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

    private var _markDownRender: String = ""
    public var markDownRender: String {
        get {
            return self._markDownRender
        }
        set {
            if newValue.isEmpty {
                fatalError("invalid value for markDownRender")
            } else {
                self._markDownRender = newValue
            }
        }
    }
    
    //********************************************************************
    // Request Information
    //********************************************************************

    private var _dpk: String = ""
    
    
    /// Display Property Keys
    /// used for List, Inspect, Edit, Create ...
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

    private var _queryDescription: String = ""
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
    
    private var _sortDescription: String = ""
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

    private var _batch: String = "*"
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
    
    private var _searchValue: String = "*";
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

    //********************************************************************
    // POST : Create / Update(_id) / Custom...
    //********************************************************************

    private var _dataPostLocation: String = ""
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

    private var _dataPostDictionary: [String:Any] =  [:]
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
    
    //********************************************************************
    // Accesor Methods
    //********************************************************************

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

        postData["debug"] = debug

        if serviceCall {
            if !treasureboatID.isEmpty {
                postData["tbid"] = treasureboatID
            }
            
        } else {
            if !personID.isEmpty {
                postData["pid"] = personID
            }
            
            if !domain.isEmpty {
                postData["domain"] = domain
            }
        }
        
        if !dpk.isEmpty {
            postData["dpk"] = dpk
        }

        if !queryDescription.isEmpty {
            postData["queryDescription"] = queryDescription
        }

        if !sortDescription.isEmpty {
            postData["sortDescription"] = sortDescription
        }

        if !batch.isEmpty {
            postData["batch"] = batch
        }

        if !searchValue.isEmpty {
            postData["searchValue"] = searchValue
        }

        if !imageRender.isEmpty {
            postData["imageRender"] = imageRender
        }
        
        if !markDownRender.isEmpty {
            postData["markDownRender"] = markDownRender
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
    
    public func request() -> Request? {
            
        if host.isEmpty && fullUrl.isEmpty {
            errorMessage = "the HOST is empty."
            return nil
        }
        
        if path.isEmpty && fullUrl.isEmpty {
            errorMessage = "the PATH is empty."
            return nil
        }
            
        if !serviceCall {
            if personID.isEmpty {
                errorMessage = "the PERSON-ID is empty."
                return nil
            }
            if domain.isEmpty {
                errorMessage = "the DOMAIN is empty."
                return nil
            }
        }
            
        let bodyData = httpBody()
        if bodyData.isEmpty {
            errorMessage = "Invalid HTTPBody."
            return nil
        }
        
        if !fullUrl.isEmpty {
            return Request(url: fullUrl,
                           method: .post,
                           headers: httpHeader(),
                           body: HTTPBody(data: bodyData))
        }
        
        if port.isEmpty {
            return Request(scheme: schema.magicUiScheme,
                           host: host,
                           path: path,
                           method: method.magicUiHTTPMethod,
                           headers: httpHeader(),
                           body: HTTPBody(data: bodyData))
        }
        
        return Request(scheme: schema.magicUiScheme,
                       host: host,
                       path: path,
                       port: Int(port) ?? 80,
                       method: method.magicUiHTTPMethod,
                       headers: httpHeader(),
                       body: HTTPBody(data: bodyData))
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
