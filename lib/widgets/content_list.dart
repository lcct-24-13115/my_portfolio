import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../app_theme.dart';

/// Scrolling list used by every tab.
///
/// * On wide screens (laptops) the content is limited to
///   [AppTheme.maxContentWidth] and centered, so cards no longer stretch
///   across the whole browser window. On phones it uses the normal padding.
/// * Each child fades and slides in slightly when it first appears.
class ContentList extends StatelessWidget {
  const ContentList({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Extra side space so the content column stays centered.
        final sidePadding = math.max(
          AppTheme.pagePadding.horizontal / 2,
          (constraints.maxWidth - AppTheme.maxContentWidth) / 2,
        );
        return ListView(
          padding: EdgeInsets.symmetric(
            horizontal: sidePadding,
            vertical: AppTheme.pagePadding.vertical / 2,
          ),
          children: [
            for (var i = 0; i < children.length; i++)
              FadeSlideIn(index: i, child: children[i]),
          ],
        );
      },
    );
  }
}

/// Fades a child in while sliding it up a few pixels. [index] adds a small
/// delay so items appear one after another.
class FadeSlideIn extends StatelessWidget {
  const FadeSlideIn({super.key, required this.child, this.index = 0});

  final Widget child;
  final int index;

  @override
  Widget build(BuildContext context) {
    // Delay is capped so long lists do not feel slow.
    final delayMs = math.min(index, 6) * 50;
    final totalMs = 350 + delayMs;
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: totalMs),
      curve: Interval(delayMs / totalMs, 1, curve: Curves.easeOutCubic),
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, (1 - value) * 16),
          child: child,
        ),
      ),
      child: child,
    );
  }
}
