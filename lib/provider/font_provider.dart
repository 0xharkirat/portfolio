import 'package:flutter_riverpod/flutter_riverpod.dart';

final fontGroup1 = {
  'headline': 'Acorn',
  'body': 'Gt',
};

final fontGroup2 = {
  'headline': 'Monothin',
  'body': 'Monobook',
};

final defaultFontFamily = fontGroup1;

class FontProvider extends StateNotifier<Map<String, String>> {
  FontProvider(Map<String, String> state) : super(state);

  void switchFontGroup() {
    state = state == fontGroup1 ? fontGroup2 : fontGroup1;
  }
}

final fontProvider =
    StateNotifierProvider<FontProvider, Map<String, String>>((ref) {
  return FontProvider(defaultFontFamily);
});
