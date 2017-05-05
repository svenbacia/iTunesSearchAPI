# iTunesSearchAPI
[![CI Status](http://img.shields.io/travis/svenbacia/iTunesSearchAPI.svg?style=flat)](https://travis-ci.org/svenbacia/iTunesSearchAPI)
[![codecov](https://codecov.io/gh/svenbacia/iTunesSearchAPI/branch/master/graph/badge.svg)](https://codecov.io/gh/svenbacia/iTunesSearchAPI)
[![Version](https://img.shields.io/cocoapods/v/iTunesSearchAPI.svg?style=flat)](http://cocoapods.org/pods/iTunesSearchAPI)
[![License](https://img.shields.io/cocoapods/l/iTunesSearchAPI.svg?style=flat)](http://cocoapods.org/pods/iTunesSearchAPI)
[![Platform](https://img.shields.io/cocoapods/p/iTunesSearchAPI.svg?style=flat)](http://cocoapods.org/pods/iTunesSearchAPI)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

> Simple wrapper for the [iTunes Search API](https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api) written in Swift.

## Usage

### Basics
To be able to use the iTunes Search API wrapper you need an iTunes client.

```Swift
iTunes(session: URLSession = URLSession.shared, debug: Bool = false)
```
When `debug` is enabled, you get some information about the url which will be requested.

### Search
For the most basic search you only have to provide a search term and a completion handler. The result of the search will be passed as a Result containing either the successfully decoded JSON or a SearchError.

```Swift
itunes.search(for: "Castle") { result in
  // handle the Result<Any, SearchError>
}
```

### Specified Media Type
When you are looking for something specific you can add a specific media type.

```Swift
itunes.search(for: "Castle", ofType: .tvShow(.tvSeason)) { result in
  // handle the Result<Any, SearchError>
}
```
Each `Media` type can take an additional parameter of type `Entity`. This entity parameter specifies the return type. In the example above we are only looking for TV Seasons of the show *Castle*.

### Lookup
Similar to the search you can use the lookup function. The lookup function takes a `LookupType` and a completion handler.

```Swift
itunes.lookup(by: .id("12345")) { result in
  // handle the Result<Any, SearchError>
}
```

### Options
Both `search()` and `lookup()` can take an addtitional parameter of type `Option`. There you can specify information like *limit*, *language* or *country*.

## Requirements

* Swift 3.0
* iOS 8.4
* watchOS 2
* tvOS 9.0
* OSX 10.10

## Installation

### Carthage
```
github "svenbacia/iTunesSearchAPI"
```

### Cocoapods
iTunesSearchAPI is available through [CocoaPods](cocoapods.org). To install it, simply add the following line to your Podfile:

```Ruby
pod "iTunesSearchAPI"
```

### Manually
You can also add the specific target manually to your project.

## Author
Created and maintained by [@svenbacia](https://twitter.com/svenbacia)

## License
iTunesSearchAPI is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
