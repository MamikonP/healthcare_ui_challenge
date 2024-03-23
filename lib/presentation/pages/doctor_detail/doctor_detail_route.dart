import 'package:flutter/cupertino.dart';

import '../../../core/router/screens.dart';

class DoctorDetailRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  DoctorDetailRoute({
    super.settings,
    this.maintainState = true,
  }) : super(fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return const DoctorDetailScreen();
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
