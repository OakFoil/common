import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  final String text;

  const DisplayText(this.text, {super.key});

  @override
  Widget build(BuildContext context) =>
      Text(text, style: Theme.of(context).textTheme.displayMedium);
}

class HeadlineText extends StatelessWidget {
  final String text;

  const HeadlineText(this.text, {super.key});

  @override
  Widget build(BuildContext context) =>
      Text(text, style: Theme.of(context).textTheme.headlineMedium);
}

class TitleText extends StatelessWidget {
  final String text;

  const TitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) =>
      Text(text, style: Theme.of(context).textTheme.titleMedium);
}

class BodyText extends StatelessWidget {
  final String text;

  const BodyText(this.text, {super.key});

  @override
  Widget build(BuildContext context) =>
      Text(text, style: Theme.of(context).textTheme.bodyMedium);
}

class LabelText extends StatelessWidget {
  final String text;

  const LabelText(this.text, {super.key});

  @override
  Widget build(BuildContext context) =>
      Text(text, style: Theme.of(context).textTheme.labelMedium);
}
