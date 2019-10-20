//
//  Network.swift
//  FoursquareDemo
//
//  Created by ibrahim doğan on 20.10.2019.
//  Copyright © 2019 ibrhmdn. All rights reserved.
//

import Foundation
import Moya

let clientID = "3N3TNQR15MJZX4C0JVOJ4POE5VPPLKXZHGCR4KHSZKAZMJS5"
let clientSecret = "0CAC4BN5AG3WH3GUFTQLTDV3DIIYR15OJGNO4Z5I2YSRUIAE"

public enum VenuesNetwork {
    case getVenues(city: String)
    case getVenuesDetail(venuesId: String)
}

extension VenuesNetwork: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://api.foursquare.com/v2/venues/")!
    }
    
    public var path: String {
        switch self {
        case .getVenues: return "search"
        case .getVenuesDetail(let venuesId): return "\(venuesId)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getVenues:      return .get
        case .getVenuesDetail:  return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getVenues(let city):    return .requestParameters(parameters: ["near":city,
                                                                             "categoryId": "4d4b7105d754a06374d81259",
                                                                             "client_id":clientID,
                                                                             "client_secret":clientSecret,
                                                                             "v":"20193112",
                                                                             "limit":"10",
                                                                             "offset":"1"], encoding: URLEncoding.default)
            
        case .getVenuesDetail:      return .requestParameters(parameters: ["client_id":clientID,
                                                                            "client_secret":clientSecret,
                                                                            "v":"20193112"], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return [:]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
