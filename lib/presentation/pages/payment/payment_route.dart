import 'package:flutter/cupertino.dart';

import '../../../core/router/screens.dart';
import '../../../domain/doctor/doctor_entity.dart';

class PaymentRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  PaymentRoute({
    super.settings,
    this.maintainState = true,
  }) : super(fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return PaymentScreen(doctorEntity: settings.arguments as DoctorEntity?);
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
