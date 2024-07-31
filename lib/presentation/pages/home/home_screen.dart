import 'package:flutter/material.dart';

import '../../../core/assets_text.dart';
import '../../../core/extensions/number_extension.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/appointment_type.dart';
import '../../constants/gap_constant.dart';
import '../../widgets/general/sliding_cards_view.dart';
import '../../widgets/widgets.dart';
import 'widgets/appointment_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final appointmentTypes = [
    AppointmentType.book,
    AppointmentType.qr,
    AppointmentType.consultation,
    AppointmentType.pharmacy,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: GapConstants.medium.allPadding,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: kToolbarHeight.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  const Expanded(
                    child: HeaderWidget(
                      title: 'Hi Dwiky!',
                      description: 'May you always in a good condition',
                    ),
                  ),
                  IconWithBackground(
                    assetIcon: AssetsText.icBell,
                    padding: GapConstants.smaller + GapConstants.smallest,
                    backgroundColor: AppTheme.currentThemeOf(context).gray50,
                    border: Border.all(
                        color: AppTheme.currentThemeOf(context).gray200),
                    onTap: () {},
                  )
                ],
              ),
            ),
            SliverPadding(
              padding: GapConstants.large.verticalPadding,
              sliver: const SliverToBoxAdapter(child: SlidingCardsView()),
            ),
            SliverPadding(
              padding: GapConstants.large.verticalPadding,
              sliver: SliverAnimatedGrid(
                initialItemCount: appointmentTypes.length,
                itemBuilder: (context, index, animation) => AppointmentCard(
                  appointmentType: appointmentTypes[index],
                  onCardTap: (appointmentType) => Navigator.pushNamed(
                    context,
                    AppRoutes.appointment,
                    arguments: appointmentType,
                  ),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: GapConstants.small,
                  crossAxisSpacing: GapConstants.small,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
