import 'dismiss_open_view_controllers_platform_interface.dart';

class DismissOpenViewControllers {
  Future<void> dismiss(
      {required bool isAnimated, bool? handlePHPickerViewController}) {
    return DismissOpenViewControllersPlatform.instance.dismiss(
        isAnimated: isAnimated,
        handlePHPickerViewController: handlePHPickerViewController);
  }
}
