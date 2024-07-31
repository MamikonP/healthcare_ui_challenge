import 'package:flutter/cupertino.dart';

import '../../../core/router/screens.dart';
import '../../../domain/doctor/doctor_entity.dart';
import '../../constants/medical_type.dart';

class DoctorDetailRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  DoctorDetailRoute({
    super.settings,
    this.maintainState = true,
  }) : super(fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    final args = settings.arguments as Map<String, dynamic>?;
    return DoctorDetailScreen(
        medicalType: args?['medicalType'] as MedicalType,
        doctorEntity: args?['doctor'] as DoctorEntity);
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
