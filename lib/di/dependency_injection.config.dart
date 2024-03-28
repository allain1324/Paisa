// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/adapters.dart' as _i4;
import 'package:hive_flutter/hive_flutter.dart' as _i36;
import 'package:image_picker/image_picker.dart' as _i23;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i26;

import '../features/account/data/data_sources/account_data_source.dart' as _i40;
import '../features/account/data/model/account_model.dart' as _i7;
import '../features/account/data/repository/account_repository_impl.dart'
    as _i42;
import '../features/account/domain/repository/account_repository.dart' as _i41;
import '../features/account/domain/use_case/account_use_case.dart' as _i76;
import '../features/account/domain/use_case/add_account_use_case.dart' as _i43;
import '../features/account/domain/use_case/delete_account_use_case.dart'
    as _i52;
import '../features/account/domain/use_case/get_account_use_case.dart' as _i63;
import '../features/account/domain/use_case/get_accounts_use_case.dart' as _i64;
import '../features/account/domain/use_case/update_account_use_case.dart'
    as _i86;
import '../features/account/presentation/bloc/accounts_bloc.dart' as _i89;
import '../features/category/data/data_sources/category_data_source.dart'
    as _i12;
import '../features/category/data/model/category_model.dart' as _i6;
import '../features/category/data/repository/category_repository_impl.dart'
    as _i46;
import '../features/category/domain/repository/category_repository.dart'
    as _i45;
import '../features/category/domain/use_case/add_category_use_case.dart'
    as _i90;
import '../features/category/domain/use_case/category_use_case.dart' as _i75;
import '../features/category/domain/use_case/delete_category_use_case.dart'
    as _i53;
import '../features/category/domain/use_case/get_category_use_case.dart'
    as _i65;
import '../features/category/domain/use_case/get_default_categories_use_case.dart'
    as _i68;
import '../features/category/domain/use_case/update_category_use_case.dart'
    as _i87;
import '../features/category/presentation/bloc/category_bloc.dart' as _i95;
import '../features/debit/data/data_sources/debit_local_data_source_impl.dart'
    as _i15;
import '../features/debit/data/models/debit_model.dart' as _i8;
import '../features/debit/data/repository/debit_repository_impl.dart' as _i49;
import '../features/debit/domain/repository/debit_repository.dart' as _i48;
import '../features/debit/domain/use_case/add_debit_use.case.dart' as _i92;
import '../features/debit/domain/use_case/debit_use_case.dart' as _i97;
import '../features/debit/domain/use_case/delete_debit_use_case.dart' as _i56;
import '../features/debit/domain/use_case/get_debit_use_case.dart' as _i67;
import '../features/debit/domain/use_case/update_debit_use.case.dart' as _i88;
import '../features/debit/presentation/cubit/debts_bloc.dart' as _i96;
import '../features/debit_transaction/data/data_source/debit_transactions_data_store.dart'
    as _i16;
import '../features/debit_transaction/data/model/debit_transactions_model.dart'
    as _i11;
import '../features/debit_transaction/data/repository/debit_transaction_repo_impl.dart'
    as _i51;
import '../features/debit_transaction/domain/repository/debit_transaction_repository.dart'
    as _i50;
import '../features/debit_transaction/domain/use_case/add_debit_transaction_use_case.dart'
    as _i91;
import '../features/debit_transaction/domain/use_case/delete_debit_transaction_use_case.dart'
    as _i54;
import '../features/debit_transaction/domain/use_case/delete_debit_transactions_by_debit_id_use_case.dart'
    as _i55;
import '../features/debit_transaction/domain/use_case/get_debit_transactions_use_case.dart'
    as _i66;
import '../features/goals/data/data_source/goal_data_source.dart' as _i20;
import '../features/goals/data/models/goal_model.dart' as _i9;
import '../features/goals/data/repository/goal_repo_impl.dart' as _i22;
import '../features/goals/domain/repository/goal_repository.dart' as _i21;
import '../features/home/presentation/controller/summary_controller.dart'
    as _i33;
import '../features/home/presentation/pages/home/home_cubit.dart' as _i73;
import '../features/intro/data/repository/country_repository_impl.dart' as _i14;
import '../features/intro/domain/repository/country_repository.dart' as _i13;
import '../features/intro/domain/use_case/get_contries_user_case.dart' as _i18;
import '../features/intro/domain/use_case/get_selected_country_use_case.dart'
    as _i19;
import '../features/intro/domain/use_case/save_selected_country_use_case.dart'
    as _i29;
import '../features/intro/presentation/cubit/country_picker_cubit.dart' as _i47;
import '../features/profile/data/repository/profile_repository_impl.dart'
    as _i28;
import '../features/profile/domain/repository/profile_repository.dart' as _i27;
import '../features/profile/domain/use_case/image_picker_use_case.dart' as _i77;
import '../features/profile/domain/use_case/profile_use_case.dart' as _i81;
import '../features/profile/presentation/cubit/profile_cubit.dart' as _i80;
import '../features/recurring/data/data_sources/local_recurring_data_manager.dart'
    as _i24;
import '../features/recurring/data/data_sources/local_recurring_data_manager_impl.dart'
    as _i25;
import '../features/recurring/data/model/recurring.dart' as _i10;
import '../features/recurring/data/repository/recurring_repository_impl.dart'
    as _i83;
import '../features/recurring/domain/repository/recurring_repository.dart'
    as _i82;
import '../features/recurring/domain/use_case/add_recurring_use_case.dart'
    as _i93;
import '../features/recurring/domain/use_case/recurring_use_case.dart' as _i99;
import '../features/recurring/presentation/cubit/recurring_cubit.dart' as _i98;
import '../features/search/domain/use_case/filter_expense_use_case.dart'
    as _i84;
import '../features/search/presentation/cubit/search_cubit.dart' as _i100;
import '../features/settings/data/authenticate.dart' as _i3;
import '../features/settings/data/repository/csv_export_impl.dart' as _i61;
import '../features/settings/data/repository/json_export_import_impl.dart'
    as _i62;
import '../features/settings/data/repository/settings_repository_impl.dart'
    as _i31;
import '../features/settings/domain/repository/import_export.dart' as _i60;
import '../features/settings/domain/repository/settings_repository.dart'
    as _i30;
import '../features/settings/domain/use_case/csv_file_export_use_case.dart'
    as _i94;
import '../features/settings/domain/use_case/json_file_export_use_case.dart'
    as _i78;
import '../features/settings/domain/use_case/json_file_import_use_case.dart'
    as _i79;
import '../features/settings/domain/use_case/setting_use_case.dart' as _i34;
import '../features/settings/domain/use_case/settings_use_case.dart' as _i32;
import '../features/settings/presentation/cubit/settings_cubit.dart' as _i101;
import '../features/transaction/data/data_sources/local/transaction_data_manager.dart'
    as _i35;
import '../features/transaction/data/model/transaction_model.dart' as _i5;
import '../features/transaction/data/repository/transaction_repository_impl.dart'
    as _i38;
import '../features/transaction/domain/repository/transaction_repository.dart'
    as _i37;
import '../features/transaction/domain/use_case/add_transaction_use_case.dart'
    as _i44;
import '../features/transaction/domain/use_case/delete_transaction_from_category_id_use_case.dart'
    as _i59;
import '../features/transaction/domain/use_case/delete_transaction_use_case.dart'
    as _i57;
import '../features/transaction/domain/use_case/delete_transactions_by_account_id_use_case.dart'
    as _i58;
import '../features/transaction/domain/use_case/get_transaction_use_case.dart'
    as _i69;
import '../features/transaction/domain/use_case/get_transactions_by_account_id_use_case.dart'
    as _i70;
import '../features/transaction/domain/use_case/get_transactions_by_category_id_use_case.dart'
    as _i71;
import '../features/transaction/domain/use_case/get_transactions_use_case.dart'
    as _i72;
import '../features/transaction/domain/use_case/transaction_use_case.dart'
    as _i74;
import '../features/transaction/domain/use_case/update_expense_use_case.dart'
    as _i39;
import '../features/transaction/presentation/bloc/transaction_bloc.dart'
    as _i85;
import 'module/hive_module.dart' as _i102;
import 'module/service_module.dart' as _i103;

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
  final hiveBoxModule = _$HiveBoxModule();
  final serviceBoxModule = _$ServiceBoxModule();
  gh.lazySingleton<_i3.Authenticate>(() => _i3.Authenticate());
  await gh.lazySingletonAsync<_i4.Box<_i5.TransactionModel>>(
    () => hiveBoxModule.expenseBox,
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i4.Box<_i6.CategoryModel>>(
    () => hiveBoxModule.categoryBox,
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i4.Box<_i7.AccountModel>>(
    () => hiveBoxModule.accountBox,
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i4.Box<_i8.DebitModel>>(
    () => hiveBoxModule.debtsBox,
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i4.Box<dynamic>>(
    () => hiveBoxModule.boxDynamic,
    instanceName: 'settings',
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i4.Box<_i9.GoalModel>>(
    () => hiveBoxModule.goalBox,
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i4.Box<_i10.RecurringModel>>(
    () => hiveBoxModule.recurringBox,
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i4.Box<_i11.DebitTransactionsModel>>(
    () => hiveBoxModule.transactionsBox,
    preResolve: true,
  );
  gh.lazySingleton<_i12.CategoryDataSource>(() =>
      _i12.LocalCategoryManagerDataSourceImpl(
          gh<_i4.Box<_i6.CategoryModel>>()));
  gh.lazySingleton<_i13.CountryRepository>(() => _i14.CountryRepositoryImpl(
      gh<_i4.Box<dynamic>>(instanceName: 'settings')));
  gh.lazySingleton<_i15.DebtDataSource>(
      () => _i15.DebitDataSourceImpl(debtBox: gh<_i4.Box<_i8.DebitModel>>()));
  gh.lazySingleton<_i16.DebtTransactionDataSource>(() =>
      _i16.DebitTransactionDataStoreImpl(
          transactionsBox: gh<_i4.Box<_i11.DebitTransactionsModel>>()));
  gh.lazySingleton<_i17.DeviceInfoPlugin>(
      () => serviceBoxModule.providesDeviceInfoPlugin());
  gh.factory<_i18.GetCountriesUseCase>(
      () => _i18.GetCountriesUseCase(repository: gh<_i13.CountryRepository>()));
  gh.lazySingleton<_i19.GetSelectedCountryUseCase>(() =>
      _i19.GetSelectedCountryUseCase(repository: gh<_i13.CountryRepository>()));
  gh.lazySingleton<_i20.GoalDataSource>(() => _i20.GoalDataSourceImpl(
        goalBox: gh<_i4.Box<_i9.GoalModel>>(),
        transactionBox: gh<_i4.Box<_i11.DebitTransactionsModel>>(),
      ));
  gh.lazySingleton<_i21.GoalRepository>(() => _i22.GoalRepositoryImpl());
  gh.lazySingleton<_i23.ImagePicker>(
      () => serviceBoxModule.providesImagePicker());
  gh.factory<_i24.LocalRecurringDataManager>(() =>
      _i25.LocalRecurringDataManagerImpl(gh<_i4.Box<_i10.RecurringModel>>()));
  await gh.lazySingletonAsync<_i26.PackageInfo>(
    () => serviceBoxModule.providesPackageInfoPlugin(),
    preResolve: true,
  );
  gh.lazySingleton<_i27.ProfileRepository>(() => _i28.ProfileRepositoryImpl(
        gh<_i23.ImagePicker>(),
        gh<_i4.Box<dynamic>>(instanceName: 'settings'),
      ));
  gh.lazySingleton<_i29.SaveSelectedCountryUseCase>(() =>
      _i29.SaveSelectedCountryUseCase(
          repository: gh<_i13.CountryRepository>()));
  gh.factory<_i30.SettingsRepository>(() => _i31.SettingsRepositoryImpl(
      gh<_i4.Box<dynamic>>(instanceName: 'settings')));
  gh.lazySingleton<_i32.SettingsUseCase>(
      () => _i32.SettingsUseCase(gh<_i30.SettingsRepository>()));
  gh.lazySingleton<_i33.SummaryController>(
      () => _i33.SummaryController(gh<_i34.SettingsUseCase>()));
  gh.factory<_i35.TransactionDataSource>(() =>
      _i35.LocalTransactionManagerImpl(gh<_i36.Box<_i5.TransactionModel>>()));
  gh.lazySingleton<_i37.TransactionRepository>(() =>
      _i38.ExpenseRepositoryImpl(dataSource: gh<_i35.TransactionDataSource>()));
  gh.lazySingleton<_i39.UpdateTransactionUseCase>(() =>
      _i39.UpdateTransactionUseCase(
          expenseRepository: gh<_i37.TransactionRepository>()));
  gh.lazySingleton<_i40.AccountDataSource>(() =>
      _i40.AccountDataSourceImpl(accountBox: gh<_i4.Box<_i7.AccountModel>>()));
  gh.lazySingleton<_i41.AccountRepository>(() =>
      _i42.AccountRepositoryImpl(dataSource: gh<_i40.AccountDataSource>()));
  gh.lazySingleton<_i43.AddAccountUseCase>(() =>
      _i43.AddAccountUseCase(accountRepository: gh<_i41.AccountRepository>()));
  gh.lazySingleton<_i44.AddTransactionUseCase>(() => _i44.AddTransactionUseCase(
      expenseRepository: gh<_i37.TransactionRepository>()));
  gh.lazySingleton<_i45.CategoryRepository>(() => _i46.CategoryRepositoryImpl(
        dataSources: gh<_i12.CategoryDataSource>(),
        expenseDataManager: gh<_i35.TransactionDataSource>(),
      ));
  gh.factory<_i47.CountryPickerCubit>(() => _i47.CountryPickerCubit(
        gh<_i18.GetCountriesUseCase>(),
        gh<_i19.GetSelectedCountryUseCase>(),
        gh<_i29.SaveSelectedCountryUseCase>(),
      ));
  gh.lazySingleton<_i48.DebitRepository>(
      () => _i49.DebtRepositoryImpl(dataSource: gh<_i15.DebtDataSource>()));
  gh.lazySingleton<_i50.DebitTransactionRepository>(() =>
      _i51.DebitTransactionRepoImpl(
          dataStore: gh<_i16.DebtTransactionDataSource>()));
  gh.lazySingleton<_i52.DeleteAccountUseCase>(() => _i52.DeleteAccountUseCase(
      accountRepository: gh<_i41.AccountRepository>()));
  gh.lazySingleton<_i53.DeleteCategoryUseCase>(() => _i53.DeleteCategoryUseCase(
      categoryRepository: gh<_i45.CategoryRepository>()));
  gh.lazySingleton<_i54.DeleteDebitTransactionUseCase>(() =>
      _i54.DeleteDebitTransactionUseCase(
          debtRepository: gh<_i50.DebitTransactionRepository>()));
  gh.lazySingleton<_i55.DeleteDebitTransactionsByDebitIdUseCase>(() =>
      _i55.DeleteDebitTransactionsByDebitIdUseCase(
          debtRepository: gh<_i50.DebitTransactionRepository>()));
  gh.lazySingleton<_i56.DeleteDebitUseCase>(() =>
      _i56.DeleteDebitUseCase(debtRepository: gh<_i48.DebitRepository>()));
  gh.lazySingleton<_i57.DeleteTransactionUseCase>(() =>
      _i57.DeleteTransactionUseCase(
          expenseRepository: gh<_i37.TransactionRepository>()));
  gh.lazySingleton<_i58.DeleteTransactionsByAccountIdUseCase>(() =>
      _i58.DeleteTransactionsByAccountIdUseCase(
          expenseRepository: gh<_i37.TransactionRepository>()));
  gh.lazySingleton<_i59.DeleteTransactionsByCategoryIdUseCase>(() =>
      _i59.DeleteTransactionsByCategoryIdUseCase(
          transactionRepository: gh<_i37.TransactionRepository>()));
  gh.lazySingleton<_i60.Export>(
    () => _i61.CSVExport(
      gh<_i17.DeviceInfoPlugin>(),
      gh<_i40.AccountDataSource>(),
      gh<_i12.CategoryDataSource>(),
      gh<_i35.TransactionDataSource>(),
    ),
    instanceName: 'csv',
  );
  gh.lazySingleton<_i60.Export>(
    () => _i62.JSONExportImpl(
      gh<_i40.AccountDataSource>(),
      gh<_i12.CategoryDataSource>(),
      gh<_i35.TransactionDataSource>(),
      gh<_i15.DebtDataSource>(),
      gh<_i16.DebtTransactionDataSource>(),
      gh<_i26.PackageInfo>(),
    ),
    instanceName: 'json_export',
  );
  gh.lazySingleton<_i63.GetAccountUseCase>(() =>
      _i63.GetAccountUseCase(accountRepository: gh<_i41.AccountRepository>()));
  gh.lazySingleton<_i64.GetAccountsUseCase>(() =>
      _i64.GetAccountsUseCase(accountRepository: gh<_i41.AccountRepository>()));
  gh.lazySingleton<_i65.GetCategoryUseCase>(() => _i65.GetCategoryUseCase(
      categoryRepository: gh<_i45.CategoryRepository>()));
  gh.lazySingleton<_i66.GetDebitTransactionsUseCase>(() =>
      _i66.GetDebitTransactionsUseCase(
          debtRepository: gh<_i50.DebitTransactionRepository>()));
  gh.lazySingleton<_i67.GetDebitUseCase>(
      () => _i67.GetDebitUseCase(debtRepository: gh<_i48.DebitRepository>()));
  gh.lazySingleton<_i68.GetDefaultCategoriesUseCase>(() =>
      _i68.GetDefaultCategoriesUseCase(
          categoryRepository: gh<_i45.CategoryRepository>()));
  gh.lazySingleton<_i69.GetTransactionUseCase>(() => _i69.GetTransactionUseCase(
      transactionRepository: gh<_i37.TransactionRepository>()));
  gh.lazySingleton<_i70.GetTransactionsByAccountIdUseCase>(() =>
      _i70.GetTransactionsByAccountIdUseCase(
          expenseRepository: gh<_i37.TransactionRepository>()));
  gh.lazySingleton<_i71.GetTransactionsByCategoryIdUseCase>(() =>
      _i71.GetTransactionsByCategoryIdUseCase(
          expenseRepository: gh<_i37.TransactionRepository>()));
  gh.lazySingleton<_i72.GetTransactionsUseCase>(() =>
      _i72.GetTransactionsUseCase(
          expenseRepository: gh<_i37.TransactionRepository>()));
  gh.factory<_i73.HomeCubit>(() => _i73.HomeCubit(
        gh<_i74.GetTransactionsUseCase>(),
        gh<_i75.GetDefaultCategoriesUseCase>(),
        gh<_i76.GetAccountUseCase>(),
        gh<_i75.GetCategoryUseCase>(),
        gh<_i74.GetTransactionsByCategoryIdUseCase>(),
      ));
  gh.lazySingleton<_i77.ImagePickerUseCase>(
      () => _i77.ImagePickerUseCase(gh<_i27.ProfileRepository>()));
  gh.lazySingleton<_i60.Import>(
    () => _i62.JSONImportImpl(
      gh<_i17.DeviceInfoPlugin>(),
      gh<_i40.AccountDataSource>(),
      gh<_i12.CategoryDataSource>(),
      gh<_i35.TransactionDataSource>(),
      gh<_i15.DebtDataSource>(),
      gh<_i16.DebtTransactionDataSource>(),
    ),
    instanceName: 'json_import',
  );
  gh.lazySingleton<_i78.JSONFileExportUseCase>(() => _i78.JSONFileExportUseCase(
        gh<_i30.SettingsRepository>(),
        gh<_i60.Export>(instanceName: 'json_export'),
      ));
  gh.lazySingleton<_i79.JSONFileImportUseCase>(() => _i79.JSONFileImportUseCase(
        gh<_i30.SettingsRepository>(),
        gh<_i60.Import>(instanceName: 'json_import'),
      ));
  gh.factory<_i80.ProfileCubit>(() => _i80.ProfileCubit(
        gh<_i81.ImagePickerUseCase>(),
        gh<_i4.Box<dynamic>>(instanceName: 'settings'),
      ));
  gh.lazySingleton<_i82.RecurringRepository>(() => _i83.RecurringRepositoryImpl(
        gh<_i24.LocalRecurringDataManager>(),
        gh<_i35.TransactionDataSource>(),
      ));
  gh.lazySingleton<_i84.SearchUseCase>(
      () => _i84.SearchUseCase(gh<_i37.TransactionRepository>()));
  gh.factory<_i85.TransactionBloc>(() => _i85.TransactionBloc(
        gh<_i32.SettingsUseCase>(),
        getTransactionUseCase: gh<_i74.GetTransactionUseCase>(),
        accountUseCase: gh<_i76.GetAccountUseCase>(),
        addTransactionUseCase: gh<_i74.AddTransactionUseCase>(),
        deleteTransactionUseCase: gh<_i74.DeleteTransactionUseCase>(),
        updateTransactionUseCase: gh<_i74.UpdateTransactionUseCase>(),
        accountsUseCase: gh<_i76.GetAccountsUseCase>(),
        getDefaultCategoriesUseCase: gh<_i75.GetDefaultCategoriesUseCase>(),
      ));
  gh.lazySingleton<_i86.UpdateAccountUseCase>(() => _i86.UpdateAccountUseCase(
      accountRepository: gh<_i41.AccountRepository>()));
  gh.lazySingleton<_i87.UpdateCategoryUseCase>(() => _i87.UpdateCategoryUseCase(
      categoryRepository: gh<_i45.CategoryRepository>()));
  gh.lazySingleton<_i88.UpdateDebitUseCase>(() =>
      _i88.UpdateDebitUseCase(debtRepository: gh<_i48.DebitRepository>()));
  gh.factory<_i89.AccountBloc>(() => _i89.AccountBloc(
        getAccountUseCase: gh<_i76.GetAccountUseCase>(),
        deleteAccountUseCase: gh<_i76.DeleteAccountUseCase>(),
        getTransactionsByAccountIdUseCase:
            gh<_i74.GetTransactionsByAccountIdUseCase>(),
        addAccountUseCase: gh<_i76.AddAccountUseCase>(),
        getCategoryUseCase: gh<_i65.GetCategoryUseCase>(),
        deleteExpensesFromAccountIdUseCase:
            gh<_i74.DeleteTransactionsByAccountIdUseCase>(),
        updateAccountUseCase: gh<_i76.UpdateAccountUseCase>(),
      ));
  gh.lazySingleton<_i90.AddCategoryUseCase>(() => _i90.AddCategoryUseCase(
      categoryRepository: gh<_i45.CategoryRepository>()));
  gh.lazySingleton<_i91.AddDebitTransactionUseCase>(() =>
      _i91.AddDebitTransactionUseCase(
          debtRepository: gh<_i50.DebitTransactionRepository>()));
  gh.lazySingleton<_i92.AddDebitUseCase>(
      () => _i92.AddDebitUseCase(debtRepository: gh<_i48.DebitRepository>()));
  gh.lazySingleton<_i93.AddRecurringUseCase>(
      () => _i93.AddRecurringUseCase(gh<_i82.RecurringRepository>()));
  gh.lazySingleton<_i94.CSVFileExportUseCase>(() => _i94.CSVFileExportUseCase(
        gh<_i30.SettingsRepository>(),
        gh<_i60.Export>(instanceName: 'csv'),
      ));
  gh.factory<_i95.CategoryBloc>(() => _i95.CategoryBloc(
        getCategoryUseCase: gh<_i75.GetCategoryUseCase>(),
        addCategoryUseCase: gh<_i75.AddCategoryUseCase>(),
        deleteCategoryUseCase: gh<_i75.DeleteCategoryUseCase>(),
        deleteExpensesFromCategoryIdUseCase:
            gh<_i74.DeleteTransactionsByCategoryIdUseCase>(),
        updateCategoryUseCase: gh<_i75.UpdateCategoryUseCase>(),
      ));
  gh.factory<_i96.DebitBloc>(() => _i96.DebitBloc(
        addDebtUseCase: gh<_i97.AddDebitUseCase>(),
        getDebtUseCase: gh<_i97.GetDebitUseCase>(),
        getTransactionsUseCase: gh<_i66.GetDebitTransactionsUseCase>(),
        addTransactionUseCase: gh<_i91.AddDebitTransactionUseCase>(),
        updateDebtUseCase: gh<_i97.UpdateDebitUseCase>(),
        deleteDebtUseCase: gh<_i97.DeleteDebitUseCase>(),
        deleteDebitTransactionUseCase: gh<_i54.DeleteDebitTransactionUseCase>(),
        deleteDebitTransactionsByDebitIdUseCase:
            gh<_i55.DeleteDebitTransactionsByDebitIdUseCase>(),
      ));
  gh.factory<_i98.RecurringCubit>(
      () => _i98.RecurringCubit(gh<_i99.AddRecurringUseCase>()));
  gh.factory<_i100.SearchCubit>(
      () => _i100.SearchCubit(gh<_i84.SearchUseCase>()));
  gh.factory<_i101.SettingCubit>(() => _i101.SettingCubit(
        gh<_i74.GetTransactionsUseCase>(),
        gh<_i75.GetDefaultCategoriesUseCase>(),
        gh<_i74.UpdateTransactionUseCase>(),
        gh<_i34.JSONFileImportUseCase>(),
        gh<_i34.JSONFileExportUseCase>(),
        gh<_i34.SettingsUseCase>(),
        gh<_i34.CSVFileExportUseCase>(),
      ));
  return getIt;
}

class _$HiveBoxModule extends _i102.HiveBoxModule {}

class _$ServiceBoxModule extends _i103.ServiceBoxModule {}
