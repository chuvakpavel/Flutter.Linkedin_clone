import 'package:flutter/material.dart';
import 'package:linkedin_clone/core/presentation/utility/responsive_layout.dart';

class ForBusinessPopup extends StatefulWidget {
  const ForBusinessPopup({
    super.key,
  });

  @override
  State<ForBusinessPopup> createState() => _ForBusinessPopupState();
}

class _ForBusinessPopupState extends State<ForBusinessPopup> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final subtitleStyle = Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold);
    final isTightLayout = context.isTightLayout;
    final screenHeight = context.screenHeight;

    return SizedBox(
      height: screenHeight * 0.9,
      child: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          child: _PopupLayout(
            isTightLayout: isTightLayout,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 7,
                  children: [
                    const SizedBox(height: 48),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'My Apps',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700,),                      ),
                    ),
                    const _LeftColumnButton(icon: Icons.arrow_circle_right_rounded, text: 'Find Leads'),
                    const _LeftColumnButton(icon: Icons.group, text: 'Groups'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('Talent', style: subtitleStyle),
                    ),
                    const _LeftColumnButton(icon: Icons.file_present, text: 'Talent Insights'),
                    const _LeftColumnButton(icon: Icons.radio, text: 'Post a job'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('Sales', style: subtitleStyle),
                    ),
                    const _LeftColumnButton(icon: Icons.spellcheck, text: 'Services Marketplace'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('Marketing', style: subtitleStyle),
                    ),
                    const _LeftColumnButton(icon: Icons.arrow_circle_left_outlined, text: 'Advertise'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('Learning', style: subtitleStyle),
                    ),
                    const _LeftColumnButton(icon: Icons.play_arrow, text: 'Learning'),
                  ],
                ),
              ),
              if (!isTightLayout)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48),
                  child: Container(
                    width: 0.5,
                    height: screenHeight,
                    color: Colors.grey,
                  ),
                )
              else
                Container(
                  height: 0.5,
                  width: screenHeight,
                  color: Colors.grey,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 36,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      'Explore For Business',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700,),
                    ),
                    const _RightColumnButton(title: 'Hire on LinkedIn', subTitle: 'Find, attract and recruit talent'),
                    const _RightColumnButton(title: 'Sell with LinkedIn', subTitle: 'Unlock sales opportunities'),
                    const _RightColumnButton(title: 'Post а job for free', subTitle: 'Get qualifed appIicants quick]y'),
                    const _RightColumnButton(
                        title: 'Advertise on LinkedIn', subTitle: 'Acquire customers and grow your business'),
                    const _RightColumnButton(
                        title: 'Elevate your small business', subTitle: 'Find new clients and build credibility'),
                    const _RightColumnButton(title: 'Learn with LinkedIn', subTitle: 'Courses to develop your employees'),
                    const _RightColumnButton(title: 'Admin Center', subTitle: 'Manage billing and account details'),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        _RightColumnButton(title: 'Create a Company Page', subTitle: ''),
                        Text('+', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PopupLayout extends StatelessWidget {
  const _PopupLayout({
    required this.children,
    this.isTightLayout = false,
  });

  final List<Widget> children;

  final bool isTightLayout;

  @override
  Widget build(BuildContext context) {
    return isTightLayout
        ? SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          );
  }
}

class _LeftColumnButton extends StatelessWidget {
  const _LeftColumnButton({
    required this.icon,
    required this.text,
  });

  final IconData icon;

  final String text;

  @override
  Widget build(BuildContext context) {
    final textButtonStyle = ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
      overlayColor: WidgetStateProperty.all<Color>(Colors.white),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
      textStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (Set<WidgetState> states) => states.contains(WidgetState.hovered)
            ? const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: Color.fromRGBO(0, 115, 177, 1),
              )
            : const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 115, 177, 1),
              ),
      ),
      iconColor: WidgetStateProperty.all<Color>(const Color.fromRGBO(0, 115, 177, 1)),
      iconSize: WidgetStateProperty.all<double>(32),
    );

    return TextButton(
      style: textButtonStyle,
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class _RightColumnButton extends StatelessWidget {
  const _RightColumnButton({
    required this.title,
    required this.subTitle,
  });

  final String title;

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final textButtonStyle = ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
      overlayColor: WidgetStateProperty.all<Color>(Colors.white),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
      textStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (Set<WidgetState> states) => states.contains(WidgetState.hovered)
            ? const TextStyle(
                decoration: TextDecoration.underline,
              )
            : const TextStyle(),
      ),
    );

    return TextButton(
      style: textButtonStyle,
      onPressed: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!,
          ),
          Text(
            subTitle,
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
