import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/dimensions.dart';
import '../pages/home/providers/prompt_provider.dart';

/// Instantiate provider
final promptProvider =
    StateNotifierProvider<PromptProvider, String>((ref) => PromptProvider());

class CustomSearchBar extends StatefulWidget {
  final bool canCancel;
  final TextEditingController controller;

  const CustomSearchBar(
      {Key? key, required this.canCancel, required this.controller})
      : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool _hasPrompt = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Consumer(builder: (ctx, ref, child) {
            return TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.borderRadius1),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white24,
                  prefixIcon:
                      _hasPrompt ? null : const Icon(CupertinoIcons.search),
                  prefixIconColor: Colors.white,
                  hintText: 'Search',
                  hintMaxLines: 1,
                  hintStyle: const TextStyle(
                      fontSize: AppDimensions.fontSize2,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.width1 * 0.03)),
              onChanged: (value) {
                final prompt = ref.read(promptProvider.notifier);

                if (_hasPrompt && widget.controller.text.isNotEmpty) {
                  prompt.setPrompt(value);

                  return;
                } else {
                  setState(() {
                    _hasPrompt = widget.controller.text.isNotEmpty;
                  });
                  prompt.setPrompt(value);
                }
              },
            );
          }),
        ),
        Visibility(
          visible: widget.canCancel,
          child: TextButton(
            onPressed: () {},
            child: const Text('cancel'),
          ),
        ),
      ],
    );
  }
}
