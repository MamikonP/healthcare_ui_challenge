import 'package:flutter/cupertino.dart';
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
import '../../constants/medical_type.dart';
import '../../widgets/buttons/app_button.dart';
import '../../widgets/widgets.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.currentThemeOf(context).primary600,
      body: Padding(
        padding: (GapConstants.extraLarge * 2).topPadding.copyWith(
              left: GapConstants.large,
              right: GapConstants.large,
              bottom: GapConstants.largest,
            ),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: Constants.mediumBorderRadius.allRadius,
                  child: AssetImageWidget.png(
                    imageName: AssetsText.imgSucessBackground,
                    boxFit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: -60,
                child: Center(
                  child: Container(
                    padding: GapConstants.medium.allPadding,
                    decoration: BoxDecoration(
                      borderRadius: Constants.largeBorderRadius.allRadius,
                      color: AppTheme.currentThemeOf(context)
                          .colorScheme
                          .background,
                    ),
                    child:
                        AssetImageWidget.png(imageName: AssetsText.imgSucess),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: GapConstants.medium.allPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      HeaderWidget(
                        title: 'You have successfully made an appointment',
                        description:
                            'The appointment confirmation has been send to your email.',
                        textAlign: TextAlign.center,
                      ),
                      GapConstants.large.verticalSpace,
                      CircleAvatar(
                        child: Text('A'),
                      ),
                      GapConstants.smaller.verticalSpace,
                      HeaderWidget(
                        title: 'Dr. Stone Gaze',
                        description: MedicalType.ear.toTitle(context),
                        titleStyle: AppTheme.currentThemeOf(context).title3,
                        descriptionStyle: AppTheme.currentThemeOf(context)
                            .regular2
                            .copyWith(
                                color: AppTheme.currentThemeOf(context)
                                    .typography500),
                        textAlign: TextAlign.center,
                      ),
                      GapConstants.medium.verticalSpace,
                      ListTile(
                        contentPadding: GapConstants.zero.allPadding,
                        leading: IconWithBackground(
                          assetIcon: AppointmentType.book.toIcon(context),
                          padding: GapConstants.smaller + GapConstants.smallest,
                          backgroundColor: AppointmentType.book
                              .toIconBackgroundColor(context)
                              .withOpacity(0.8),
                          border: Border.all(
                              color: AppointmentType.book
                                  .toIconBackgroundColor(context)),
                        ), // TODO: update hardcoded appointment type
                        title: Text(
                          L10n.of(context).translate.lblAppointment,
                          style: AppTheme.currentThemeOf(context)
                              .regular2
                              .copyWith(
                                  color: AppTheme.currentThemeOf(context)
                                      .typography700),
                        ),
                        subtitle: Text('Wednesday, 10 Jan 2024, 11:00',
                            style: AppTheme.currentThemeOf(context).subtitle1),
                      ),
                      const Spacer(),
                      AppButton(
                        backgroundColor: AppTheme.currentThemeOf(context)
                            .colorScheme
                            .primary,
                        radius: Constants.borderRadius,
                        child: Text(
                          L10n.of(context).translate.btnBackToHome,
                          style: AppTheme.currentThemeOf(context)
                              .subtitle1
                              .copyWith(
                                  color: AppTheme.currentThemeOf(context)
                                      .colorScheme
                                      .onPrimary),
                        ),
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context, AppRoutes.home, (route) => false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
