import 'package:flutter/material.dart';

class SearchHeader extends StatefulWidget implements PreferredSizeWidget {
  const SearchHeader({super.key});

  @override
  State<SearchHeader> createState() => _SearchHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchHeaderState extends State<SearchHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12,
          children: [
            InkWell(
              onTap: () => setState(() {
                Navigator.of(context).pop();
              }),
              child: const Icon(Icons.arrow_back, size: 24, color: Colors.black54),
            ),
            Expanded(
              child: Container(
                color: Colors.lightBlueAccent.withAlpha(25),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Search',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 16),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(Icons.qr_code_scanner, color: Colors.black54, size: 24),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}