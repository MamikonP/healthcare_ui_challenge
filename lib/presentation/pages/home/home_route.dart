import 'package:flutter/cupertino.dart';

import '../../../core/router/screens.dart';

class HomeRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  HomeRoute({
    super.settings,
    this.maintainState = true,
  }) : super(fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return HomeScreen();
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
