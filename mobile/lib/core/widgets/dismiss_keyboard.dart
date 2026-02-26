import 'package:flutter/material.dart';

class DismissKeyboard extends StatelessWidget {
  final Widget child;
  final bool enableBackDismiss;

  const DismissKeyboard({
    super.key,
    required this.child,
    this.enableBackDismiss = true,
  });

  bool _isKeyboardOpen() {
    return FocusManager.instance.primaryFocus?.hasFocus ?? false;
  }

  void _dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _dismissKeyboard,
      child: child,
    );

    if (!enableBackDismiss) return content;

    return PopScope(
      canPop: !_isKeyboardOpen(), // ✅ allow pop only if keyboard closed
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _isKeyboardOpen()) {
          _dismissKeyboard(); // ✅ close keyboard instead of popping
        }
      },
      child: content,
    );
  }
}
