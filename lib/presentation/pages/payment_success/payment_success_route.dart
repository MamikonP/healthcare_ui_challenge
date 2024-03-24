import 'package:flutter/cupertino.dart';

import '../../../core/router/screens.dart';

class PaymentSuccessRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  PaymentSuccessRoute({
    super.settings,
    this.maintainState = true,
  }) : super(fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return const PaymentSuccessScreen();
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
