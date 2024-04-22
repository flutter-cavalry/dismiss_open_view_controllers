import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dismiss_open_view_controllers_platform_interface.dart';

/// An implementation of [DismissOpenViewControllersPlatform] that uses method channels.
class MethodChannelDismissOpenViewControllers
    extends DismissOpenViewControllersPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dismiss_open_view_controllers');

  @override
  Future<void> dismiss({required bool isAnimated}) async {
    await methodChannel
        .invokeMethod<void>('dismiss', {'isAnimated': isAnimated});
  }
}
