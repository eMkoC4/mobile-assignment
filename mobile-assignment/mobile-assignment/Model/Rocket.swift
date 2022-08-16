//
//  SpaceX.swift
//  mobile-assignment
//
//  Created by IvanQ on 19.06.2022.
//

import Foundation

// MARK: - SpaceXElement
struct Rocket: Decodable {
    
    //var id: String
    var active: Bool
    var stages, boosters, costPerLaunch, successRatePct: Int
    var firstFlight, country, company: String
    var height, diameter: Diameter
    var mass: Mass
    var payloadWeights: [PayloadWeight]
    var firstStage: FirstStage
    var secondStage: SecondStage
    var engines: Engines
    var landingLegs: LandingLegs
    var flickrImages: [String]
    var wikipedia: String
    var rocketID: String
    var description, rocketName, rocketType: String

    enum CodingKeys: String, CodingKey {
        //case id = "rocket_id"
        case active, stages, boosters
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country, company, height, diameter, mass
        case payloadWeights = "payload_weights"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case landingLegs = "landing_legs"
        case flickrImages = "flickr_images"
        case wikipedia
        case description
        case rocketID = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
    }
}

extension Rocket: Identifiable {
    var id: String { return rocketID }
}

// MARK: - Diameter
struct Diameter: Codable {
    var meters, feet: Double?
}

// MARK: - Engines
struct Engines: Codable {
    var number: Int
    var type, version: String
    var layout: String?
    var isp: ISP
    var engineLossMax: Int?
    var propellant1, propellant2: String
    var thrustSeaLevel, thrustVacuum: Thrust
    var thrustToWeight: Double

    enum CodingKeys: String, CodingKey {
        case number, type, version, layout, isp
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case thrustToWeight = "thrust_to_weight"
    }
}

// MARK: - ISP
struct ISP: Codable {
    var seaLevel, vacuum: Int

    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
}

// MARK: - Thrust
struct Thrust: Codable {
    var kN, lbf: Int
}

// MARK: - FirstStage
struct FirstStage: Codable {
    var reusable: Bool
    var engines: Int
    var fuelAmountTons: Double
    var burnTimeSEC: Int?
    var thrustSeaLevel, thrustVacuum: Thrust
    var cores: Int?

    enum CodingKeys: String, CodingKey {
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case cores
    }
}

// MARK: - LandingLegs
struct LandingLegs: Codable {
    var number: Int
    var material: String?
}

// MARK: - Mass
struct Mass: Codable {
    var kg, lb: Int
}

// MARK: - PayloadWeight
struct PayloadWeight: Codable {
    var id, name: String
    var kg, lb: Int
}

// MARK: - SecondStage
struct SecondStage: Codable {
    var reusable: Bool
    var engines: Int
    var fuelAmountTons: Double
    var burnTimeSEC: Int?
    var thrust: Thrust
    var payloads: Payloads

    enum CodingKeys: String, CodingKey {
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
        case thrust, payloads
    }
}

// MARK: - Payloads
struct Payloads: Codable {
    var option1: String
    var compositeFairing: CompositeFairing
    var option2: String?

    enum CodingKeys: String, CodingKey {
        case option1 = "option_1"
        case compositeFairing = "composite_fairing"
        case option2 = "option_2"
    }
}

// MARK: - CompositeFairing
struct CompositeFairing: Codable {
    var height, diameter: Diameter
}

typealias Rockets = [Rocket]
