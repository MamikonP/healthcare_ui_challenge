import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/extensions/number_extension.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../constants/constants.dart';
import '../../../constants/gap_constant.dart';
import '../../../widgets/widgets.dart';

class BookAppointmentContent extends StatelessWidget {
  const BookAppointmentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HeaderWidget(
            title: 'Medical Specialties',
            description: "Wide selection of doctor's specialties",
            titleStyle: AppTheme.currentThemeOf(context).title3,
            descriptionStyle: AppTheme.currentThemeOf(context)
                .regular2
                .copyWith(
                    color: AppTheme.currentThemeOf(context).typography500),
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
          sliver: SliverAnimatedList(
            initialItemCount: 4,
            itemBuilder: (context, index, animation) => ListTile(
              contentPadding: GapConstants.zero.allPadding,
              leading: CircleAvatar(
                child: Text('A'),
              ),
              title: Text('Ear, Nose & throat'),
              subtitle: Text("Wide selection of doctor's"),
              trailing: RotatedBox(
                quarterTurns: 2,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppTheme.currentThemeOf(context).colorScheme.primary,
                  size: Constants.iconMediumSize,
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'See more',
                  style: AppTheme.currentThemeOf(context).subtitle1.copyWith(
                        color: AppTheme.currentThemeOf(context)
                            .colorScheme
                            .primary,
                      ),
                ),
                GapConstants.medium.horizontalSpace,
                RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppTheme.currentThemeOf(context).colorScheme.primary,
                    size: Constants.iconMediumSize,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
