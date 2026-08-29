import 'package:flutter/material.dart';

/// Yogolyzer の角丸
class AppRadius {
  AppRadius._();

  // ═══════════════════════════════════════════════
  // Radius Scale
  // ═══════════════════════════════════════════════

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double full = 999;

  // ═══════════════════════════════════════════════
  // Component-specific
  // ═══════════════════════════════════════════════

  static const double button = md;
  static const double card = md;
  static const double input = md;
  static const double chip = sm;
  static const double modal = lg;
  static const double bottomSheet = xl;
  static const double image = md;
  static const double thumbnail = sm;

  // ═══════════════════════════════════════════════
  // BorderRadius
  // ═══════════════════════════════════════════════

  static BorderRadius get xsAll => BorderRadius.circular(xs);
  static BorderRadius get smAll => BorderRadius.circular(sm);
  static BorderRadius get mdAll => BorderRadius.circular(md);
  static BorderRadius get lgAll => BorderRadius.circular(lg);
  static BorderRadius get xlAll => BorderRadius.circular(xl);
  static BorderRadius get fullAll => BorderRadius.circular(full);

  static BorderRadius get cardAll => BorderRadius.circular(card);
  static BorderRadius get buttonAll => BorderRadius.circular(button);
  static BorderRadius get inputAll => BorderRadius.circular(input);
  static BorderRadius get chipAll => BorderRadius.circular(chip);

  static BorderRadius get bottomSheetTop => const BorderRadius.only(
        topLeft: Radius.circular(xl),
        topRight: Radius.circular(xl),
      );
}
