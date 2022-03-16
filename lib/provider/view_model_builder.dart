import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewModelBuilder<T extends ChangeNotifier> extends StatefulWidget {
  ViewModelBuilder({
    Key? key,
    required this.builder,
    required this.viewModelBuilder,
    this.watch = true,
    this.child,
  }) : super(key: key);

  final bool watch;

  final Widget Function(BuildContext context, T viewModel, Widget? child)
      builder;

  final T Function() viewModelBuilder;

  final Widget? child;

  @override
  _ViewModelBuilderState<T> createState() => _ViewModelBuilderState<T>();
}

class _ViewModelBuilderState<T extends ChangeNotifier>
    extends State<ViewModelBuilder<T>> {
  T? viewModel;

  @override
  void initState() {
    super.initState();

    viewModel = widget.viewModelBuilder();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.watch) {
      return ChangeNotifierProvider<T>.value(
        value: viewModel!,
        child: widget.builder(context, viewModel!, widget.child),
      );
    }

    return ChangeNotifierProvider<T>(
      create: (context) => viewModel!,
      child: Consumer<T>(builder: (context, value, child) {
        return widget.builder(context, value, widget.child);
      }),
    );
  }
}
