import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactProvider = ChangeNotifierProvider<ContactNotifier>((ref) {
  return ContactNotifier();
});

class ContactNotifier extends ChangeNotifier {
  OverlayEntry? _entry;

  bool get isContactVisible => _entry != null;

  void toggleContact(BuildContext context) {
    if (_entry == null) {
      // Create and insert the new overlay
      _entry = OverlayEntry(
        builder: (context) => Positioned(
          bottom: 40,
          right: 40,
          child: ElevatedButton(
            onPressed: () => closeContact(context),
            child: const Text("close"),
          ),
        ),
      );

      final overlay = Overlay.of(context);
      overlay.insert(_entry!);
    } else {
      // Remove the existing overlay
      closeContact(context);
    }

    notifyListeners();
  }

  void closeContact(BuildContext context) {
    _entry?.remove();
    _entry = null;
    notifyListeners();
  }
}
