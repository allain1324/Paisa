// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:quick_actions/quick_actions.dart';

// Project imports:
import 'package:paisa/config/routes.dart';
import 'package:paisa/core/enum/transaction_type.dart';
import 'package:paisa/di/dependency_injection.config.dart';
import 'package:paisa/di/module/hive_module.dart';

@InjectableInit(
  asExtension: false,
  preferRelativeImports: true,
  throwOnMissingDependencies: true,
)
Future<GetIt> configInjector(
  GetIt getIt, {
  String? env,
  EnvironmentFilter? environmentFilter,
}) async {
  usePathUrlStrategy();
  await HiveAdapters().initHive();
  if (TargetPlatform.android == defaultTargetPlatform) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  return init(
    getIt,
    environmentFilter: environmentFilter,
    environment: env,
  );
}

Future<void> initAppShortcuts() async {
  const QuickActions quickActions = QuickActions();
  await quickActions.initialize((String shortcutType) {
    goRouter.go(const LandingPageData().location);
    goRouter.push(TransactionPageData(
      transactionType: shortcutType == 'ic_expense'
          ? TransactionType.expense
          : shortcutType == 'ic_income'
              ? TransactionType.income
              : shortcutType == 'ic_transfer'
                  ? TransactionType.transfer
                  : TransactionType.income,
    ).location);
  });
  await quickActions.setShortcutItems([
    const ShortcutItem(
      type: 'ic_income',
      localizedTitle: 'Income',
      icon: 'ic_income',
    ),
    const ShortcutItem(
      type: 'ic_expense',
      localizedTitle: 'Expense',
      icon: 'ic_expense',
    ),
    const ShortcutItem(
      type: 'ic_transfer',
      localizedTitle: 'Transfer',
      icon: 'ic_transfer',
    ),
  ]);
}
