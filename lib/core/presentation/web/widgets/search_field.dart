import 'package:flutter/material.dart';

import '../../../models/navigation_item.dart';
import '../../widgets/navigation_button.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.callback,
    this.isFullSized = true,
    this.isLabelHidden = false,
  });

  final VoidCallback callback;

  final bool isFullSized;

  final bool isLabelHidden;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final GlobalKey _fieldKey = GlobalKey();
  final GlobalKey _tightFieldKey = GlobalKey();
  bool _isFocused = false;

  void _toggleFocus() {
    setState(() {
      _isFocused = !_isFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isFullSized
        ? InkWell(
            key: _fieldKey,
            onTap: () {
              _toggleFocus();
              _showOverlay(context);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _isFocused ? 323 : 280,
              height: 34,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(237, 243, 248, 1),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: _isFocused ? Colors.black : Colors.transparent, // Highlight border
                  width: 1, // Increase border width when focused
                ),
              ),
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      const Icon(Icons.search, size: 24),
                      Text(
                        'Search',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : LayoutBuilder(
            builder: (context, constraints) {
              return _isFocused
                  ? Container(
                      width: MediaQuery.of(context).size.width - 82,
                      height: 34,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(237, 243, 248, 1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: _isFocused ? Colors.black : Colors.transparent, // Highlight border
                          width: 1, // Increase border width when focused
                        ),
                      ),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 8,
                            children: [
                              const Icon(Icons.search, size: 24),
                              Text(
                                'Search',
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 45,
                      child: NavigationButton(
                        buttonKey: _tightFieldKey,
                        navigationItem: NavigationItem(
                          icon: Icons.search,
                          label: 'Search',
                        ),
                        isTightLayout: widget.isLabelHidden,
                        onPressed: () {
                          _toggleFocus();
                          _showOverlay(context);
                          widget.callback();
                        },
                      ),
                    );
            },
          );
  }

  void _showOverlay(
    BuildContext context,
  ) {
    final key = widget.isFullSized ? _fieldKey : _tightFieldKey;
    final overlayState = Overlay.of(context);
    final renderBox = key.currentContext?.findRenderObject() as RenderBox;
    final topPoint = renderBox.size.height + 24;
    final leftPoint = renderBox.localToGlobal(const Offset(0, 0)).dx;

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                _toggleFocus();
                widget.callback();
                overlayEntry.remove();
              },
              behavior: HitTestBehavior.translucent,
            ),
          ),
          Positioned.fill(
            top: kToolbarHeight - 4,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: _isFocused ? 1.0 : 0.0,
              child: GestureDetector(
                onTap: () {
                  _toggleFocus();
                  widget.callback();
                  overlayEntry.remove();
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  color: Colors.black.withAlpha(125),
                ),
              ),
            ),
          ),
          Positioned(
            top: topPoint,
            left: leftPoint,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              child: SizedBox(
                width: 370,
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        'Try searching for',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.grey),
                      ),
                    ),
                    const _SearchOption(searchHint: 'interview tips'),
                    const _SearchOption(searchHint: 'latest in ai'),
                    const _SearchOption(searchHint: 'balancing work and personal life'),
                    const _SearchOption(searchHint: 'remote work'),
                    const _SearchOption(searchHint: 'when is the best time to change work'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    overlayState.insert(overlayEntry);
  }
}

class _SearchOption extends StatelessWidget {
  const _SearchOption({required this.searchHint});

  final String searchHint;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        iconSize: WidgetStateProperty.all<double>(24),
        shape: WidgetStateProperty.all<OutlinedBorder>(const ContinuousRectangleBorder()),
        padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 12, vertical: 16)),
        backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
        iconColor: WidgetStateProperty.all<Color>(Colors.black),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) => states.contains(WidgetState.hovered) ? Colors.grey.withAlpha(100) : Colors.white,
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          const Icon(Icons.search),
          Text(searchHint),
        ],
      ),
    );
  }
}
