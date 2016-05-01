# iTunesSearchAPI
[![CI Status](http://img.shields.io/travis/svenbacia/iTunesSearchAPI.svg?style=flat)](https://travis-ci.org/svenbacia/iTunesSearchAPI)
[![codecov](https://codecov.io/gh/svenbacia/iTunesSearchAPI/branch/master/graph/badge.svg)](https://codecov.io/gh/svenbacia/iTunesSearchAPI)
[![Version](https://img.shields.io/cocoapods/v/iTunesSearchAPI.svg?style=flat)](http://cocoapods.org/pods/iTunesSearchAPI)
[![License](https://img.shields.io/cocoapods/l/iTunesSearchAPI.svg?style=flat)](http://cocoapods.org/pods/iTunesSearchAPI)
[![Platform](https://img.shields.io/cocoapods/p/iTunesSearchAPI.svg?style=flat)](http://cocoapods.org/pods/iTunesSearchAPI)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

> Simple wrapper for the iTunes Search API written in Swift.

## Usage

### Basic Request

```Swift
// iTunesSearchAPI has a singleton instance `defaultSearch`
let search = iTunesSearchAPI.defaultSearch

// for the most basic search you only have to provide a search term and a completion handler
search.searchFor("Castle") { json, error in
  // handle json and/or error
}
```

### Specified Media Type

```Swift
// When you are looking for something specific you can add a specific media type
search.searchFor("Castle", ofType: .TVShow(Entity.TVSeason)) { json, error in
  // handle json and/or error
}
```

Each `Media` type can take an additional parameter of type `Entity`. This entity parameter specifies the return type. When you take a look a the example above where we searched for `Castle` of type `TVShow` but we were only interesed in the `TVSeason` results.

## Requirements

* Swift 2.2
* iOS 8.4
* watchOS 2
* tvOS 9.0
* OSX 10.10

## Installation

### Cocoapods
AddButton is available through [CocoaPods](cocoapods.org). To install it, simply add the following line to your Podfile:

```Ruby
pod "iTunesSearchAPI"
```

### Carthage
```
github "svenbacia/iTunesSearchAPI"
```

### Manually
You can also add the specific target manually to your project.

## Author
Created and maintained by [@svenbacia](https://twitter.com/svenbacia)

## License
AddButton is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
