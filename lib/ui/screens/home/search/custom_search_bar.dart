import 'package:flutter/material.dart';

/// A simple search bar widget
class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    required this.onChange,
    required this.confirmationRequired,
    required this.onSubmit,
    required this.onClear,
    this.hasFocus,
    this.onFocusChangeExtra,
    this.controller,
    this.suffixWidget,
    super.key,
  });

  final Widget? suffixWidget;

  /// Function to call when the value in the searchBar changes
  final ValueSetter<String> onChange;

  /// The controller of the text input
  final TextEditingController? controller;

  /// True if the search requires user interaction to trigger (ex: press enter)
  final bool confirmationRequired;

  /// Called when the user clicks the submit button, for when
  /// [confirmationRequired] is true
  final Function onSubmit;

  /// If we want extra logic for clearing the search bar
  final VoidCallback onClear;

  final Function? onFocusChangeExtra;

  final bool? hasFocus;

  @override
  CustomSearchBarState createState() => CustomSearchBarState();
}

class CustomSearchBarState extends State<CustomSearchBar> {
  /// will be responsible for clearing the text in the search bar
  /// when the clear button is pressed. It will also keep track of the
  /// length of the input so to show the clear button only if there is
  /// text in the search field.
  late TextEditingController _controller;

  bool focused = false;

  final int _minCharactersForSearch = 2;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    if (widget.confirmationRequired) {
      _controller.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    if (!mounted) {
      return;
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
          border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          Expanded(
            child: FocusScope(
              child: Focus(
                onFocusChange: (bool f) {
                  setState(() {
                    focused = !focused;
                  });
                  if (widget.onFocusChangeExtra != null) {
                    widget.onFocusChangeExtra!(focused);
                  }
                },
                child: TextField(
                  onChanged:
                      widget.confirmationRequired ? null : widget.onChange,
                  onSubmitted: (_) {
                    widget.onSubmit();
                  },
                  autofocus: widget.hasFocus != null && widget.hasFocus!,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(fontSize: 16),
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: focused
                        ? Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    if (_controller.text.trim().isEmpty) {
                                      FocusScope.of(context).unfocus();
                                    }
                                    widget.onChange('');
                                    _controller.text = '';
                                    FocusScope.of(context).unfocus();
                                    widget.onClear();
                                  },
                                  child: const Icon(Icons.cancel_outlined),
                                ),
                                if (widget.confirmationRequired &&
                                    _controller.text.length >
                                        _minCharactersForSearch)
                                  IconButton(
                                      onPressed: () {
                                        widget.onSubmit();
                                      },
                                      icon: const Icon(Icons.arrow_forward))
                              ],
                            ),
                          )
                        : null,
                  ),
                  controller: _controller,
                ),
              ),
            ),
          ),
          if(widget.suffixWidget != null)
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: widget.suffixWidget!,
            ),
        ],
      ),
    );
  }
}
