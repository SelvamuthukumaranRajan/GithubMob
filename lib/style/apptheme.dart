import 'dart:ui';

class AppTheme {
  final String backgroundLight = '#FAFBFC';
  final String border = '#2B3137';
  final String githubWhite = '#FAFAFA';
  final String primary = '#6E5494';
  final String text = '#4078C0';

  Color get backgroundLightColor => backgroundLight.fromHex;
  Color get borderColor => border.fromHex;
  Color get githubWhiteColor => githubWhite.fromHex;
  Color get primaryColor => primary.fromHex;
  Color get textColor => text.fromHex;

}

extension HexColorExt on String {
  Color get fromHex {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) {
      buffer.write('ff');
    }
    if (startsWith('#')) {
      buffer.write(replaceFirst('#', ''));
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}