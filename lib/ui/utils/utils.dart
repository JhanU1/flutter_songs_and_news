import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void togglePlatform() {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
  } else {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
  }

  // This rebuilds the application. This should obviously never be
  // done in a real app but it's done here since this app
  // unrealistically toggles the current platform for demonstration
  // purposes.
  WidgetsBinding.instance.reassembleApplication();
}
