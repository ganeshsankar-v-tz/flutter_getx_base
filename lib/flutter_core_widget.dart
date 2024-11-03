import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_flutter_base/responsive_layout.dart';

class CoreWidget extends StatefulWidget {
  const CoreWidget({
    super.key,
    required this.child,
    required this.loadingStatus,
  });

  final Widget child;
  final bool loadingStatus;

  @override
  State<CoreWidget> createState() => _CoreWidgetState();
}

class _CoreWidgetState extends State<CoreWidget> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      /// is Mobile

      isMobile: Stack(
        children: [
          widget.child,
          if (widget.loadingStatus)
            const ModalBarrier(dismissible: false, color: Colors.white54),
          if (widget.loadingStatus)
            const Center(
              child: CupertinoActivityIndicator(
                color: Colors.red,
                radius: 12,
              ),
            ),
        ],
      ),

      /// is Tab

      isTab: Stack(
        children: [
          widget.child,
          if (widget.loadingStatus)
            const ModalBarrier(dismissible: false, color: Colors.white54),
          if (widget.loadingStatus)
            const Center(
              child: CupertinoActivityIndicator(
                color: Colors.red,
                radius: 12,
              ),
            ),
        ],
      ),

      /// is Desktop

      isDesktop: Stack(
        children: [
          widget.child,
          if (widget.loadingStatus)
            const ModalBarrier(dismissible: false, color: Colors.white54),
          if (widget.loadingStatus)
            const Center(
              child: CupertinoActivityIndicator(
                color: Colors.red,
                radius: 12,
              ),
            ),
        ],
      ),
    );
  }
}
