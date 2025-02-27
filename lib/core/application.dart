import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'models/user.dart';
import 'presentation/utility/platform_provider.dart';
import 'presentation/utility/styles/theme.dart';
import 'presentation/utility/user_provider.dart';
import 'presentation/utility/stubs/home_view_stub.dart'
if (dart.library.io) 'presentation/mobile/views/home/home_view.dart'
if (dart.library.html) 'presentation/web/views/home/home_web_view.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final bool isMobile = !kIsWeb;

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      user: User(
        'Pavel Chuvak',
        4,
        "https://media.licdn.com/dms/image/v2/D4E35AQGvkVRsPz8FyA/profile-framedphoto-shrink_100_100/profile-framedphoto-shrink_100_100/0/1736316755603?e=1741158000&v=beta&t=2aUvYuy70HpAU_FCM6OGb9LREnFjHFmw-MCEEKeXUWU",
        'Xamarin MAUI / Flutter Developer. Cross-platform Mobile Application Contractor / B2B / Freelance.',
        'Bialystok, Podlaskie, Poland',
      ),
      child: PlatformProvider(
        isMobile: isMobile,
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: MaterialApp(
              theme: basicTheme,
              debugShowCheckedModeBanner: false,
              home: getHomeView(),
            ),
          ),
        ),
      ),
    );
  }
}
