import 'package:flutter/cupertino.dart';
import '../../../core/router/screens.dart';

class SignInRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  SignInRoute({
    super.settings,
    this.maintainState = true,
  }) : super(fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return const SignInScreen();
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
