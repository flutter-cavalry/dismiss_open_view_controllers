# dismiss_open_view_controllers

Dismiss all open view controllers on iOS.

## Usage

```dart
final dismissOpenViewControllersPlugin = DismissOpenViewControllers();
await dismissOpenViewControllersPlugin.dismiss(isAnimated: true);
```

## Options

- `handlePHPickerViewController` if top view controller is `PHPickerViewController`, this plugin will call `pickerViewController.delegate?.picker(pickerViewController, didFinishPicking: [])` before dismissing it.
