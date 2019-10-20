//
//  PlaceModel.swift
//  FoursquareDemo
//
//  Created by ibrahim doğan on 20.10.2019.
//  Copyright © 2019 ibrhmdn. All rights reserved.
//

import Foundation

// MARK: - Venues
class Venues: Codable {
    let meta: Meta?
    let response: VenuesResponse?

    init(meta: Meta?, response: VenuesResponse?) {
        self.meta = meta
        self.response = response
    }
}

// MARK: - Meta
class Meta: Codable {
    let code: Int?
    let requestID: String?

    enum CodingKeys: String, CodingKey {
        case code
        case requestID = "requestId"
    }

    init(code: Int?, requestID: String?) {
        self.code = code
        self.requestID = requestID
    }
}

// MARK: - Response
class VenuesResponse: Codable {
    let venues: [Venue]?
    let confident: Bool?
    let geocode: Geocode?

    init(venues: [Venue]?, confident: Bool?, geocode: Geocode?) {
        self.venues = venues
        self.confident = confident
        self.geocode = geocode
    }
}

// MARK: - Geocode
class Geocode: Codable {
    let what, geocodeWhere: String?
    let feature: Feature?
    let parents: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case what
        case geocodeWhere = "where"
        case feature, parents
    }

    init(what: String?, geocodeWhere: String?, feature: Feature?, parents: [JSONAny]?) {
        self.what = what
        self.geocodeWhere = geocodeWhere
        self.feature = feature
        self.parents = parents
    }
}

// MARK: - Feature
class Feature: Codable {
    let cc: String?
    let name: String?
    let displayName, matchedName, highlightedName: String?
    let woeType: Int?
    let slug, id, longID: String?
    let geometry: Geometry?

    enum CodingKeys: String, CodingKey {
        case cc, name, displayName, matchedName, highlightedName, woeType, slug, id
        case longID = "longId"
        case geometry
    }

    init(cc: String?, name: String?, displayName: String?, matchedName: String?, highlightedName: String?, woeType: Int?, slug: String?, id: String?, longID: String?, geometry: Geometry?) {
        self.cc = cc
        self.name = name
        self.displayName = displayName
        self.matchedName = matchedName
        self.highlightedName = highlightedName
        self.woeType = woeType
        self.slug = slug
        self.id = id
        self.longID = longID
        self.geometry = geometry
    }
}

// MARK: - Geometry
class Geometry: Codable {
    let center: Center?
    let bounds: Bounds?

    init(center: Center?, bounds: Bounds?) {
        self.center = center
        self.bounds = bounds
    }
}

// MARK: - Bounds
class Bounds: Codable {
    let ne, sw: Center?

    init(ne: Center?, sw: Center?) {
        self.ne = ne
        self.sw = sw
    }
}

// MARK: - Center
class Center: Codable {
    let lat, lng: Double?

    init(lat: Double?, lng: Double?) {
        self.lat = lat
        self.lng = lng
    }
}

// MARK: - Venue
class Venue: Codable {
    let id, name: String?
    let location: Location?
    let categories: [Category]?
    let referralID: String?
    let hasPerk: Bool?
    let venuePage: VenuePage?

    enum CodingKeys: String, CodingKey {
        case id, name, location, categories
        case referralID = "referralId"
        case hasPerk, venuePage
    }

    init(id: String?, name: String?, location: Location?, categories: [Category]?, referralID: String?, hasPerk: Bool?, venuePage: VenuePage?) {
        self.id = id
        self.name = name
        self.location = location
        self.categories = categories
        self.referralID = referralID
        self.hasPerk = hasPerk
        self.venuePage = venuePage
    }
}

// MARK: - Category
class Category: Codable {
    let id, name, pluralName, shortName: String?
    let icon: Icon?
    let primary: Bool?

    init(id: String?, name: String?, pluralName: String?, shortName: String?, icon: Icon?, primary: Bool?) {
        self.id = id
        self.name = name
        self.pluralName = pluralName
        self.shortName = shortName
        self.icon = icon
        self.primary = primary
    }
}

// MARK: - Icon
class Icon: Codable {
    let iconPrefix: String?
    let suffix: Suffix?

    enum CodingKeys: String, CodingKey {
        case iconPrefix = "prefix"
        case suffix
    }

    init(iconPrefix: String?, suffix: Suffix?) {
        self.iconPrefix = iconPrefix
        self.suffix = suffix
    }
}

enum Suffix: String, Codable {
    case png = ".png"
}

// MARK: - Location
class Location: Codable {
    let crossStreet: String?
    let lat, lng: Double?
    let labeledLatLngs: [LabeledLatLng]?
    let postalCode: String?
    let cc: String?
    let city: String?
    let state: String?
    let country: String?
    let formattedAddress: [String]?
    let address, neighborhood: String?

    init(crossStreet: String?, lat: Double?, lng: Double?, labeledLatLngs: [LabeledLatLng]?, postalCode: String?, cc: String?, city: String?, state: String?, country: String?, formattedAddress: [String]?, address: String?, neighborhood: String?) {
        self.crossStreet = crossStreet
        self.lat = lat
        self.lng = lng
        self.labeledLatLngs = labeledLatLngs
        self.postalCode = postalCode
        self.cc = cc
        self.city = city
        self.state = state
        self.country = country
        self.formattedAddress = formattedAddress
        self.address = address
        self.neighborhood = neighborhood
    }
}

// MARK: - LabeledLatLng
class LabeledLatLng: Codable {
    let label: String?
    let lat, lng: Double?

    init(label: String?, lat: Double?, lng: Double?) {
        self.label = label
        self.lat = lat
        self.lng = lng
    }
}

// MARK: - VenuePage
class VenuePage: Codable {
    let id: String?

    init(id: String?) {
        self.id = id
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
