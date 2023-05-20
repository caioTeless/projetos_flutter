import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleAppBar extends StatefulWidget with PreferredSizeWidget {
  final String title;
  final bool canBack;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const SimpleAppBar({
    Key? key,
    required this.title,
    this.canBack = true,
    this.actions,
    this.bottom,
  }) : super(key: key);

  @override
  _SimpleAppBarState createState() => _SimpleAppBarState();

  @override
  Size get preferredSize =>
      bottom != null ? const Size.fromHeight(100) : const Size.fromHeight(56);
}

class _SimpleAppBarState extends State<SimpleAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title.toLowerCase(),
        style: const TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      actions: widget.actions,
      automaticallyImplyLeading: widget.canBack,
      bottom: widget.bottom,
    );
  }
}
