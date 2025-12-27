import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/theme/app_theme.dart';
import 'core/localization/app_localizations.dart';

import 'features/onboarding/screens/onboarding_screen.dart';
import 'features/profile/screens/profile_screen.dart';

void main() {
  runApp(const AlatareqApp());
}

class AlatareqApp extends StatelessWidget {
  const AlatareqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alatareq',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // Localization Setup
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'), // Arabic
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        // Simple logic to detect device locale or default to English
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: const OnboardingScreen(),
      routes: {'/profile': (context) => const ProfileScreen()},
    );
  }
}
