import 'package:flutter_riverpod/flutter_riverpod.dart';

class PromptProvider extends StateNotifier<String> {
  PromptProvider() : super('');

  void setPrompt(String prompt) {
    state = prompt;
  }

}
