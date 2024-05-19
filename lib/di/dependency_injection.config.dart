// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/adapters.dart' as _i6;
import 'package:hive_flutter/hive_flutter.dart' as _i24;
import 'package:image_picker/image_picker.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i4;

import '../features/account/data/data_sources/account_data_source.dart' as _i17;
import '../features/account/data/model/account_model.dart' as _i8;
import '../features/account/data/repository/account_repository_impl.dart'
    as _i19;
import '../features/account/domain/repository/account_repository.dart' as _i18;
import '../features/account/domain/use_case/account_use_case.dart' as _i89;
import '../features/account/domain/use_case/add_account_use_case.dart' as _i35;
import '../features/account/domain/use_case/delete_account_use_case.dart'
    as _i34;
import '../features/account/domain/use_case/get_account_use_case.dart' as _i36;
import '../features/account/domain/use_case/get_accounts_use_case.dart' as _i37;
import '../features/account/domain/use_case/update_account_use_case.dart'
    as _i33;
import '../features/account/presentation/bloc/accounts_bloc.dart' as _i88;
import '../features/category/data/data_sources/category_data_source.dart'
    as _i25;
import '../features/category/data/model/category_model.dart' as _i9;
import '../features/category/data/repository/category_repository_impl.dart'
    as _i50;
import '../features/category/domain/repository/category_repository.dart'
    as _i49;
import '../features/category/domain/use_case/add_category_use_case.dart'
    as _i80;
import '../features/category/domain/use_case/category_use_case.dart' as _i92;
import '../features/category/domain/use_case/delete_category_use_case.dart'
    as _i81;
import '../features/category/domain/use_case/get_category_use_case.dart'
    as _i79;
import '../features/category/domain/use_case/get_default_categories_use_case.dart'
    as _i82;
import '../features/category/domain/use_case/update_category_use_case.dart'
    as _i83;
import '../features/category/presentation/bloc/category_bloc.dart' as _i98;
import '../features/debit/data/data_sources/debit_local_data_source_impl.dart'
    as _i20;
import '../features/debit/data/models/debit_model.dart' as _i10;
import '../features/debit/data/repository/debit_repository_impl.dart' as _i44;
import '../features/debit/domain/repository/debit_repository.dart' as _i43;
import '../features/debit/domain/use_case/add_debit_use.case.dart' as _i74;
import '../features/debit/domain/use_case/debit_use_case.dart' as _i97;
import '../features/debit/domain/use_case/delete_debit_use_case.dart' as _i72;
import '../features/debit/domain/use_case/get_debit_use_case.dart' as _i71;
import '../features/debit/domain/use_case/update_debit_use.case.dart' as _i73;
import '../features/debit/presentation/cubit/debts_bloc.dart' as _i96;
import '../features/debit_transaction/data/data_source/debit_transactions_data_store.dart'
    as _i27;
import '../features/debit_transaction/data/model/debit_transactions_model.dart'
    as _i11;
import '../features/debit_transaction/data/repository/debit_transaction_repo_impl.dart'
    as _i68;
import '../features/debit_transaction/domain/repository/debit_transaction_repository.dart'
    as _i67;
import '../features/debit_transaction/domain/use_case/add_debit_transaction_use_case.dart'
    as _i85;
import '../features/debit_transaction/domain/use_case/delete_debit_transaction_use_case.dart'
    as _i87;
import '../features/debit_transaction/domain/use_case/delete_debit_transactions_by_debit_id_use_case.dart'
    as _i86;
import '../features/debit_transaction/domain/use_case/get_debit_transactions_use_case.dart'
    as _i84;
import '../features/goals/data/data_source/goal_data_source.dart' as _i28;
import '../features/goals/data/models/goal_model.dart' as _i13;
import '../features/goals/data/repository/goal_repo_impl.dart' as _i16;
import '../features/goals/domain/repository/goal_repository.dart' as _i15;
import '../features/home/presentation/controller/summary_controller.dart'
    as _i53;
import '../features/home/presentation/pages/home/home_cubit.dart' as _i91;
import '../features/intro/data/repository/country_repository_impl.dart' as _i42;
import '../features/intro/domain/repository/country_repository.dart' as _i41;
import '../features/intro/domain/use_case/get_contries_user_case.dart' as _i77;
import '../features/intro/domain/use_case/get_selected_country_use_case.dart'
    as _i76;
import '../features/intro/domain/use_case/save_selected_country_use_case.dart'
    as _i75;
import '../features/intro/presentation/cubit/country_picker_cubit.dart'
    as _i101;
import '../features/profile/data/repository/profile_repository_impl.dart'
    as _i30;
import '../features/profile/domain/repository/profile_repository.dart' as _i29;
import '../features/profile/domain/use_case/image_picker_use_case.dart' as _i40;
import '../features/profile/domain/use_case/profile_use_case.dart' as _i65;
import '../features/profile/presentation/cubit/profile_cubit.dart' as _i64;
import '../features/recurring/data/data_sources/local_recurring_data_manager.dart'
    as _i31;
import '../features/recurring/data/data_sources/local_recurring_data_manager_impl.dart'
    as _i32;
import '../features/recurring/data/model/recurring.dart' as _i12;
import '../features/recurring/data/repository/recurring_repository_impl.dart'
    as _i39;
import '../features/recurring/domain/repository/recurring_repository.dart'
    as _i38;
import '../features/recurring/domain/use_case/add_recurring_use_case.dart'
    as _i70;
import '../features/recurring/domain/use_case/recurring_use_case.dart' as _i100;
import '../features/recurring/presentation/cubit/recurring_cubit.dart' as _i99;
import '../features/search/domain/use_case/filter_expense_use_case.dart'
    as _i78;
import '../features/search/presentation/cubit/search_cubit.dart' as _i95;
import '../features/settings/data/authenticate.dart' as _i14;
import '../features/settings/data/repository/csv_export_impl.dart' as _i63;
import '../features/settings/data/repository/json_export_import_impl.dart'
    as _i52;
import '../features/settings/data/repository/settings_repository_impl.dart'
    as _i22;
import '../features/settings/domain/repository/import_export.dart' as _i51;
import '../features/settings/domain/repository/settings_repository.dart'
    as _i21;
import '../features/settings/domain/use_case/csv_file_export_use_case.dart'
    as _i69;
import '../features/settings/domain/use_case/json_file_export_use_case.dart'
    as _i66;
import '../features/settings/domain/use_case/json_file_import_use_case.dart'
    as _i62;
import '../features/settings/domain/use_case/setting_use_case.dart' as _i54;
import '../features/settings/domain/use_case/settings_use_case.dart' as _i26;
import '../features/settings/presentation/cubit/settings_cubit.dart' as _i94;
import '../features/transaction/data/data_sources/local/transaction_data_manager.dart'
    as _i23;
import '../features/transaction/data/model/transaction_model.dart' as _i7;
import '../features/transaction/data/repository/transaction_repository_impl.dart'
    as _i46;
import '../features/transaction/domain/repository/transaction_repository.dart'
    as _i45;
import '../features/transaction/domain/use_case/add_transaction_use_case.dart'
    as _i61;
import '../features/transaction/domain/use_case/delete_transaction_from_category_id_use_case.dart'
    as _i47;
import '../features/transaction/domain/use_case/delete_transaction_use_case.dart'
    as _i57;
import '../features/transaction/domain/use_case/delete_transactions_by_account_id_use_case.dart'
    as _i60;
import '../features/transaction/domain/use_case/get_transaction_use_case.dart'
    as _i48;
import '../features/transaction/domain/use_case/get_transactions_by_account_id_use_case.dart'
    as _i55;
import '../features/transaction/domain/use_case/get_transactions_by_category_id_use_case.dart'
    as _i56;
import '../features/transaction/domain/use_case/get_transactions_use_case.dart'
    as _i58;
import '../features/transaction/domain/use_case/transaction_use_case.dart'
    as _i90;
import '../features/transaction/domain/use_case/update_expense_use_case.dart'
    as _i59;
import '../features/transaction/presentation/bloc/transaction_bloc.dart'
    as _i93;
import 'module/hive_module.dart' as _i103;
import 'module/service_module.dart' as _i102;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final serviceBoxModule = _$ServiceBoxModule();
  final hiveBoxModule = _$HiveBoxModule();
  gh.lazySingleton<_i3.DeviceInfoPlugin>(
      () => serviceBoxModule.providesDeviceInfoPlugin());
  await gh.lazySingletonAsync<_i4.PackageInfo>(
    () => serviceBoxModule.providesPackageInfoPlugin(),
    preResolve: true,
  );
  gh.lazySingleton<_i5.ImagePicker>(
      () => serviceBoxModule.providesImagePicker());
  await gh.lazySingletonAsync<_i6.Box<_i7.TransactionModel>>(
    () => hiveBoxModule.expenseBox(),
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i6.Box<_i8.AccountModel>>(
    () => hiveBoxModule.accountBox(),
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i6.Box<_i9.CategoryModel>>(
    () => hiveBoxModule.categoryBox(),
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i6.Box<_i10.DebitModel>>(
    () => hiveBoxModule.debtsBox(),
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i6.Box<_i11.DebitTransactionsModel>>(
    () => hiveBoxModule.transactionsBox(),
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i6.Box<_i12.RecurringModel>>(
    () => hiveBoxModule.recurringBox(),
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i6.Box<_i13.GoalModel>>(
    () => hiveBoxModule.goalBox(),
    preResolve: true,
  );
  gh.lazySingleton<_i14.Authenticate>(() => _i14.Authenticate());
  gh.lazySingleton<_i15.GoalRepository>(() => _i16.GoalRepositoryImpl());
  gh.lazySingleton<_i17.AccountDataSource>(() =>
      _i17.AccountDataSourceImpl(accountBox: gh<_i6.Box<_i8.AccountModel>>()));
  await gh.lazySingletonAsync<_i6.Box<dynamic>>(
    () => hiveBoxModule.boxDynamic(),
    instanceName: 'settings',
    preResolve: true,
  );
  gh.lazySingleton<_i18.AccountRepository>(() =>
      _i19.AccountRepositoryImpl(dataSource: gh<_i17.AccountDataSource>()));
  gh.lazySingleton<_i20.DebtDataSource>(
      () => _i20.DebitDataSourceImpl(debtBox: gh<_i6.Box<_i10.DebitModel>>()));
  gh.factory<_i21.SettingsRepository>(() => _i22.SettingsRepositoryImpl(
      gh<_i6.Box<dynamic>>(instanceName: 'settings')));
  gh.factory<_i23.TransactionDataSource>(() =>
      _i23.LocalTransactionManagerImpl(gh<_i24.Box<_i7.TransactionModel>>()));
  gh.lazySingleton<_i25.CategoryDataSource>(() =>
      _i25.LocalCategoryManagerDataSourceImpl(
          gh<_i6.Box<_i9.CategoryModel>>()));
  gh.lazySingleton<_i26.SettingsUseCase>(
      () => _i26.SettingsUseCase(gh<_i21.SettingsRepository>()));
  gh.lazySingleton<_i27.DebtTransactionDataSource>(() =>
      _i27.DebitTransactionDataStoreImpl(
          transactionsBox: gh<_i6.Box<_i11.DebitTransactionsModel>>()));
  gh.lazySingleton<_i28.GoalDataSource>(() => _i28.GoalDataSourceImpl(
        goalBox: gh<_i6.Box<_i13.GoalModel>>(),
        transactionBox: gh<_i6.Box<_i11.DebitTransactionsModel>>(),
      ));
  gh.lazySingleton<_i29.ProfileRepository>(() => _i30.ProfileRepositoryImpl(
        gh<_i5.ImagePicker>(),
        gh<_i6.Box<dynamic>>(instanceName: 'settings'),
      ));
  gh.factory<_i31.LocalRecurringDataManager>(() =>
      _i32.LocalRecurringDataManagerImpl(gh<_i6.Box<_i12.RecurringModel>>()));
  gh.lazySingleton<_i33.UpdateAccountUseCase>(() => _i33.UpdateAccountUseCase(
      accountRepository: gh<_i18.AccountRepository>()));
  gh.lazySingleton<_i34.DeleteAccountUseCase>(() => _i34.DeleteAccountUseCase(
      accountRepository: gh<_i18.AccountRepository>()));
  gh.lazySingleton<_i35.AddAccountUseCase>(() =>
      _i35.AddAccountUseCase(accountRepository: gh<_i18.AccountRepository>()));
  gh.lazySingleton<_i36.GetAccountUseCase>(() =>
      _i36.GetAccountUseCase(accountRepository: gh<_i18.AccountRepository>()));
  gh.lazySingleton<_i37.GetAccountsUseCase>(() =>
      _i37.GetAccountsUseCase(accountRepository: gh<_i18.AccountRepository>()));
  gh.lazySingleton<_i38.RecurringRepository>(() => _i39.RecurringRepositoryImpl(
        gh<_i31.LocalRecurringDataManager>(),
        gh<_i23.TransactionDataSource>(),
      ));
  gh.lazySingleton<_i40.ImagePickerUseCase>(
      () => _i40.ImagePickerUseCase(gh<_i29.ProfileRepository>()));
  gh.lazySingleton<_i41.CountryRepository>(() => _i42.CountryRepositoryImpl(
      gh<_i6.Box<dynamic>>(instanceName: 'settings')));
  gh.lazySingleton<_i43.DebitRepository>(
      () => _i44.DebtRepositoryImpl(dataSource: gh<_i20.DebtDataSource>()));
  gh.lazySingleton<_i45.TransactionRepository>(() =>
      _i46.ExpenseRepositoryImpl(dataSource: gh<_i23.TransactionDataSource>()));
  gh.lazySingleton<_i47.DeleteTransactionsByCategoryIdUseCase>(() =>
      _i47.DeleteTransactionsByCategoryIdUseCase(
          transactionRepository: gh<_i45.TransactionRepository>()));
  gh.lazySingleton<_i48.GetTransactionUseCase>(() => _i48.GetTransactionUseCase(
      transactionRepository: gh<_i45.TransactionRepository>()));
  gh.lazySingleton<_i49.CategoryRepository>(() => _i50.CategoryRepositoryImpl(
        dataSources: gh<_i25.CategoryDataSource>(),
        expenseDataManager: gh<_i23.TransactionDataSource>(),
      ));
  gh.lazySingleton<_i51.Import>(
    () => _i52.JSONImportImpl(
      gh<_i3.DeviceInfoPlugin>(),
      gh<_i17.AccountDataSource>(),
      gh<_i25.CategoryDataSource>(),
      gh<_i23.TransactionDataSource>(),
      gh<_i20.DebtDataSource>(),
      gh<_i27.DebtTransactionDataSource>(),
    ),
    instanceName: 'json_import',
  );
  gh.lazySingleton<_i53.SummaryController>(
      () => _i53.SummaryController(gh<_i54.SettingsUseCase>()));
  gh.lazySingleton<_i55.GetTransactionsByAccountIdUseCase>(() =>
      _i55.GetTransactionsByAccountIdUseCase(
          expenseRepository: gh<_i45.TransactionRepository>()));
  gh.lazySingleton<_i56.GetTransactionsByCategoryIdUseCase>(() =>
      _i56.GetTransactionsByCategoryIdUseCase(
          expenseRepository: gh<_i45.TransactionRepository>()));
  gh.lazySingleton<_i57.DeleteTransactionUseCase>(() =>
      _i57.DeleteTransactionUseCase(
          expenseRepository: gh<_i45.TransactionRepository>()));
  gh.lazySingleton<_i58.GetTransactionsUseCase>(() =>
      _i58.GetTransactionsUseCase(
          expenseRepository: gh<_i45.TransactionRepository>()));
  gh.lazySingleton<_i59.UpdateTransactionUseCase>(() =>
      _i59.UpdateTransactionUseCase(
          expenseRepository: gh<_i45.TransactionRepository>()));
  gh.lazySingleton<_i60.DeleteTransactionsByAccountIdUseCase>(() =>
      _i60.DeleteTransactionsByAccountIdUseCase(
          expenseRepository: gh<_i45.TransactionRepository>()));
  gh.lazySingleton<_i61.AddTransactionUseCase>(() => _i61.AddTransactionUseCase(
      expenseRepository: gh<_i45.TransactionRepository>()));
  gh.lazySingleton<_i51.Export>(
    () => _i52.JSONExportImpl(
      gh<_i17.AccountDataSource>(),
      gh<_i25.CategoryDataSource>(),
      gh<_i23.TransactionDataSource>(),
      gh<_i20.DebtDataSource>(),
      gh<_i27.DebtTransactionDataSource>(),
      gh<_i4.PackageInfo>(),
    ),
    instanceName: 'json_export',
  );
  gh.lazySingleton<_i62.JSONFileImportUseCase>(() => _i62.JSONFileImportUseCase(
        gh<_i21.SettingsRepository>(),
        gh<_i51.Import>(instanceName: 'json_import'),
      ));
  gh.lazySingleton<_i51.Export>(
    () => _i63.CSVExport(
      gh<_i3.DeviceInfoPlugin>(),
      gh<_i17.AccountDataSource>(),
      gh<_i25.CategoryDataSource>(),
      gh<_i23.TransactionDataSource>(),
    ),
    instanceName: 'csv',
  );
  gh.factory<_i64.ProfileCubit>(() => _i64.ProfileCubit(
        gh<_i65.ImagePickerUseCase>(),
        gh<_i6.Box<dynamic>>(instanceName: 'settings'),
      ));
  gh.lazySingleton<_i66.JSONFileExportUseCase>(() => _i66.JSONFileExportUseCase(
        gh<_i21.SettingsRepository>(),
        gh<_i51.Export>(instanceName: 'json_export'),
      ));
  gh.lazySingleton<_i67.DebitTransactionRepository>(() =>
      _i68.DebitTransactionRepoImpl(
          dataStore: gh<_i27.DebtTransactionDataSource>()));
  gh.lazySingleton<_i69.CSVFileExportUseCase>(() => _i69.CSVFileExportUseCase(
        gh<_i21.SettingsRepository>(),
        gh<_i51.Export>(instanceName: 'csv'),
      ));
  gh.lazySingleton<_i70.AddRecurringUseCase>(
      () => _i70.AddRecurringUseCase(gh<_i38.RecurringRepository>()));
  gh.lazySingleton<_i71.GetDebitUseCase>(
      () => _i71.GetDebitUseCase(debtRepository: gh<_i43.DebitRepository>()));
  gh.lazySingleton<_i72.DeleteDebitUseCase>(() =>
      _i72.DeleteDebitUseCase(debtRepository: gh<_i43.DebitRepository>()));
  gh.lazySingleton<_i73.UpdateDebitUseCase>(() =>
      _i73.UpdateDebitUseCase(debtRepository: gh<_i43.DebitRepository>()));
  gh.lazySingleton<_i74.AddDebitUseCase>(
      () => _i74.AddDebitUseCase(debtRepository: gh<_i43.DebitRepository>()));
  gh.lazySingleton<_i75.SaveSelectedCountryUseCase>(() =>
      _i75.SaveSelectedCountryUseCase(
          repository: gh<_i41.CountryRepository>()));
  gh.lazySingleton<_i76.GetSelectedCountryUseCase>(() =>
      _i76.GetSelectedCountryUseCase(repository: gh<_i41.CountryRepository>()));
  gh.factory<_i77.GetCountriesUseCase>(
      () => _i77.GetCountriesUseCase(repository: gh<_i41.CountryRepository>()));
  gh.lazySingleton<_i78.SearchUseCase>(
      () => _i78.SearchUseCase(gh<_i45.TransactionRepository>()));
  gh.lazySingleton<_i79.GetCategoryUseCase>(() => _i79.GetCategoryUseCase(
      categoryRepository: gh<_i49.CategoryRepository>()));
  gh.lazySingleton<_i80.AddCategoryUseCase>(() => _i80.AddCategoryUseCase(
      categoryRepository: gh<_i49.CategoryRepository>()));
  gh.lazySingleton<_i81.DeleteCategoryUseCase>(() => _i81.DeleteCategoryUseCase(
      categoryRepository: gh<_i49.CategoryRepository>()));
  gh.lazySingleton<_i82.GetDefaultCategoriesUseCase>(() =>
      _i82.GetDefaultCategoriesUseCase(
          categoryRepository: gh<_i49.CategoryRepository>()));
  gh.lazySingleton<_i83.UpdateCategoryUseCase>(() => _i83.UpdateCategoryUseCase(
      categoryRepository: gh<_i49.CategoryRepository>()));
  gh.lazySingleton<_i84.GetDebitTransactionsUseCase>(() =>
      _i84.GetDebitTransactionsUseCase(
          debtRepository: gh<_i67.DebitTransactionRepository>()));
  gh.lazySingleton<_i85.AddDebitTransactionUseCase>(() =>
      _i85.AddDebitTransactionUseCase(
          debtRepository: gh<_i67.DebitTransactionRepository>()));
  gh.lazySingleton<_i86.DeleteDebitTransactionsByDebitIdUseCase>(() =>
      _i86.DeleteDebitTransactionsByDebitIdUseCase(
          debtRepository: gh<_i67.DebitTransactionRepository>()));
  gh.lazySingleton<_i87.DeleteDebitTransactionUseCase>(() =>
      _i87.DeleteDebitTransactionUseCase(
          debtRepository: gh<_i67.DebitTransactionRepository>()));
  gh.factory<_i88.AccountBloc>(() => _i88.AccountBloc(
        getAccountUseCase: gh<_i89.GetAccountUseCase>(),
        deleteAccountUseCase: gh<_i89.DeleteAccountUseCase>(),
        getTransactionsByAccountIdUseCase:
            gh<_i90.GetTransactionsByAccountIdUseCase>(),
        addAccountUseCase: gh<_i89.AddAccountUseCase>(),
        getCategoryUseCase: gh<_i79.GetCategoryUseCase>(),
        deleteExpensesFromAccountIdUseCase:
            gh<_i90.DeleteTransactionsByAccountIdUseCase>(),
        updateAccountUseCase: gh<_i89.UpdateAccountUseCase>(),
      ));
  gh.factory<_i91.HomeCubit>(() => _i91.HomeCubit(
        gh<_i90.GetTransactionsUseCase>(),
        gh<_i92.GetDefaultCategoriesUseCase>(),
        gh<_i89.GetAccountUseCase>(),
        gh<_i92.GetCategoryUseCase>(),
        gh<_i90.GetTransactionsByCategoryIdUseCase>(),
      ));
  gh.factory<_i93.TransactionBloc>(() => _i93.TransactionBloc(
        gh<_i26.SettingsUseCase>(),
        getTransactionUseCase: gh<_i90.GetTransactionUseCase>(),
        accountUseCase: gh<_i89.GetAccountUseCase>(),
        addTransactionUseCase: gh<_i90.AddTransactionUseCase>(),
        deleteTransactionUseCase: gh<_i90.DeleteTransactionUseCase>(),
        updateTransactionUseCase: gh<_i90.UpdateTransactionUseCase>(),
        accountsUseCase: gh<_i89.GetAccountsUseCase>(),
        getDefaultCategoriesUseCase: gh<_i92.GetDefaultCategoriesUseCase>(),
      ));
  gh.factory<_i94.SettingCubit>(() => _i94.SettingCubit(
        gh<_i90.GetTransactionsUseCase>(),
        gh<_i92.GetDefaultCategoriesUseCase>(),
        gh<_i90.UpdateTransactionUseCase>(),
        gh<_i54.JSONFileImportUseCase>(),
        gh<_i54.JSONFileExportUseCase>(),
        gh<_i54.SettingsUseCase>(),
        gh<_i54.CSVFileExportUseCase>(),
      ));
  gh.factory<_i95.SearchCubit>(
      () => _i95.SearchCubit(gh<_i78.SearchUseCase>()));
  gh.factory<_i96.DebitBloc>(() => _i96.DebitBloc(
        addDebtUseCase: gh<_i97.AddDebitUseCase>(),
        getDebtUseCase: gh<_i97.GetDebitUseCase>(),
        getTransactionsUseCase: gh<_i84.GetDebitTransactionsUseCase>(),
        addTransactionUseCase: gh<_i85.AddDebitTransactionUseCase>(),
        updateDebtUseCase: gh<_i97.UpdateDebitUseCase>(),
        deleteDebtUseCase: gh<_i97.DeleteDebitUseCase>(),
        deleteDebitTransactionUseCase: gh<_i87.DeleteDebitTransactionUseCase>(),
        deleteDebitTransactionsByDebitIdUseCase:
            gh<_i86.DeleteDebitTransactionsByDebitIdUseCase>(),
      ));
  gh.factory<_i98.CategoryBloc>(() => _i98.CategoryBloc(
        getCategoryUseCase: gh<_i92.GetCategoryUseCase>(),
        addCategoryUseCase: gh<_i92.AddCategoryUseCase>(),
        deleteCategoryUseCase: gh<_i92.DeleteCategoryUseCase>(),
        deleteExpensesFromCategoryIdUseCase:
            gh<_i90.DeleteTransactionsByCategoryIdUseCase>(),
        updateCategoryUseCase: gh<_i92.UpdateCategoryUseCase>(),
      ));
  gh.factory<_i99.RecurringCubit>(
      () => _i99.RecurringCubit(gh<_i100.AddRecurringUseCase>()));
  gh.factory<_i101.CountryPickerCubit>(() => _i101.CountryPickerCubit(
        gh<_i77.GetCountriesUseCase>(),
        gh<_i76.GetSelectedCountryUseCase>(),
        gh<_i75.SaveSelectedCountryUseCase>(),
      ));
  return getIt;
}

class _$ServiceBoxModule extends _i102.ServiceBoxModule {}

class _$HiveBoxModule extends _i103.HiveBoxModule {}
