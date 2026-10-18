# My Portfolio

A personal portfolio app built with Flutter for the **APDEVET Midterm Exam**
(Application Development and Emerging Technologies, BSIT 3rd Year,
La Consolacion College Tanauan).

**Live demo:** https://lcct-24-13115.github.io/my_portfolio/

## Features

- Five tabs built with `TabBar` and `TabBarView`, each with a Material icon:
  - **Personal**: photo, name, age, bio, career objective, personal details, and
    quick contact buttons
  - **Education**: schools in reverse chronological order, with honors
  - **Skills**: technical and non-technical skills, plus certifications and
    training (Cisco Networking Academy, webinars, seminars). Tap a
    certificate thumbnail to view and zoom the full image.
  - **Interests**: specializations, notable projects, and awards
  - **Contact**: email, phone, Facebook, Instagram, TikTok, LinkedIn,
    GitHub, and home address (opens in Google Maps). Tap a row to open it,
    or the copy button to copy it.
- One cohesive design theme (color scheme, typography, spacing) defined in
  `lib/app_theme.dart`, with a light/dark mode switch in the app bar.
- Responsive layout that works on phones, tablets, and the web.

## Project structure

```
lib/
  main.dart              app entry, theme mode, TabBar / TabBarView
  app_theme.dart         shared colors, typography, spacing (light + dark)
  data/contact_data.dart contact details used by more than one tab
  utils/link_launcher.dart  opens links, falls back to copying the text
  screens/               one file per tab
assets/images/           profile photo and certificate images
test/widget_test.dart    widget tests
.github/workflows/       automatic deployment to GitHub Pages
```

## Run it

```bash
flutter pub get
flutter run -d chrome
```

## Quality checks

```bash
dart format .
flutter analyze
flutter test
```

## Build

```bash
flutter build web      # web version
flutter build apk      # Android installable file
```

The web version is deployed automatically to GitHub Pages whenever changes
are pushed to the `main` branch.
