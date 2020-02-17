import 'dart:ui';

extension ColorUtils on Color {
  Color mix(Color another, double mount) {
    return Color.lerp(this, another, mount);
  }
}
