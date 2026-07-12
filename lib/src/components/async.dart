import 'package:flutter/material.dart';
import 'package:common_flutter/common.dart';
import 'package:riverpod/riverpod.dart';

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

Widget errorBuilder(
  Object error,
  StackTrace stacktrace, [
  bool asSliver = false,
]) => asSliver
    ? SliverFillRemaining(
        hasScrollBody: false,
        child: HeadlineText(error.toString()),
      )
    : HeadlineText(error.toString());

Widget loadingBuilder([bool asSliver = false]) => asSliver
    ? SliverFillRemaining(
        hasScrollBody: false,
        child: const Center(child: CircularProgressIndicator.adaptive()),
      )
    : const Center(child: CircularProgressIndicator.adaptive());

Widget Function(BuildContext, AsyncSnapshot<T>) asyncBuilder<T>(
  Widget Function(T) showData, [
  bool asSliver = false,
]) =>
    (_, snapshot) => snapshot.hasData
    ? showData(snapshot.data as T)
    : snapshot.hasError
    ? errorBuilder(snapshot.error!, snapshot.stackTrace!, asSliver)
    : loadingBuilder(asSliver);

class AsyncValueBuilder<T> extends StatelessWidget {
  final AsyncValue<T> asyncValue;
  final Widget Function(T) showData;
  final bool asSliver;

  const AsyncValueBuilder({
    super.key,
    required this.asyncValue,
    required this.showData,
    this.asSliver = false,
  });

  @override
  Widget build(BuildContext context) => asyncValue.when(
    data: showData,
    error: (e, trace) => errorBuilder(e, trace, asSliver),
    loading: () => loadingBuilder(asSliver),
  );
}
