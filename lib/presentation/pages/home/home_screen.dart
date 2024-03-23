import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/assets_text.dart';
import '../../../core/extensions/number_extension.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/appointment_type.dart';
import '../../constants/constants.dart';
import '../../constants/gap_constant.dart';
import '../../widgets/widgets.dart';
import 'widgets/appointment_card.dart';
import 'widgets/virus_card.dart';

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
                  Expanded(
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
              padding: GapConstants.medium.verticalPadding,
              sliver: SliverToBoxAdapter(
                child: SearchField(
                  hintText: L10n.of(context).translate.lblSymptomsAndDiseases,
                  onFilter: () {},
                ),
              ),
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
            SliverPadding(
              padding: GapConstants.large.verticalPadding,
              sliver: SliverToBoxAdapter(
                  child: SizedBox(
                width: double.infinity,
                height: Constants.virusCardHeight,
                child: HorizontalListViewBuilder(
                  builder: (context, index) => [
                    VirusCard(
                        AppTheme.currentThemeOf(context).colorScheme.primary),
                    VirusCard(
                        AppTheme.currentThemeOf(context).colorScheme.error),
                  ][index], // TODO: update
                  itemExtent:
                      MediaQuery.sizeOf(context).width - GapConstants.largest,
                  itemCount: 2,
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
