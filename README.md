# Stomt Swift SDK

![Stomt Logo](https://i.imgur.com/hlhvOCz.jpg)

![platforms-badge](https://img.shields.io/badge/platform-iOS-lightgray.svg)
[![Build Status](https://travis-ci.com/stomt/stomt-swift-sdk.svg?token=AP9YnfxJakP4i3i8dAPT&branch=master)](https://travis-ci.com/stomt/stomt-swift-sdk)

Our SDK provides you with the tools for an easy and transparent integration of STOMT in your apps.
This repository provides you with a target for all the Apple devices we are currently supporting.

- [Requirements](https://github.com/stomt/stomt-swift-sdk#requirements)
- [Installation](https://github.com/stomt/stomt-swift-sdk#installation)
- [Usage](https://github.com/stomt/stomt-swift-sdk/blob/master/Documentation/Usage.md)

## Requirements
- Swift 4
- iOS 10+

## Installation

### Carthage
Carthage is "A simple, decentralized dependency manager for Cocoa"

- Create a 'Cartfile' in your project root directory
- Copy the following in the Cartfile:  `github "stomt/stomt-swift-sdk" ~> 0.1`
- Run `carthage update` from the project root directory to fetch and build the SDK

At this point Carthage will have built the SDK and produced the *.framework* file to include in your project. Due to the [App Store submission bug](http://www.openradar.me/radar?id=6409498411401216), you should follow the installation instructions available [in the Carthage repository](https://github.com/Carthage/Carthage#getting-started).

### Cocoapods
Coming soon!

### Manually
If you prefer not to use dependency managers you can install the framework manually.

- __If you are not using github__ for your project, execute `git init`, otherwise skip this step.
- Add the SDK using git submodules `git submodule add https://github.com/stomt/stomt-swift-sdk`. A folder containing the SDK will be added to your project root folder.
- Open the downloaded SDK folder and drag  `StomtSDK.xcodeproj` __inside and below__ your project icon in the Xcode navigator.
- Click your project tab in the Xcode navigator and in `General`, scroll down and press `+` in `Embedded Binaries` to add `Stomt.framework` for the required platform.
- Build the framework from the target drop-down.
- Import following the instructions in the [Usage](https://github.com/stomt/stomt-swift-sdk/blob/master/Documentation/Usage.md) section.

## Widgets
A Widget consists of an instance of SFSafariViewController that gets presented by one of your ViewControllers.
Widgets are the easiest way to incorporate *stomt creation and feed retrieval functionalities* in your app.
They __do not__ require an Application ID and can be presented from any ViewController.

### Stomt Creation
The STOMT creation Widget can be invoked like this:

```swift
Stomt.creationWidget(withTargetID: "stomt", fromViewController: self)
```

- __The targetID parameter is required__. If the target doesn't exist, the Widget will be presented in a inconsistent state.

### Feed Retrieval
The feed retrieval Widget can be invoked like this:

```swift
Stomt.feedWidget(withTargetID: "stomt", fromViewController: self)
```

- __The targetID parameter is required__. If the target doesn't exist, the Widget will be presented in a inconsistent state.

## FAQ

### Is there an example project?
Definitely! You can find it in the "Examples" folder in the repo.


