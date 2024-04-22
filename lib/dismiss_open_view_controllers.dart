import 'dismiss_open_view_controllers_platform_interface.dart';

class DismissOpenViewControllers {
  Future<void> dismiss({required bool isAnimated}) {
    return DismissOpenViewControllersPlatform.instance
        .dismiss(isAnimated: isAnimated);
  }
}
