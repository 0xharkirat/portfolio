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
      _entry = OverlayEntry(
        builder: (context) => ContactOveraly(
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

class ContactOveraly extends StatelessWidget {
  const ContactOveraly({super.key, required this.onClose});
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      right: 40,
      child: ElevatedButton(
        onPressed: onClose,
        child: const Text("close"),
      ),
    );
  }
}
