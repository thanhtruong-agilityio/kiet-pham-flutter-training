import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class BankingAndPaymentCard extends StatelessWidget {
  const BankingAndPaymentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTResponsive.of(context);
    final i10n = S.of(context);

    return Container(
      height: device.scale(194),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: device.scale(27)),
          GTText.titleSmall(context, text: i10n.profileScreenBankingAndPayment),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                SvgPicture.asset(
                  GTAssets.icPayment,
                  height: 20,
                  width: 20,
                ),
                SizedBox(width: device.scale(15)),
                GTText.labelMedium(
                  context,
                  text: i10n.profileScreenPaymentMethod,
                  color: colorScheme.surfaceTint,
                ),
                const Spacer(),
                SvgPicture.asset(
                  GTAssets.icArrowNext,
                  height: 11,
                )
              ],
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: colorScheme.onSecondaryContainer,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                SvgPicture.asset(
                  GTAssets.icPrivacy,
                  height: 20,
                  width: 20,
                ),
                SizedBox(width: device.scale(15)),
                GTText.labelMedium(
                  context,
                  text: i10n.profileScreenPrivacyPolicy,
                  color: colorScheme.surfaceTint,
                ),
                const Spacer(),
                SvgPicture.asset(
                  GTAssets.icArrowNext,
                  height: 11,
                )
              ],
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: colorScheme.onSecondaryContainer,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                SvgPicture.asset(
                  GTAssets.icTerms,
                  height: 20,
                  width: 20,
                ),
                SizedBox(width: device.scale(15)),
                GTText.labelMedium(
                  context,
                  text: i10n.profileScreenTermsOfUse,
                  color: colorScheme.surfaceTint,
                ),
                const Spacer(),
                SvgPicture.asset(
                  GTAssets.icArrowNext,
                  height: 11,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
