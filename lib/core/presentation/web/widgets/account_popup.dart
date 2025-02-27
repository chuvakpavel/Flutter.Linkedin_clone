import 'package:flutter/material.dart';

import '../../utility/user_provider.dart';
import '../views/home/widgets/profile_block/widgets/profile_image.dart';

class AccountPopup extends StatelessWidget {
  const AccountPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserProvider.of(context).user;

    final outlinedButtonStyle = ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            vertical: 4,
          ),
        ),
        foregroundColor: WidgetStateProperty.all<Color>(const Color.fromRGBO(0, 115, 177, 1)),
        backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
        overlayColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) => states.contains(WidgetState.hovered) ? Colors.blue.withAlpha(25) : Colors.white,
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(const TextStyle(fontSize: 14)),
        side: WidgetStateProperty.resolveWith<BorderSide>(
              (Set<WidgetState> states) => states.contains(WidgetState.hovered)
              ? const BorderSide(
            color: Color.fromRGBO(0, 115, 177, 1),
            width: 2,
          )
              : const BorderSide(color: Color.fromRGBO(0, 115, 177, 1)),
        ),
        shape:  WidgetStateProperty.all<OutlinedBorder>( RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))
    );

    return SizedBox(
      width: 265,
      height: 365,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: ProfileImage(
                    imageUrl: user.imageUrl,
                    radius: 28,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: Theme.of(context).textTheme.headlineMedium!,
                      ),
                      Text(
                        user.job,
                        style: Theme.of(context).textTheme.titleSmall!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 24,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: OutlinedButton(
                style: outlinedButtonStyle,
                onPressed: () {},
                child: const Text('View Profile'),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 0.25,
              width: double.infinity,
              color: Colors.grey,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Account',
                style: Theme.of(context).textTheme.headlineMedium!,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TextButton(text: 'Settings & Privacy'),
                  _TextButton(text: 'Help'),
                  _TextButton(text: 'Language'),
                ],
              ),
            ),
            Container(
              height: 0.25,
              width: double.infinity,
              color: Colors.grey,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Manage',
                style: Theme.of(context).textTheme.headlineMedium!,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TextButton(text: 'Posts & Activity'),
                  _TextButton(text: 'Job Posting Account'),
                ],
              ),
            ),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: _TextButton(text: 'Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextButton extends StatelessWidget {
  const _TextButton({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final textButtonStyle = ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
      ),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
      foregroundColor: WidgetStateProperty.all<Color>(const Color.fromRGBO(111, 111, 111, 1)),
      overlayColor: WidgetStateProperty.all<Color>(Colors.white),
      textStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) => states.contains(WidgetState.hovered)
            ? const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w100,
          decoration: TextDecoration.underline,
        )
            : const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w100,
        ),
      ),
    );

    return TextButton(
      style: textButtonStyle,
      onPressed: () {},
      child: Text(text),
    );
  }
}
