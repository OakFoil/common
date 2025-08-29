import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../components.dart';

class MkFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final T? initialData;
  final Widget Function(T) showData;

  const MkFutureBuilder({
    required this.future,
    this.initialData,
    required this.showData,
    super.key,
  });
  @override
  Widget build(BuildContext context) => FutureBuilder(
    future: future,
    initialData: initialData,
    builder: asyncBuilder(showData),
  );
}

class MkStreamBuilder<T> extends StatelessWidget {
  final Stream<T> stream;
  final T? initialData;
  final Widget Function(T) showData;

  const MkStreamBuilder({
    required this.stream,
    this.initialData,
    required this.showData,
    super.key,
  });
  @override
  Widget build(BuildContext context) => StreamBuilder(
    stream: stream,
    initialData: initialData,
    builder: asyncBuilder(showData),
  );
}

Widget Function(BuildContext, AsyncSnapshot<T>) asyncBuilder<T>(
  Widget Function(T) showData,
) =>
    (_, snapshot) => snapshot.hasData
    ? showData(snapshot.data as T)
    : snapshot.hasError
    ? HeadlineText(snapshot.error.toString())
    : const CircularProgressIndicator.adaptive();

class AsyncValueBuilder<T> extends StatelessWidget {
  final AsyncValue<T> asyncValue;
  final Widget Function(T) showData;

  const AsyncValueBuilder({
    super.key,
    required this.asyncValue,
    required this.showData,
  });

  @override
  Widget build(BuildContext context) => asyncValue.when(
    data: showData,
    error: (e, trace) => Text(e.toString()),
    loading: () => const CircularProgressIndicator.adaptive(),
  );
}
