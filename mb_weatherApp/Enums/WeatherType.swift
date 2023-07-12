//
//  WeatherType.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 12/07/2023.
//

import UIKit

enum WeatherType: String {
    case clearSky = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case drizzle = "Drizzle"
    case thunderstorm = "Thunderstorm"
    case snow = "Snow"
    case mist = "Mist"
    case smoke = "Smoke"
    case haze = "Haze"
    case dust = "Dust"
    case sand = "Sand"
    case fog = "Fog"
    case squall = "Squall"
    case tornado = "Tornado"
    
    var description: String? {
        switch self {
        case .clearSky:
            return R.string.localizable.clearSky()
        case .clouds:
            return R.string.localizable.clouds()
        case .rain:
            return R.string.localizable.rain()
        case .drizzle:
            return R.string.localizable.drizzle()
        case .thunderstorm:
            return R.string.localizable.thunderstorm()
        case .snow:
            return R.string.localizable.snow()
        case .mist:
            return R.string.localizable.mist()
        case .smoke:
            return R.string.localizable.smoke()
        case .haze:
            return R.string.localizable.haze()
        case .dust:
            return R.string.localizable.dust()
        case .sand:
            return R.string.localizable.sand()
        case .fog:
            return R.string.localizable.fog()
        case .squall:
            return R.string.localizable.squall()
        case .tornado:
            return R.string.localizable.tornado()
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .clearSky:
            return R.image.icSun()
        case .clouds:
            return R.image.icCloud()
        case .rain:
            return R.image.icRain()
        case .drizzle:
            return R.image.icDroplets()
        case .thunderstorm:
            return R.image.icThunder()
        case .snow:
            return R.image.icSnow()
        case .mist, .smoke, .fog, .haze:
            return R.image.icMist()
        case .dust, .sand:
            return R.image.icDust()
        case .squall:
            return R.image.icWind()
        case .tornado:
            return R.image.icHurricane()
        }
    }
}
