import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoreWidget extends StatefulWidget {
  const CoreWidget({
    super.key,
    required this.child,
    required this.loadingStatus,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.appBar,
  });

  final Widget child;
  final bool loadingStatus;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;

  @override
  State<CoreWidget> createState() => _CoreWidgetState();
}

class _CoreWidgetState extends State<CoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? Theme.of(context).primaryColor,
      appBar: widget.appBar,
      floatingActionButton: widget.floatingActionButton,
      // bottomNavigationBar: widget.bottomNavigationBar,
      body: Stack(
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
