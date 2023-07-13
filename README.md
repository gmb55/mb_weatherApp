# WeatherApp

WeatherApp is a simple iOS application that allows users to view current weather information and forecasts for different cities. The app uses the OpenWeatherMap API to fetch weather data.

## Installation

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the project on the iOS simulator or a physical device.

## Usage

Upon launching the app, you will see the home screen where you can enter your API key.

After successfully retrieving the city data, you will be redirected to the cities list screen. Here, you can search for cities using the search bar at the top. The list will display matching cities as you type. You can select a city from the list to view detailed weather information.

On the city details screen, you will see the current weather conditions and a forecast. You can go back to the cities list screen by tapping the back button.

## API Key

To use the WeatherApp, you need to obtain an API key from OpenWeatherMap. Follow these steps to obtain an API key:

1. Go to the OpenWeatherMap website: [https://openweathermap.org/](https://openweathermap.org/).
2. Create an account or log in to your existing account.
3. Navigate to the API Keys section in your account dashboard.
4. Generate a new API key by providing a name and selecting the appropriate plan.
5. Copy the generated API key.

## Compatibility

- The app is compatible with iOS devices running iOS 11.0 and above.
- The app is optimized for both portrait and landscape orientations.

### Architecture: MVVM (Model-View-ViewModel)
MVVM is used as the architectural pattern for the app. It helps to separate concerns and improves testability and maintainability. 

### Technology Stack
The following technologies and frameworks are used in the development of WeatherApp:

* Swift: The programming language used for app development.

* UIKit: The user interface framework for building iOS apps.

* SnapKit: A popular Swift library for creating Auto Layout constraints programmatically.

* Moya: A networking library that provides a convenient and type-safe way to interact with network APIs.

* RxSwift/RxCocoa: A reactive programming framework that enables asynchronous and event-driven programming using observable sequences.

* Coordinator: A navigation pattern that separates the navigation logic from the view controllers. Coordinators are responsible for managing the flow between different screens and handling the navigation stack.

## Testing

WeatherApp includes unit tests to ensure the correctness of the ViewModel logic. The unit tests are implemented using XCTest, the built-in testing framework in Xcode. The `CitiesListViewModelTests` class contains tests for the `DefaultCitiesListViewModel` class.

## TODO

While the current version of the Weather App provides basic functionality, there are several areas that can be improved to enhance the user experience and make the application more robust. Here are some planned future improvements:

1. Refactoring the Search Bar: The current implementation of the search bar can be refactored to improve code organization and reusability.

2. Adding Headers to Table Views: To provide additional information or context to the user.

3. Implementing Empty State Representation: When a user's search query returns no results, it is important to provide feedback and guidance.

4. Enhancing Test Coverage.

5. Improving UI/UX.

6. Add the option to log out.