# Stomt Swift SDK

![Stomt Logo](https://lh4.googleusercontent.com/3a2WHpedfLmXAiZDLfVzFzMKq_DtzP7wQFZhUygO4KCUBntHPbKmsnLLiAnIxDhAi43Ltk6wEWL2RNvTwFij=w2720-h1422-rw)

![platforms-badge](https://img.shields.io/badge/platform-iOS-lightgray.svg)

Our SDK provides you with the tools for an easy and transparent integration of STOMT in your apps.
This repository provides you with a target for all the Apple devices we are currently supporting.

- [Requirements](https://github.com/stomt/stomt-swift-sdk#requirements)
- [Installation](https://github.com/stomt/stomt-swift-sdk#installation)
- [Usage](https://github.com/stomt/stomt-swift-sdk/blob/master/Documentation/Usage.md)

## Requirements
- Swift 4
- iOS 10+

## Installation
### Cocoapods
Coming soon!

### Manually
If you prefer not to use dependency managers you can install the framework manually.

- __If you are not using github__ for your project, execute `git init`, otherwise skip this step.
- Add the SDK using git submodules `git submodule add https://github.com/stomt/stomt-swift-sdk`. A folder containing the SDK will be added to your project root folder.
- Open the downloaded SDK folder and drag  `StomtSDK.xcodeproj` __inside and below__ your project icon in the Xcode navigator.
- Click your project tab in the Xcode navigator and in `General`, scroll down and press `+` in `Embedded Binaries` to add `Stomt.framework` for the required platform.
- Build the framework from the target drop-down.
- Import following the instructions in the [Usage](https://github.com/stomt/stomt-swift-sdk/Documentation/Usage.md) section.

## FAQ



