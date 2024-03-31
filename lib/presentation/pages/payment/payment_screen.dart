import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/themes/app_theme.dart';
import '../../../domain/doctor/doctor_entity.dart';
import '../../constants/gap_constant.dart';
import '../../constants/medical_type.dart';
import '../../widgets/widgets.dart';
import 'widgets/payment_card.dart';
import 'widgets/schedule_date.dart';
import 'widgets/total_payment_card.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.doctorEntity});

  final DoctorEntity? doctorEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.currentThemeOf(context).gray50,
      appBar: AppBar(
        title: Text(L10n.of(context).translate.lblPayment),
      ),
      bottomNavigationBar: const PaymentCard(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Card(
              color: AppTheme.currentThemeOf(context).white,
              elevation: 0.05,
              child: Padding(
                padding: GapConstants.medium.allPadding,
                child: doctorEntity == null
                    ? const SizedBox.shrink()
                    : UserListTile(
                        entity: doctorEntity!,
                        medicalType: MedicalType.ear,
                      ),
              ),
            ),
          ),
          SliverPadding(
            padding: GapConstants.smallest.verticalPadding,
            sliver: const SliverToBoxAdapter(child: ScheduleDate()),
          ),
          SliverPadding(
            padding: GapConstants.smallest.verticalPadding,
            sliver: const SliverToBoxAdapter(
              child: PaymentMethodCard(),
            ),
          ),
          SliverPadding(
            padding: GapConstants.smallest.verticalPadding,
            sliver: const SliverToBoxAdapter(
              child: TotalPaymentCard(),
            ),
          ),
        ],
      ),
    );
  }
}
