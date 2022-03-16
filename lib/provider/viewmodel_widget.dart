import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ViewModelWidget<T> extends Widget {
  final bool watch;

  const ViewModelWidget({
    Key? key,
    this.watch = true,
  }) : super(key: key);

  @protected
  Widget build(BuildContext context, T vm);

  @override
  _ViewModelBuilderElement<T> createElement() {
    return _ViewModelBuilderElement<T>(this);
  }
}

class _ViewModelBuilderElement<T> extends ComponentElement {
  _ViewModelBuilderElement(ViewModelWidget widget) : super(widget);

  @override
  ViewModelWidget get widget => super.widget as ViewModelWidget<dynamic>;

  @override
  Widget build() {
    return widget.build(this, Provider.of<T>(this, listen: widget.watch));
  }
}
