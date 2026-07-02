import 'package:flutter/material.dart';

class FixedThumbScrollView extends StatefulWidget {
  const FixedThumbScrollView({super.key, required this.child});

  final Widget child;

  @override
  State<FixedThumbScrollView> createState() => _FixedThumbScrollViewState();
}

class _FixedThumbScrollViewState extends State<FixedThumbScrollView> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _controller,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: _controller,
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: widget.child,
        ),
      ),
    );
  }
}
