import 'package:flutter/cupertino.dart';
import '../../../core/router/screens.dart';

class SplashRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  SplashRoute({
    super.settings,
    this.maintainState = true,
  }) : super(fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return const SplashScreen();
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
