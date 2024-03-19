import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/gap_constant.dart';
import '../../widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            forceElevated: true,
            elevation: Theme.of(context).appBarTheme.elevation,
            scrolledUnderElevation: Theme.of(context).appBarTheme.elevation,
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: GapConstants.medium.allPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: HeaderWidget(
                      title: L10n.of(context).translate.lblLoginTitle,
                      description:
                          L10n.of(context).translate.lblLoginDescription,
                    ),
                  ),
                  GapConstants.larger.verticalSpace,
                  TextFieldWidget(
                      title: L10n.of(context).translate.lblEmailOrUsername),
                  GapConstants.large.verticalSpace,
                  TextFieldWidget(
                      obscureText: true,
                      title: L10n.of(context).translate.lblPassword),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          L10n.of(context).translate.lblForgotPassword,
                          style: AppTheme.currentThemeOf(context).regular1,
                        )),
                  ),
                  LoadingButton(
                      text: L10n.of(context).translate.btnSignIn,
                      onStopLoading: () =>
                          Navigator.pushNamed(context, AppRoutes.home),
                      onTap: () async {
                        await Future.delayed(const Duration(seconds: 3));
                      }),
                  GapConstants.larger.verticalSpace,
                  SocialButton.google(),
                  GapConstants.medium.verticalSpace,
                  SocialButton.apple(),
                  GapConstants.large.verticalSpace,
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text:
                                  '${L10n.of(context).translate.lblDontHaveAnAccount} ',
                              style: TextStyle(
                                  color: AppTheme.currentThemeOf(context)
                                      .typography900)),
                          TextSpan(
                              text: L10n.of(context).translate.lblRegister,
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              style: TextStyle(
                                  color: AppTheme.currentThemeOf(context)
                                      .colorScheme
                                      .primary))
                        ]),
                      ),
                    ),
                  ),
                  GapConstants.large.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
