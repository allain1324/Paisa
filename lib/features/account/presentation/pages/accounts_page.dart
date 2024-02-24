// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/account/data/model/account_model.dart';
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/account/presentation/pages/horizontal/account_horizontal_page.dart';
import 'package:paisa/main.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('accounts_mobile'),
      body: ValueListenableBuilder<Box<AccountModel>>(
        valueListenable: getIt.get<Box<AccountModel>>().listenable(),
        builder: (_, value, __) {
          final List<AccountEntity> accounts = value.toEntities();
          if (accounts.isEmpty) {
            return EmptyWidget(
              icon: Icons.credit_card,
              title: context.loc.emptyAccountMessageTitle,
              description: context.loc.emptyAccountMessageSubTitle,
            );
          }
          return AccountMobileHorizontalPage(accounts: accounts);
        },
      ),
    );
  }
}
