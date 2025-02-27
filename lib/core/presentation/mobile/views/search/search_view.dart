import 'package:flutter/material.dart';

import '../../../widgets/app_tab_bar.dart';
import 'widgets/search_header.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchHeader(),
      bottomNavigationBar: const AppTabBar(),
      body: Container(
        color: const Color.fromRGBO(244, 242, 238, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  'Try searching for',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
    );
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
              (Set<WidgetState> states) => states.contains(WidgetState.pressed) ? Colors.grey.withAlpha(100) : Colors.white,
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          Theme.of(context).textTheme.headlineMedium!,
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