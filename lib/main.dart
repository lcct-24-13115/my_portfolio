import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'screens/contact_tab.dart';
import 'screens/education_tab.dart';
import 'screens/interests_tab.dart';
import 'screens/personal_info_tab.dart';
import 'screens/skills_tab.dart';

void main() => runApp(const PortfolioApp());

/// Root widget. The theme is defined once in [AppTheme] so every
/// screen shares the same colors and typography.
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomePage(),
    );
  }
}

/// Main page: a [TabBar] in the app bar and a [TabBarView] for the content.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Must equal the number of tabs AND the number of views.
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Portfolio'),
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
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