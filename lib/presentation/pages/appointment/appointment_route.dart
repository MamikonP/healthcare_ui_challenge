import 'package:flutter/cupertino.dart';

import '../../../core/router/screens.dart';
import '../../constants/appointment_type.dart';

class AppointmentRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  AppointmentRoute({
    super.settings,
    this.maintainState = true,
  }) : super(fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    final appointmentType = settings.arguments as AppointmentType?;
    return AppointmentScreen(appointmentType: appointmentType);
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
