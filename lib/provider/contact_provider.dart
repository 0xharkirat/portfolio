import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/contact_overlay.dart';

final contactProvider = ChangeNotifierProvider<ContactNotifier>((ref) {
  return ContactNotifier();
});

class ContactNotifier extends ChangeNotifier {
  OverlayEntry? _entry;

  bool get isContactVisible => _entry != null;

  void toggleContact(BuildContext context) {
    if (_entry == null) {
      _entry = OverlayEntry(
        builder: (context) => ContactOverlay(
          onClose: () {
            closeContact(context);
          },
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

