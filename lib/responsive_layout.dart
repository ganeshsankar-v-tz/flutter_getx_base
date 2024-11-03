import 'package:flutter/cupertino.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget isMobile;
  final Widget isTab;
  final Widget isDesktop;

  const ResponsiveLayout({
    super.key,
    required this.isMobile,
    required this.isTab,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 450) {
          return isMobile;
        } else if (constraints.maxWidth < 900) {
          return isTab;
        } else {
          return isDesktop;
        }
      },
    );
  }
}
