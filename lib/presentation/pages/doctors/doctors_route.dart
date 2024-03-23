import 'package:flutter/cupertino.dart';

import '../../../core/router/screens.dart';
import '../../constants/medical_type.dart';

class DoctorsRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  DoctorsRoute({
    super.settings,
    this.maintainState = true,
  }) : super(fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return DoctorsScreen(medicalType: settings.arguments as MedicalType?);
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
