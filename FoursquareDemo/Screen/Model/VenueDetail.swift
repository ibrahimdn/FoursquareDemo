//
//  VenueDetail.swift
//  FoursquareDemo
//
//  Created by ibrahim doğan on 20.10.2019.
//  Copyright © 2019 ibrhmdn. All rights reserved.
//

import Foundation

// MARK: - VenueDetail
class VenueDetail: Codable {
    let meta: VenueDetailMeta?
    let response: VenueDetailResponse?

    init(meta: VenueDetailMeta?, response: VenueDetailResponse?) {
        self.meta = meta
        self.response = response
    }
}

// MARK: - Meta
class VenueDetailMeta: Codable {
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
class VenueDetailResponse: Codable {
    let venue: VenueDetailVenue?

    init(venue: VenueDetailVenue?) {
        self.venue = venue
    }
}

// MARK: - Venue
class VenueDetailVenue: Codable {
    let id, name: String?
    let contact: Contact?
    let location: Location?
    let canonicalURL: String?
    let categories: [VenueDetailCategory]?
    let verified: Bool?
    let stats: Stats?
    let price: Price?
    let likes: HereNow?
    let dislike, ok: Bool?
    let rating: Double?
    let ratingColor: String?
    let ratingSignals: Int?
    let allowMenuURLEdit: Bool?
    let beenHere: BeenHere?
    let specials: Inbox?
    let photos: HereNow?
    let reasons: Inbox?
    let hereNow: HereNow?
    let createdAt: Int?
    let tips: Listed?
    let shortURL: String?
    let timeZone: String?
    let listed: Listed?
    let popular: Popular?
    let pageUpdates, inbox: Inbox?
    let attributes: Attributes?
    let bestPhoto: BestPhoto?

    enum CodingKeys: String, CodingKey {
        case id, name, contact, location
        case canonicalURL = "canonicalUrl"
        case categories, verified, stats, price, likes, dislike, ok, rating, ratingColor, ratingSignals
        case allowMenuURLEdit = "allowMenuUrlEdit"
        case beenHere, specials, photos, reasons, hereNow, createdAt, tips
        case shortURL = "shortUrl"
        case timeZone, listed, popular, pageUpdates, inbox, attributes, bestPhoto
    }

    init(id: String?, name: String?, contact: Contact?, location: Location?, canonicalURL: String?, categories: [VenueDetailCategory]?, verified: Bool?, stats: Stats?, price: Price?, likes: HereNow?, dislike: Bool?, ok: Bool?, rating: Double?, ratingColor: String?, ratingSignals: Int?, allowMenuURLEdit: Bool?, beenHere: BeenHere?, specials: Inbox?, photos: HereNow?, reasons: Inbox?, hereNow: HereNow?, createdAt: Int?, tips: Listed?, shortURL: String?, timeZone: String?, listed: Listed?, popular: Popular?, pageUpdates: Inbox?, inbox: Inbox?, attributes: Attributes?, bestPhoto: BestPhoto?) {
        self.id = id
        self.name = name
        self.contact = contact
        self.location = location
        self.canonicalURL = canonicalURL
        self.categories = categories
        self.verified = verified
        self.stats = stats
        self.price = price
        self.likes = likes
        self.dislike = dislike
        self.ok = ok
        self.rating = rating
        self.ratingColor = ratingColor
        self.ratingSignals = ratingSignals
        self.allowMenuURLEdit = allowMenuURLEdit
        self.beenHere = beenHere
        self.specials = specials
        self.photos = photos
        self.reasons = reasons
        self.hereNow = hereNow
        self.createdAt = createdAt
        self.tips = tips
        self.shortURL = shortURL
        self.timeZone = timeZone
        self.listed = listed
        self.popular = popular
        self.pageUpdates = pageUpdates
        self.inbox = inbox
        self.attributes = attributes
        self.bestPhoto = bestPhoto
    }
}

// MARK: - Attributes
class Attributes: Codable {
    let groups: [AttributesGroup]?

    init(groups: [AttributesGroup]?) {
        self.groups = groups
    }
}

// MARK: - AttributesGroup
class AttributesGroup: Codable {
    let type, name, summary: String?
    let count: Int?
    let items: [PurpleItem]?

    init(type: String?, name: String?, summary: String?, count: Int?, items: [PurpleItem]?) {
        self.type = type
        self.name = name
        self.summary = summary
        self.count = count
        self.items = items
    }
}

// MARK: - PurpleItem
class PurpleItem: Codable {
    let displayName, displayValue: String?
    let priceTier: Int?

    init(displayName: String?, displayValue: String?, priceTier: Int?) {
        self.displayName = displayName
        self.displayValue = displayValue
        self.priceTier = priceTier
    }
}

// MARK: - BeenHere
class BeenHere: Codable {
    let count, unconfirmedCount: Int?
    let marked: Bool?
    let lastCheckinExpiredAt: Int?

    init(count: Int?, unconfirmedCount: Int?, marked: Bool?, lastCheckinExpiredAt: Int?) {
        self.count = count
        self.unconfirmedCount = unconfirmedCount
        self.marked = marked
        self.lastCheckinExpiredAt = lastCheckinExpiredAt
    }
}

// MARK: - BestPhoto
class BestPhoto: Codable {
    let id: String?
    let createdAt: Int?
    let source: Source?
    let bestPhotoPrefix: String?
    let suffix: String?
    let width, height: Int?
    let visibility: String?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case id, createdAt, source
        case bestPhotoPrefix = "prefix"
        case suffix, width, height, visibility, user
    }

    init(id: String?, createdAt: Int?, source: Source?, bestPhotoPrefix: String?, suffix: String?, width: Int?, height: Int?, visibility: String?, user: User?) {
        self.id = id
        self.createdAt = createdAt
        self.source = source
        self.bestPhotoPrefix = bestPhotoPrefix
        self.suffix = suffix
        self.width = width
        self.height = height
        self.visibility = visibility
        self.user = user
    }
}

// MARK: - Source
class Source: Codable {
    let name: String?
    let url: String?

    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}

// MARK: - User
class User: Codable {
    let id, firstName, lastName, gender: String?
    let photo: Photo?

    init(id: String?, firstName: String?, lastName: String?, gender: String?, photo: Photo?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.photo = photo
    }
}

// MARK: - Photo
class Photo: Codable {
    let photoPrefix: String?
    let suffix: String?

    enum CodingKeys: String, CodingKey {
        case photoPrefix = "prefix"
        case suffix
    }

    init(photoPrefix: String?, suffix: String?) {
        self.photoPrefix = photoPrefix
        self.suffix = suffix
    }
}

// MARK: - Category
class VenueDetailCategory: Codable {
    let id, name, pluralName, shortName: String?
    let icon: Photo?
    let primary: Bool?

    init(id: String?, name: String?, pluralName: String?, shortName: String?, icon: Photo?, primary: Bool?) {
        self.id = id
        self.name = name
        self.pluralName = pluralName
        self.shortName = shortName
        self.icon = icon
        self.primary = primary
    }
}

// MARK: - Contact
class Contact: Codable {

    init() {
    }
}

// MARK: - HereNow
class HereNow: Codable {
    let count: Int?
    let summary: String?
    let groups: [HereNowGroup]?

    init(count: Int?, summary: String?, groups: [HereNowGroup]?) {
        self.count = count
        self.summary = summary
        self.groups = groups
    }
}

// MARK: - HereNowGroup
class HereNowGroup: Codable {
    let type: String?
    let count: Int?
    let items: [FluffyItem]?
    let name: String?

    init(type: String?, count: Int?, items: [FluffyItem]?, name: String?) {
        self.type = type
        self.count = count
        self.items = items
        self.name = name
    }
}

// MARK: - FluffyItem
class FluffyItem: Codable {
    let id: String?
    let createdAt: Int?
    let source: Source?
    let itemPrefix: String?
    let suffix: String?
    let width, height: Int?
    let user: User?
    let visibility, text, type: String?
    let canonicalURL: String?
    let likes: Listed?
    let logView: Bool?
    let agreeCount, disagreeCount: Int?
    let todo: Todo?

    enum CodingKeys: String, CodingKey {
        case id, createdAt, source
        case itemPrefix = "prefix"
        case suffix, width, height, user, visibility, text, type
        case canonicalURL = "canonicalUrl"
        case likes, logView, agreeCount, disagreeCount, todo
    }

    init(id: String?, createdAt: Int?, source: Source?, itemPrefix: String?, suffix: String?, width: Int?, height: Int?, user: User?, visibility: String?, text: String?, type: String?, canonicalURL: String?, likes: Listed?, logView: Bool?, agreeCount: Int?, disagreeCount: Int?, todo: Todo?) {
        self.id = id
        self.createdAt = createdAt
        self.source = source
        self.itemPrefix = itemPrefix
        self.suffix = suffix
        self.width = width
        self.height = height
        self.user = user
        self.visibility = visibility
        self.text = text
        self.type = type
        self.canonicalURL = canonicalURL
        self.likes = likes
        self.logView = logView
        self.agreeCount = agreeCount
        self.disagreeCount = disagreeCount
        self.todo = todo
    }
}

// MARK: - TentacledItem
class TentacledItem: Codable {
    let id: String?
    let createdAt: Int?
    let text, type: String?
    let canonicalURL: String?
    let likes: Listed?
    let logView: Bool?
    let agreeCount, disagreeCount: Int?
    let todo: Todo?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case id, createdAt, text, type
        case canonicalURL = "canonicalUrl"
        case likes, logView, agreeCount, disagreeCount, todo, user
    }

    init(id: String?, createdAt: Int?, text: String?, type: String?, canonicalURL: String?, likes: Listed?, logView: Bool?, agreeCount: Int?, disagreeCount: Int?, todo: Todo?, user: User?) {
        self.id = id
        self.createdAt = createdAt
        self.text = text
        self.type = type
        self.canonicalURL = canonicalURL
        self.likes = likes
        self.logView = logView
        self.agreeCount = agreeCount
        self.disagreeCount = disagreeCount
        self.todo = todo
        self.user = user
    }
}

// MARK: - ListedGroup
class ListedGroup: Codable {
    let type, name: String?
    let count: Int?
    let items: [TentacledItem]?

    init(type: String?, name: String?, count: Int?, items: [TentacledItem]?) {
        self.type = type
        self.name = name
        self.count = count
        self.items = items
    }
}

// MARK: - Listed
class Listed: Codable {
    let count: Int?
    let groups: [ListedGroup]?

    init(count: Int?, groups: [ListedGroup]?) {
        self.count = count
        self.groups = groups
    }
}

// MARK: - Todo
class Todo: Codable {
    let count: Int?

    init(count: Int?) {
        self.count = count
    }
}

// MARK: - Inbox
class Inbox: Codable {
    let count: Int?
    let items: [JSONAny]?

    init(count: Int?, items: [JSONAny]?) {
        self.count = count
        self.items = items
    }
}

// MARK: - Location
class VenueDetailLocation: Codable {
    let address: String?
    let lat, lng: Double?
    let labeledLatLngs: [VenueDetailLabeledLatLng]?
    let cc, city, state, country: String?
    let formattedAddress: [String]?

    init(address: String?, lat: Double?, lng: Double?, labeledLatLngs: [VenueDetailLabeledLatLng]?, cc: String?, city: String?, state: String?, country: String?, formattedAddress: [String]?) {
        self.address = address
        self.lat = lat
        self.lng = lng
        self.labeledLatLngs = labeledLatLngs
        self.cc = cc
        self.city = city
        self.state = state
        self.country = country
        self.formattedAddress = formattedAddress
    }
}

// MARK: - LabeledLatLng
class VenueDetailLabeledLatLng: Codable {
    let label: String?
    let lat, lng: Double?

    init(label: String?, lat: Double?, lng: Double?) {
        self.label = label
        self.lat = lat
        self.lng = lng
    }
}

// MARK: - Popular
class Popular: Codable {
    let status: String?
    let richStatus: RichStatus?
    let isOpen, isLocalHoliday: Bool?
    let timeframes: [Timeframe]?

    init(status: String?, richStatus: RichStatus?, isOpen: Bool?, isLocalHoliday: Bool?, timeframes: [Timeframe]?) {
        self.status = status
        self.richStatus = richStatus
        self.isOpen = isOpen
        self.isLocalHoliday = isLocalHoliday
        self.timeframes = timeframes
    }
}

// MARK: - RichStatus
class RichStatus: Codable {
    let entities: [JSONAny]?
    let text: String?

    init(entities: [JSONAny]?, text: String?) {
        self.entities = entities
        self.text = text
    }
}

// MARK: - Timeframe
class Timeframe: Codable {
    let days: String?
    let includesToday: Bool?
    let timeframeOpen: [Open]?
    let segments: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case days, includesToday
        case timeframeOpen = "open"
        case segments
    }

    init(days: String?, includesToday: Bool?, timeframeOpen: [Open]?, segments: [JSONAny]?) {
        self.days = days
        self.includesToday = includesToday
        self.timeframeOpen = timeframeOpen
        self.segments = segments
    }
}

// MARK: - Open
class Open: Codable {
    let renderedTime: String?

    init(renderedTime: String?) {
        self.renderedTime = renderedTime
    }
}

// MARK: - Price
class Price: Codable {
    let tier: Int?
    let message, currency: String?

    init(tier: Int?, message: String?, currency: String?) {
        self.tier = tier
        self.message = message
        self.currency = currency
    }
}

// MARK: - Stats
class Stats: Codable {
    let tipCount: Int?

    init(tipCount: Int?) {
        self.tipCount = tipCount
    }
}
