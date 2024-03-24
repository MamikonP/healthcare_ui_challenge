import 'package:flutter/cupertino.dart';

import '../../../core/router/screens.dart';

class AppointmentTimeRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  AppointmentTimeRoute({
    super.settings,
    this.maintainState = true,
  }) : super(fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return const AppointmentTimeScreen();
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
