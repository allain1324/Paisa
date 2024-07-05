// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Project imports:
import 'package:paisa/app.dart';
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/di/dependency_injection.dart';
import 'package:paisa/features/account/data/data_sources/account_data_source.dart';
import 'package:paisa/features/account/data/model/account_model.dart';
import 'package:paisa/features/category/data/data_sources/category_data_source.dart';
import 'package:paisa/features/category/data/model/category_model.dart';
import 'package:paisa/features/recurring/domain/repository/recurring_repository.dart';
import 'package:paisa/features/transaction/data/data_sources/local/transaction_data_manager.dart';
import 'package:paisa/features/transaction/data/model/transaction_model.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configInjector(getIt);
  getIt<RecurringRepository>().checkForRecurring();

  runApp(const PaisaApp());

  if (TargetPlatform.android == defaultTargetPlatform ||
      TargetPlatform.iOS == defaultTargetPlatform) {
    initAppShortcuts();
  }
  _addDummyData();
}

void _addDummyData() async {
  final accountDataSource = getIt<AccountDataSource>();
  final categoryDataSource = getIt<CategoryDataSource>();
  final transactionDataSource = getIt<TransactionDataSource>();

  await accountDataSource.clear();
  await categoryDataSource.clear();
  await transactionDataSource.clear();
  List<String> names = [
    'Home & Living',
    'Health & Wellness',
    'Technology & Gadgets',
    'Food & Dining',
    'Travel & Adventure',
    'Fashion & Accessories',
    'Education & Learning',
    'Entertainment & Media',
    'Finance & Investments',
    'Sports & Fitness'
  ];
  for (int i = 0; i < 10; i++) {
    await accountDataSource.add(
      AccountModel(
        bankName: 'Bank Name $i',
        name: 'Holder name $i',
        cardType: CardType.values[Random().nextInt(3)],
        color:
            Colors.primaries[Random().nextInt(Colors.primaries.length)].value,
      ),
    );

    await categoryDataSource.add(
      CategoryModel(
        name: names[Random().nextInt(names.length)],
        color:
            Colors.primaries[Random().nextInt(Colors.primaries.length)].value,
        icon: MdiIcons.getIcons()[Random().nextInt(MdiIcons.getIcons().length)]
            .codePoint,
      ),
    );
  }
  final random = Random();
  final startDate = DateTime(
    2024,
  );
  final endDate = DateTime.now();

  for (int i = 0; i < 1000; i++) {
    int accountId = Random().nextInt(10);
    int categoryId = Random().nextInt(10);
    final difference = endDate.difference(startDate).inDays;
    final randomDay = random.nextInt(difference);
    final randomDate = startDate.add(Duration(days: randomDay));
    await transactionDataSource.add(TransactionModel(
      name: names[Random().nextInt(names.length)],
      time: randomDate,
      accountId: accountId,
      categoryId: categoryId,
      currency: Random().nextDouble() * 100000,
      type: TransactionType.values[Random().nextInt(2)],
    ));
  }
}
