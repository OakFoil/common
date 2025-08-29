import 'package:flutter/material.dart';
export 'components/async.dart';
export 'components/text.dart';

class ScrollableWrap extends StatelessWidget {
  final List<Widget> children;

  const ScrollableWrap({super.key, required this.children});
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      child: Wrap(alignment: WrapAlignment.spaceAround, children: children));
}

class HeroByEqualChild extends StatelessWidget {
  final Widget child;
  const HeroByEqualChild({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Hero(tag: child, child: child);
}
