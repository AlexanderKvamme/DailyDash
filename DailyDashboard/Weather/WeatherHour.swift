import Foundation

final class Rnd {
    static let airTemperature =  Double.random(in: -40...40)
    static let windspeed = Double.random(in: -20...20)
    static let relativeHumidity = Double.random(in: -20...20)
    static let symbolCode = "fair_night"
}

struct Summary: Codable {
    var symbolCode: String?
}

extension Summary {
    static let dummy = Summary(symbolCode: Rnd.symbolCode)
    static let dummyZero = Summary(symbolCode: "partlycloudy_day")
}

struct Details: Codable {
    var airPressureAtSeaLevel: Double?
    var airTemperature: Double?
    var cloudAreaFraction: Double?
    var relativeHumidity: Double?
    var windFromDirection: Double?
    var windSpeed: Double?
}

extension Details {
    static let dummy = Details(airPressureAtSeaLevel: Double.random(in: 0...10), airTemperature: Double.random(in: 0...10), cloudAreaFraction: Double.random(in: 0...10), relativeHumidity: Double.random(in: 0...10), windFromDirection: Double.random(in: 0...10), windSpeed: Double.random(in: 0...10))
    static let dummyZero = Details(airPressureAtSeaLevel: 0, airTemperature: 0, cloudAreaFraction: 0, relativeHumidity: 0, windFromDirection: 0, windSpeed: 0)
}

struct WeatherData: Codable {
    var instant: Instant
    var next1Hours: Next1Hour?
    var next6Hours: Next6Hour?
    var next12Hours: Next12Hour?
}

struct Instant: Codable {
    var details: Details
}

extension Instant {
    static var dummy = Instant(details: Details.dummy)
    static var dummyZero = Instant(details: Details.dummyZero)
}

struct Next1Hour: Codable {
    var summary: Summary?
}

extension Next1Hour {
    static let dummy = Next1Hour(summary: Summary.dummy)
    static let dummyZero = Next1Hour(summary: Summary.dummyZero)
}

struct Next6Hour: Codable {
    var summary: Summary?
}

extension Next6Hour {
    static let dummy = Next6Hour(summary: Summary.dummy)
    static let dummyZero = Next6Hour(summary: Summary.dummyZero)
}

struct Next12Hour: Codable {
    var summary: Summary?
}

extension Next12Hour {
    static let dummy = Next12Hour(summary: Summary.dummy)
    static let dummyZero = Next12Hour(summary: Summary.dummyZero)
}

extension WeatherData {
    static let dummy = WeatherData(instant: Instant.dummy,
                                   next1Hours: Next1Hour.dummy,
                                   next6Hours: Next6Hour.dummy,
                                   next12Hours: Next12Hour.dummy)
    static let dummyZero = WeatherData(instant: Instant.dummyZero,
                                       next1Hours: Next1Hour.dummyZero,
                                       next6Hours: Next6Hour.dummyZero,
                                       next12Hours: Next12Hour.dummyZero)
}

struct TimeseriesEntity: Codable {
    var time: String
    var data: WeatherData
}

struct Properties: Codable {
    var meta: Meta
    var timeseries: [TimeseriesEntity]
}

extension Properties {
    static let dummy = Properties(meta: Meta.dummy, timeseries: [TimeseriesEntity].dummy)
    static let dummyZero = Properties(meta: Meta.dummyZero, timeseries: [TimeseriesEntity].dummyZero)
}

extension Array where Element == TimeseriesEntity {
    static let dummy = [TimeseriesEntity(time: "2020-10-18T12:00:00Z", data: WeatherData.dummy)]
    static let dummyZero = [TimeseriesEntity(time: "2020-10-18T12:00:00Z", data: WeatherData.dummyZero)]
}

struct Meta: Codable {
//    var updatedAt: Date
    var units: Unit
}

extension Meta {
    static var dummy = Meta(units: Unit.dummy)
    static var dummyZero = Meta(units: Unit.dummyZero)
}

struct Unit: Codable {
    var precipitationAmount: String
    var airPressureAtSeaLevel: String
    var airTemperature: String
    var cloudAreaFraction: String
    var relativeHumidity: String
    var windFromDirection: String
    var windSpeed: String
}

extension Unit {
    static var dummy = Unit(precipitationAmount: "test", airPressureAtSeaLevel: "test", airTemperature: "test", cloudAreaFraction: "test", relativeHumidity: "test", windFromDirection: "test", windSpeed: "test")
    static var dummyZero = Unit(precipitationAmount: "test", airPressureAtSeaLevel: "test", airTemperature: "test", cloudAreaFraction: "test", relativeHumidity: "test", windFromDirection: "test", windSpeed: "test")
}

struct YrCompactResponse: Codable {
    // var geometry
    var properties: Properties
}

extension YrCompactResponse {
    static let dummy = YrCompactResponse(properties: Properties.dummy)
    static let dummyZero = YrCompactResponse(properties: Properties.dummyZero)
}
