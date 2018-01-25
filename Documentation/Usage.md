#  Usage

## Import
```swift
import Stomt
```

## Setup
To use the stomt SDK you must acquire an __applicationID__ from the "APPS" section of your project page ([stomt.com](https://stomt.com)) and set it in the AppDelegate.swift file as follows:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
Stomt.setAppID(appID: "APPLICATIONID")
return true
}
```

## Widgets
A Widget consists of an instance of SFSafariViewController that gets presented by one of your ViewControllers.
Widgets are the easiest way to incorporate *stomt creation and feed retrieval functionalities* in your app.

### Stomt Creation
The STOMT creation Widget can be invoked like this:

```swift
Stomt.creationWidget(fromViewController: self)
```

### Feed Retrieval
The feed retrieval Widget can be invoked like this:

```swift
Stomt.feedWidget(fromViewController: self)
```
