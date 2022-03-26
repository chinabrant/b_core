import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/scheduler.dart';

import 'base_view_model.dart';

/// 初始化ViewModel，同时监听数据变化
class ViewModelBuilder<T extends BaseViewModel> extends StatefulWidget {
  ViewModelBuilder({
    Key? key,
    required this.builder,
    required this.viewModelBuilder,
    this.onDispose,
    this.initState,
    this.listen = true,
    this.onPostFrame,
  }) : super(key: key);

  final Widget Function(BuildContext context, T viewModel) builder;

  /// state初始化时回调
  final void Function(BuildContext context, T viewModel)? initState;

  /// 第一帧加载后回调
  final void Function(BuildContext context, T viewModel)? onPostFrame;

  /// 是否监听viewmodel数据变化,默认不监听
  final bool listen;

  final T Function() viewModelBuilder;

  /// 销毁时回调
  final Function(T viewModel)? onDispose;

  @override
  _ViewModelBuilderState<T> createState() => _ViewModelBuilderState<T>();
}

class _ViewModelBuilderState<T extends BaseViewModel>
    extends State<ViewModelBuilder<T>> {
  T? viewModel;

  @override
  void initState() {
    super.initState();

    viewModel = widget.viewModelBuilder();

    widget.initState?.call(context, viewModel!);

    if (widget.onPostFrame != null) {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        widget.onPostFrame?.call(context, viewModel!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.listen) {
      return ChangeNotifierProvider<T>(
        create: (context) {
          return viewModel!;
        },
        child: Consumer<T>(
          builder: (context, viewModel, child) {
            return widget.builder(context, viewModel);
          },
        ),
      );
    }

    return ChangeNotifierProvider<T>.value(
      value: viewModel!,
      builder: (context, child) => widget.builder(context, viewModel!),
    );
  }

  @override
  void dispose() {
    super.dispose();

    widget.onDispose?.call(viewModel!);
  }
}
