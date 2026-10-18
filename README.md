# My Portfolio

A personal portfolio app built with Flutter for the **APDEVET Midterm Exam**
(Application Development and Emerging Technologies, BSIT 3rd Year,
La Consolacion College Tanauan).

**Live demo:** https://lcct-24-13115.github.io/my_portfolio/

## Features

- Five tabs built with `TabBar` and `TabBarView`, each with a Material icon:
  - **Personal**: photo, name, age, bio, career objective, personal details,
    quick contact buttons, and a **Download CV** button
  - **Education**: schools in reverse chronological order, with honors
  - **Skills**: technical skills grouped by area (programming, web,
    networking, IT support), non-technical skills, plus certifications and
    training (Cisco Networking Academy, webinars, seminars). Tap a
    certificate thumbnail to view and zoom the full image.
  - **Interests**: specializations, notable projects (with key features and
    screenshot galleries), and awards
  - **Contact**: email, phone, Facebook, Instagram, TikTok, LinkedIn,
    GitHub, and home address (opens in Google Maps). Tap a row to open it,
    or the copy button to copy it.
- One cohesive design theme (color scheme, spacing, and the Poppins font)
  defined in `lib/app_theme.dart`, with a light/dark mode switch in the app
  bar. The chosen mode is remembered on the next visit.
- Responsive layout: content is centered and limited to about 700 px wide on
  laptops, and uses the full width on phones.
- Certificate gallery: filter chips (All, Networking, Web, Webinars &
  Seminars) and a viewer you can swipe, zoom, or browse with the arrow keys.
- Projects showcase in the Interests tab, with swipeable screenshot galleries
  for Tom and Jerry, the Maintenance Ticketing System, and the Library
  System, plus a vertical education timeline and light fade-in animations.
- Link preview image and initials icon, so a shared link shows a name and
  photo instead of a blank card.

## Screenshots

| Personal | Education | Skills |
| --- | --- | --- |
| ![Personal tab](docs/screenshots/personal.png) | ![Education tab](docs/screenshots/education.png) | ![Skills tab](docs/screenshots/skills.png) |

| Interests | Contact | Dark mode |
| --- | --- | --- |
| ![Interests tab](docs/screenshots/interests.png) | ![Contact tab](docs/screenshots/contact.png) | ![Dark mode](docs/screenshots/dark_mode.png) |

## Project structure

```
lib/
  main.dart              app entry, theme mode, TabBar / TabBarView
  app_theme.dart         shared colors, typography, spacing (light + dark)
  data/contact_data.dart contact details used by more than one tab
  utils/link_launcher.dart  opens links, falls back to copying the text
  data/certificates.dart certificate list and filter categories
  screens/               one file per tab
  widgets/               shared widgets (centered animated list, gallery)
assets/images/           profile photo, certificate and project images
web/Julia_Alemania_CV.pdf  one-page CV used by the Download CV button
                         (references page left out for privacy)
assets/fonts/            Poppins font files
docs/screenshots/        README screenshots
test/widget_test.dart    widget tests
.github/workflows/       analyze + test, then deploy to GitHub Pages
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

Every push to `main` (and every pull request) first runs `flutter analyze`
and `flutter test` on GitHub. If either fails, nothing is deployed. When both
pass, the web version is deployed to GitHub Pages.
