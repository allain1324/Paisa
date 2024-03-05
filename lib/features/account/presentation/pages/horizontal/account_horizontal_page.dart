// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_builder/responsive_builder.dart';

// Project imports:
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/account/presentation/pages/horizontal/accounts_mobile_page.dart';
import 'package:paisa/features/account/presentation/pages/horizontal/accounts_tablet_page.dart';

class AccountHorizontalPage extends StatelessWidget {
  const AccountHorizontalPage({
    super.key,
    required this.accounts,
  });

  final List<AccountEntity> accounts;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (p0) => AccountsHorizontalMobilePage(accounts: accounts),
      tablet: (p0) => AccountsHorizontalTabletPage(accounts: accounts),
    );
  }
}
