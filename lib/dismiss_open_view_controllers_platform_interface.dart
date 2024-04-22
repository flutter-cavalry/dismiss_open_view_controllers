import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dismiss_open_view_controllers_method_channel.dart';

abstract class DismissOpenViewControllersPlatform extends PlatformInterface {
  /// Constructs a DismissOpenViewControllersPlatform.
  DismissOpenViewControllersPlatform() : super(token: _token);

  static final Object _token = Object();

  static DismissOpenViewControllersPlatform _instance =
      MethodChannelDismissOpenViewControllers();

  /// The default instance of [DismissOpenViewControllersPlatform] to use.
  ///
  /// Defaults to [MethodChannelDismissOpenViewControllers].
  static DismissOpenViewControllersPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DismissOpenViewControllersPlatform] when
  /// they register themselves.
  static set instance(DismissOpenViewControllersPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> dismiss(
      {required bool isAnimated, bool? handlePHPickerViewController}) {
    throw UnimplementedError('dismiss() has not been implemented.');
  }
}
