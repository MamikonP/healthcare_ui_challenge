import 'package:flutter/material.dart';

import '../../../core/l10n/l10n.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).translate.lblPayment),
      ),
    );
  }
}
