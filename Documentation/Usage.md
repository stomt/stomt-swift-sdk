#  Usage

## Import
```swift
import Stomt
```

## Widgets
A Widget consists of an instance of SFSafariViewController that gets presented by one of your ViewControllers.
Widgets are the easiest way to incorporate *stomt creation and feed retrieval functionalities* in your app.
They __do not__ require an Application ID and can be presented from any ViewController.

### Stomt Creation
The STOMT creation Widget can be invoked like this:
`Stomt.creationWidget(withTargetID: "stomt", fromViewController: self)`

- __The targetID parameter is required__. If the target doesn't exist, the Widget will be presented in a inconsistent state.

### Feed Retrieval
The feed retrieval Widget can be invoked like this:
`Stomt.feedWidget(withTargetID: "stomt", fromViewController: self)`

- __The targetID parameter is required__. If the target doesn't exist, the Widget will be presented in a inconsistent state.
