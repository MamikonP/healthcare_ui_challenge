// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'routes.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings,
      {dynamic arguments}) {
    switch (settings.name) {
      case AppRoutes.root:
        return SignInRoute();
      case AppRoutes.home:
        return HomeRoute();
      case AppRoutes.appointment:
        return AppointmentRoute(settings: settings);
      case AppRoutes.doctor:
        return DoctorsRoute(settings: settings);
      case AppRoutes.doctorDetail:
        return DoctorDetailRoute(settings: settings);
      case AppRoutes.appointmentTime:
        return AppointmentTimeRoute(settings: settings);
      case AppRoutes.payment:
        return PaymentRoute(settings: settings);
      case AppRoutes.paymentSuccess:
        return PaymentSuccessRoute(settings: settings);
      default:
        throw Exception('Route not found!');
    }
  }
}
