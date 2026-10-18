import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme.dart';
import 'screens/contact_tab.dart';
import 'screens/education_tab.dart';
import 'screens/interests_tab.dart';
import 'screens/personal_info_tab.dart';
import 'screens/skills_tab.dart';

/// Key used to remember the light/dark choice between visits.
const String themePrefKey = 'isDarkMode';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var mode = ThemeMode.light;
  try {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(themePrefKey) ?? false) mode = ThemeMode.dark;
  } catch (_) {
    // Storage can be unavailable (private browsing). Fall back to light.
  }
  runApp(PortfolioApp(initialThemeMode: mode));
}

/// Root widget. The themes are defined once in [AppTheme] so every
/// screen shares the same colors and typography. It also remembers whether
/// the visitor picked light or dark mode.
class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key, this.initialThemeMode = ThemeMode.light});

  /// Theme loaded from storage when the app starts.
  final ThemeMode initialThemeMode;

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  late ThemeMode _themeMode = widget.initialThemeMode;

  /// Switches between light and dark mode and remembers the choice.
  Future<void> _toggleTheme() async {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(themePrefKey, _themeMode == ThemeMode.dark);
    } catch (_) {
      // Saving is optional; the toggle still works for this visit.
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Julia Cassandra Alemania | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      home: HomePage(onToggleTheme: _toggleTheme),
    );
  }
}

/// Main page: a [TabBar] in the app bar and a [TabBarView] for the content.
class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onToggleTheme});

  /// Called when the light/dark mode button is tapped.
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // Tab colors follow the app bar so they stay readable in both modes.
    final barForeground =
        Theme.of(context).appBarTheme.foregroundColor ?? Colors.white;

    return DefaultTabController(
      length: 5, // Must equal the number of tabs AND the number of views.
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Portfolio'),
          actions: [
            IconButton(
              tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              onPressed: onToggleTheme,
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            labelColor: barForeground,
            unselectedLabelColor: barForeground.withAlpha(170),
            indicatorColor: barForeground,
            tabs: const [
              Tab(icon: Icon(Icons.person), text: 'Personal'),
              Tab(icon: Icon(Icons.school), text: 'Education'),
              Tab(icon: Icon(Icons.build), text: 'Skills'),
              Tab(icon: Icon(Icons.lightbulb), text: 'Interests'),
              Tab(icon: Icon(Icons.contact_mail), text: 'Contact'),
            ],
          ),
        ),
        // Order here must match the order of the tabs above.
        body: const TabBarView(
          children: [
            PersonalInfoTab(),
            EducationTab(),
            SkillsTab(),
            InterestsTab(),
            ContactTab(),
          ],
        ),
      ),
    );
  }
}
