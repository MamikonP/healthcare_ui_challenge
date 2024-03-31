import 'package:flutter/cupertino.dart';

import '../../../core/router/screens.dart';
import '../../../domain/doctor/doctor_entity.dart';

class AppointmentTimeRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  AppointmentTimeRoute({
    super.settings,
    this.maintainState = true,
  }) : super(fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return AppointmentTimeScreen(settings.arguments as DoctorEntity?);
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
