//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources
import UIKit

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle
  var string: string { .init(bundle: bundle, preferredLanguages: nil, locale: nil) }
  var color: color { .init(bundle: bundle) }
  var image: image { .init(bundle: bundle) }
  var info: info { .init(bundle: bundle) }
  var file: file { .init(bundle: bundle) }
  var storyboard: storyboard { .init(bundle: bundle) }

  func string(bundle: Foundation.Bundle) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: nil)
  }
  func string(locale: Foundation.Locale) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: locale)
  }
  func string(preferredLanguages: [String], locale: Locale? = nil) -> string {
    .init(bundle: bundle, preferredLanguages: preferredLanguages, locale: locale)
  }
  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func image(bundle: Foundation.Bundle) -> image {
    .init(bundle: bundle)
  }
  func info(bundle: Foundation.Bundle) -> info {
    .init(bundle: bundle)
  }
  func file(bundle: Foundation.Bundle) -> file {
    .init(bundle: bundle)
  }
  func storyboard(bundle: Foundation.Bundle) -> storyboard {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.storyboard.validate()
  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    let bundle: Foundation.Bundle
    let preferredLanguages: [String]?
    let locale: Locale?
    var localizable: localizable { .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale)) }

    func localizable(preferredLanguages: [String]) -> localizable {
      .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale))
    }


    /// This `_R.string.localizable` struct is generated, and contains static references to 13 localization keys.
    struct localizable {
      let source: RswiftResources.StringResource.Source

      /// en translation: API Key
      ///
      /// Key: api.key
      ///
      /// Locales: en
      var apiKey: RswiftResources.StringResource { .init(key: "api.key", tableName: "Localizable", source: source, developmentValue: "API Key", comment: nil) }

      /// en translation: WeatherApp
      ///
      /// Key: app.name
      ///
      /// Locales: en
      var appName: RswiftResources.StringResource { .init(key: "app.name", tableName: "Localizable", source: source, developmentValue: "WeatherApp", comment: nil) }

      /// en translation: We're having trouble processing your request. Try again.
      ///
      /// Key: bad.request.error.message
      ///
      /// Locales: en
      var badRequestErrorMessage: RswiftResources.StringResource { .init(key: "bad.request.error.message", tableName: "Localizable", source: source, developmentValue: "We're having trouble processing your request. Try again.", comment: nil) }

      /// en translation: City name
      ///
      /// Key: cityName
      ///
      /// Locales: en
      var cityName: RswiftResources.StringResource { .init(key: "cityName", tableName: "Localizable", source: source, developmentValue: "City name", comment: nil) }

      /// en translation: Continue
      ///
      /// Key: continue
      ///
      /// Locales: en
      var `continue`: RswiftResources.StringResource { .init(key: "continue", tableName: "Localizable", source: source, developmentValue: "Continue", comment: nil) }

      /// en translation: Error
      ///
      /// Key: error
      ///
      /// Locales: en
      var error: RswiftResources.StringResource { .init(key: "error", tableName: "Localizable", source: source, developmentValue: "Error", comment: nil) }

      /// en translation: Error reading cities from file.
      ///
      /// Key: errorCitiesFromFileMessage
      ///
      /// Locales: en
      var errorCitiesFromFileMessage: RswiftResources.StringResource { .init(key: "errorCitiesFromFileMessage", tableName: "Localizable", source: source, developmentValue: "Error reading cities from file.", comment: nil) }

      /// en translation: Cities file not found.
      ///
      /// Key: errorCitiesNoFileMessage
      ///
      /// Locales: en
      var errorCitiesNoFileMessage: RswiftResources.StringResource { .init(key: "errorCitiesNoFileMessage", tableName: "Localizable", source: source, developmentValue: "Cities file not found.", comment: nil) }

      /// en translation: Log In
      ///
      /// Key: log.in
      ///
      /// Locales: en
      var logIn: RswiftResources.StringResource { .init(key: "log.in", tableName: "Localizable", source: source, developmentValue: "Log In", comment: nil) }

      /// en translation: Ok
      ///
      /// Key: ok
      ///
      /// Locales: en
      var ok: RswiftResources.StringResource { .init(key: "ok", tableName: "Localizable", source: source, developmentValue: "Ok", comment: nil) }

      /// en translation: Recently searched
      ///
      /// Key: recentyleSearched
      ///
      /// Locales: en
      var recentyleSearched: RswiftResources.StringResource { .init(key: "recentyleSearched", tableName: "Localizable", source: source, developmentValue: "Recently searched", comment: nil) }

      /// en translation: Select a city:
      ///
      /// Key: selectCity
      ///
      /// Locales: en
      var selectCity: RswiftResources.StringResource { .init(key: "selectCity", tableName: "Localizable", source: source, developmentValue: "Select a city:", comment: nil) }

      /// en translation: Login failed. Check your API key.
      ///
      /// Key: unauthorized.error.message
      ///
      /// Locales: en
      var unauthorizedErrorMessage: RswiftResources.StringResource { .init(key: "unauthorized.error.message", tableName: "Localizable", source: source, developmentValue: "Login failed. Check your API key.", comment: nil) }
    }
  }

  /// This `_R.color` struct is generated, and contains static references to 5 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }

    /// Color `brightSun`.
    var brightSun: RswiftResources.ColorResource { .init(name: "brightSun", path: [], bundle: bundle) }

    /// Color `ebonyClay`.
    var ebonyClay: RswiftResources.ColorResource { .init(name: "ebonyClay", path: [], bundle: bundle) }

    /// Color `raven`.
    var raven: RswiftResources.ColorResource { .init(name: "raven", path: [], bundle: bundle) }

    /// Color `woodsmoke`.
    var woodsmoke: RswiftResources.ColorResource { .init(name: "woodsmoke", path: [], bundle: bundle) }
  }

  /// This `_R.image` struct is generated, and contains static references to 1 images.
  struct image {
    let bundle: Foundation.Bundle

    /// Image `icSearch`.
    var icSearch: RswiftResources.ImageResource { .init(name: "icSearch", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }
  }

  /// This `_R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    let bundle: Foundation.Bundle
    var uiApplicationSceneManifest: uiApplicationSceneManifest { .init(bundle: bundle) }

    func uiApplicationSceneManifest(bundle: Foundation.Bundle) -> uiApplicationSceneManifest {
      .init(bundle: bundle)
    }

    struct uiApplicationSceneManifest {
      let bundle: Foundation.Bundle

      let uiApplicationSupportsMultipleScenes: Bool = false

      var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest"], key: "_key") ?? "UIApplicationSceneManifest" }
      var uiSceneConfigurations: uiSceneConfigurations { .init(bundle: bundle) }

      func uiSceneConfigurations(bundle: Foundation.Bundle) -> uiSceneConfigurations {
        .init(bundle: bundle)
      }

      struct uiSceneConfigurations {
        let bundle: Foundation.Bundle
        var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations"], key: "_key") ?? "UISceneConfigurations" }
        var uiWindowSceneSessionRoleApplication: uiWindowSceneSessionRoleApplication { .init(bundle: bundle) }

        func uiWindowSceneSessionRoleApplication(bundle: Foundation.Bundle) -> uiWindowSceneSessionRoleApplication {
          .init(bundle: bundle)
        }

        struct uiWindowSceneSessionRoleApplication {
          let bundle: Foundation.Bundle
          var defaultConfiguration: defaultConfiguration { .init(bundle: bundle) }

          func defaultConfiguration(bundle: Foundation.Bundle) -> defaultConfiguration {
            .init(bundle: bundle)
          }

          struct defaultConfiguration {
            let bundle: Foundation.Bundle
            var uiSceneConfigurationName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneConfigurationName") ?? "Default Configuration" }
            var uiSceneDelegateClassName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate" }
            var uiSceneStoryboardFile: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneStoryboardFile") ?? "Main" }
          }
        }
      }
    }
  }

  /// This `_R.file` struct is generated, and contains static references to 1 resource files.
  struct file {
    let bundle: Foundation.Bundle

    /// Resource file `citiesList.json`.
    var citiesListJson: RswiftResources.FileResource { .init(name: "citiesList", pathExtension: "json", bundle: bundle, locale: LocaleReference.none) }
  }

  /// This `_R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    let bundle: Foundation.Bundle
    var launchScreen: launchScreen { .init(bundle: bundle) }
    var main: main { .init(bundle: bundle) }

    func launchScreen(bundle: Foundation.Bundle) -> launchScreen {
      .init(bundle: bundle)
    }
    func main(bundle: Foundation.Bundle) -> main {
      .init(bundle: bundle)
    }
    func validate() throws {
      try self.launchScreen.validate()
      try self.main.validate()
    }


    /// Storyboard `LaunchScreen`.
    struct launchScreen: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UIViewController

      let bundle: Foundation.Bundle

      let name = "LaunchScreen"
      func validate() throws {

      }
    }

    /// Storyboard `Main`.
    struct main: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = ViewController

      let bundle: Foundation.Bundle

      let name = "Main"
      func validate() throws {

      }
    }
  }
}