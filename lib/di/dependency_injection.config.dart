// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i18;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/adapters.dart' as _i4;
import 'package:hive_flutter/hive_flutter.dart' as _i29;
import 'package:image_picker/image_picker.dart' as _i22;
import 'package:in_app_review/in_app_review.dart' as _i23;
import 'package:injectable/injectable.dart' as _i2;

import '../core/in_app.dart' as _i80;
import '../features/account/data/data_sources/account_data_manager.dart'
    as _i44;
import '../features/account/data/model/account_model.dart' as _i6;
import '../features/account/data/repository/account_repository_impl.dart'
    as _i46;
import '../features/account/domain/repository/account_repository.dart' as _i45;
import '../features/account/domain/use_case/account_use_case.dart' as _i78;
import '../features/account/domain/use_case/add_account_use_case.dart' as _i47;
import '../features/account/domain/use_case/delete_account_use_case.dart'
    as _i56;
import '../features/account/domain/use_case/get_account_use_case.dart' as _i66;
import '../features/account/domain/use_case/get_accounts_use_case.dart' as _i67;
import '../features/account/domain/use_case/update_account_use_case.dart'
    as _i90;
import '../features/account/presentation/bloc/accounts_bloc.dart' as _i93;
import '../features/category/data/data_sources/local/category_data_source.dart'
    as _i24;
import '../features/category/data/model/category_model.dart' as _i7;
import '../features/category/data/repository/category_repository_impl.dart'
    as _i52;
import '../features/category/domain/repository/category_repository.dart'
    as _i51;
import '../features/category/domain/use_case/add_category_use_case.dart'
    as _i94;
import '../features/category/domain/use_case/category_use_case.dart' as _i77;
import '../features/category/domain/use_case/delete_category_use_case.dart'
    as _i57;
import '../features/category/domain/use_case/get_category_use_case.dart'
    as _i68;
import '../features/category/domain/use_case/get_default_categories_use_case.dart'
    as _i70;
import '../features/category/domain/use_case/update_category_use_case.dart'
    as _i91;
import '../features/category/presentation/bloc/category_bloc.dart' as _i97;
import '../features/debit/data/data_sources/debit_local_data_source_impl.dart'
    as _i25;
import '../features/debit/data/models/debit_model.dart' as _i8;
import '../features/debit/data/repository/debit_repository_impl.dart' as _i55;
import '../features/debit/domain/repository/debit_repository.dart' as _i54;
import '../features/debit/domain/use_case/add_debit_use.case.dart' as _i95;
import '../features/debit/domain/use_case/debit_use_case.dart' as _i99;
import '../features/debit/domain/use_case/delete_debit_use_case.dart' as _i58;
import '../features/debit/domain/use_case/get_debit_use_case.dart' as _i69;
import '../features/debit/domain/use_case/update_debit_use.case.dart' as _i92;
import '../features/debit/presentation/cubit/debts_bloc.dart' as _i98;
import '../features/debit_transaction/data/data_source/debit_transactions_data_store.dart'
    as _i13;
import '../features/debit_transaction/data/model/debit_transactions_model.dart'
    as _i9;
import '../features/debit_transaction/data/repository/debit_transaction_repo_impl.dart'
    as _i15;
import '../features/debit_transaction/domain/repository/debit_transaction_repository.dart'
    as _i14;
import '../features/debit_transaction/domain/use_case/add_debit_transaction_use_case.dart'
    as _i48;
import '../features/debit_transaction/domain/use_case/delete_debit_transaction_use_case.dart'
    as _i16;
import '../features/debit_transaction/domain/use_case/delete_debit_transactions_by_debit_id_use_case.dart'
    as _i17;
import '../features/debit_transaction/domain/use_case/get_debit_transactions_use_case.dart'
    as _i20;
import '../features/home/presentation/bloc/home/home_bloc.dart' as _i75;
import '../features/home/presentation/controller/summary_controller.dart'
    as _i38;
import '../features/home/presentation/cubit/overview/overview_cubit.dart'
    as _i83;
import '../features/home/presentation/cubit/summary/cubit/summary_cubit.dart'
    as _i40;
import '../features/intro/data/repository/country_repository_impl.dart' as _i12;
import '../features/intro/domain/repository/country_repository.dart' as _i11;
import '../features/intro/domain/use_case/get_contries_user_case.dart' as _i19;
import '../features/intro/domain/use_case/get_selected_country_use_case.dart'
    as _i21;
import '../features/intro/domain/use_case/save_selected_country_use_case.dart'
    as _i34;
import '../features/intro/presentation/cubit/country_picker_cubit.dart' as _i53;
import '../features/profile/data/repository/profile_repository_impl.dart'
    as _i31;
import '../features/profile/domain/repository/profile_repository.dart' as _i30;
import '../features/profile/domain/use_case/image_picker_use_case.dart' as _i79;
import '../features/profile/domain/use_case/profile_use_case.dart' as _i85;
import '../features/profile/presentation/cubit/profile_cubit.dart' as _i84;
import '../features/recurring/data/data_sources/local_recurring_data_manager.dart'
    as _i26;
import '../features/recurring/data/data_sources/local_recurring_data_manager_impl.dart'
    as _i27;
import '../features/recurring/data/model/recurring.dart' as _i10;
import '../features/recurring/data/repository/recurring_repository_impl.dart'
    as _i33;
import '../features/recurring/domain/repository/recurring_repository.dart'
    as _i32;
import '../features/recurring/domain/use_case/add_recurring_use_case.dart'
    as _i49;
import '../features/recurring/domain/use_case/recurring_use_case.dart' as _i87;
import '../features/recurring/presentation/cubit/recurring_cubit.dart' as _i86;
import '../features/search/domain/use_case/filter_expense_use_case.dart'
    as _i88;
import '../features/search/presentation/cubit/search_cubit.dart' as _i100;
import '../features/settings/data/authenticate.dart' as _i3;
import '../features/settings/data/file_handler.dart' as _i65;
import '../features/settings/data/repository/csv_export_impl.dart' as _i64;
import '../features/settings/data/repository/json_export_import_impl.dart'
    as _i63;
import '../features/settings/data/repository/settings_repository_impl.dart'
    as _i36;
import '../features/settings/domain/repository/import_export.dart' as _i62;
import '../features/settings/domain/repository/settings_repository.dart'
    as _i35;
import '../features/settings/domain/use_case/csv_file_export_use_case.dart'
    as _i96;
import '../features/settings/domain/use_case/json_file_export_use_case.dart'
    as _i81;
import '../features/settings/domain/use_case/json_file_import_use_case.dart'
    as _i82;
import '../features/settings/domain/use_case/setting_use_case.dart' as _i39;
import '../features/settings/domain/use_case/settings_use_case.dart' as _i37;
import '../features/settings/presentation/cubit/settings_cubit.dart' as _i101;
import '../features/transaction/data/data_sources/local/transaction_data_manager.dart'
    as _i28;
import '../features/transaction/data/model/transaction_model.dart' as _i5;
import '../features/transaction/data/repository/transaction_repository_impl.dart'
    as _i42;
import '../features/transaction/domain/repository/transaction_repository.dart'
    as _i41;
import '../features/transaction/domain/use_case/add_transaction_use_case.dart'
    as _i50;
import '../features/transaction/domain/use_case/delete_transaction_from_category_id_use_case.dart'
    as _i61;
import '../features/transaction/domain/use_case/delete_transaction_use_case.dart'
    as _i59;
import '../features/transaction/domain/use_case/delete_transactions_by_account_id_use_case.dart'
    as _i60;
import '../features/transaction/domain/use_case/get_transaction_use_case.dart'
    as _i71;
import '../features/transaction/domain/use_case/get_transactions_by_account_id_use_case.dart'
    as _i72;
import '../features/transaction/domain/use_case/get_transactions_by_category_id_use_case.dart'
    as _i73;
import '../features/transaction/domain/use_case/get_transactions_use_case.dart'
    as _i74;
import '../features/transaction/domain/use_case/transaction_use_case.dart'
    as _i76;
import '../features/transaction/domain/use_case/update_expense_use_case.dart'
    as _i43;
import '../features/transaction/presentation/bloc/transaction_bloc.dart'
    as _i89;
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
  gh.singleton<_i3.Authenticate>(_i3.Authenticate());
  await gh.singletonAsync<_i4.Box<_i5.TransactionModel>>(
    () => hiveBoxModule.expenseBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i4.Box<_i6.AccountModel>>(
    () => hiveBoxModule.accountBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i4.Box<_i7.CategoryModel>>(
    () => hiveBoxModule.categoryBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i4.Box<_i8.DebitModel>>(
    () => hiveBoxModule.debtsBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i4.Box<_i9.DebitTransactionsModel>>(
    () => hiveBoxModule.transactionsBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i4.Box<_i10.RecurringModel>>(
    () => hiveBoxModule.recurringBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i4.Box<dynamic>>(
    () => hiveBoxModule.boxDynamic,
    instanceName: 'settings',
    preResolve: true,
  );
  gh.singleton<_i11.CountryRepository>(_i12.CountryRepositoryImpl(
      gh<_i4.Box<dynamic>>(instanceName: 'settings')));
  gh.singleton<_i13.DebitTransactionDataStore>(
      _i13.DebitTransactionDataStoreImpl(
          transactionsBox: gh<_i4.Box<_i9.DebitTransactionsModel>>()));
  gh.singleton<_i14.DebitTransactionRepository>(_i15.DebitTransactionRepoImpl(
      dataStore: gh<_i13.DebitTransactionDataStore>()));
  gh.singleton<_i16.DeleteDebitTransactionUseCase>(
      _i16.DeleteDebitTransactionUseCase(
          debtRepository: gh<_i14.DebitTransactionRepository>()));
  gh.singleton<_i17.DeleteDebitTransactionsByDebitIdUseCase>(
      _i17.DeleteDebitTransactionsByDebitIdUseCase(
          debtRepository: gh<_i14.DebitTransactionRepository>()));
  gh.singleton<_i18.DeviceInfoPlugin>(
      serviceBoxModule.providesDeviceInfoPlugin());
  gh.factory<_i19.GetCountriesUseCase>(
      () => _i19.GetCountriesUseCase(repository: gh<_i11.CountryRepository>()));
  gh.singleton<_i20.GetDebitTransactionsUseCase>(
      _i20.GetDebitTransactionsUseCase(
          debtRepository: gh<_i14.DebitTransactionRepository>()));
  gh.singleton<_i21.GetSelectedCountryUseCase>(
      _i21.GetSelectedCountryUseCase(repository: gh<_i11.CountryRepository>()));
  gh.singleton<_i22.ImagePicker>(serviceBoxModule.providesImagePicker());
  gh.singleton<_i23.InAppReview>(serviceBoxModule.providesInAppReview());
  gh.singleton<_i24.LocalCategoryManager>(
      _i24.LocalCategoryManagerDataSourceImpl(
          gh<_i4.Box<_i7.CategoryModel>>()));
  gh.singleton<_i25.LocalDebitDataSource>(
      _i25.LocalDebitDataSourceImpl(debtBox: gh<_i4.Box<_i8.DebitModel>>()));
  gh.factory<_i26.LocalRecurringDataManager>(() =>
      _i27.LocalRecurringDataManagerImpl(gh<_i4.Box<_i10.RecurringModel>>()));
  gh.factory<_i28.LocalTransactionManager>(() =>
      _i28.LocalTransactionManagerImpl(gh<_i29.Box<_i5.TransactionModel>>()));
  gh.singleton<_i30.ProfileRepository>(_i31.ProfileRepositoryImpl(
    gh<_i22.ImagePicker>(),
    gh<_i4.Box<dynamic>>(instanceName: 'settings'),
  ));
  gh.singleton<_i32.RecurringRepository>(_i33.RecurringRepositoryImpl(
    gh<_i26.LocalRecurringDataManager>(),
    gh<_i28.LocalTransactionManager>(),
  ));
  gh.singleton<_i34.SaveSelectedCountryUseCase>(_i34.SaveSelectedCountryUseCase(
      repository: gh<_i11.CountryRepository>()));
  gh.factory<_i35.SettingsRepository>(() => _i36.SettingsRepositoryImpl(
      gh<_i4.Box<dynamic>>(instanceName: 'settings')));
  gh.singleton<_i37.SettingsUseCase>(
      _i37.SettingsUseCase(gh<_i35.SettingsRepository>()));
  gh.singleton<_i38.SummaryController>(
      _i38.SummaryController(gh<_i39.SettingsUseCase>()));
  gh.factory<_i40.SummaryCubit>(() => _i40.SummaryCubit());
  gh.singleton<_i41.TransactionRepository>(_i42.ExpenseRepositoryImpl(
      dataSource: gh<_i28.LocalTransactionManager>()));
  gh.singleton<_i43.UpdateTransactionUseCase>(_i43.UpdateTransactionUseCase(
      expenseRepository: gh<_i41.TransactionRepository>()));
  gh.singleton<_i44.AccountManager>(
      _i44.AccountManagerImpl(accountBox: gh<_i4.Box<_i6.AccountModel>>()));
  gh.singleton<_i45.AccountRepository>(
      _i46.AccountRepositoryImpl(dataSource: gh<_i44.AccountManager>()));
  gh.singleton<_i47.AddAccountUseCase>(
      _i47.AddAccountUseCase(accountRepository: gh<_i45.AccountRepository>()));
  gh.singleton<_i48.AddDebitTransactionUseCase>(_i48.AddDebitTransactionUseCase(
      debtRepository: gh<_i14.DebitTransactionRepository>()));
  gh.singleton<_i49.AddRecurringUseCase>(
      _i49.AddRecurringUseCase(gh<_i32.RecurringRepository>()));
  gh.singleton<_i50.AddTransactionUseCase>(_i50.AddTransactionUseCase(
      expenseRepository: gh<_i41.TransactionRepository>()));
  gh.singleton<_i51.CategoryRepository>(_i52.CategoryRepositoryImpl(
    dataSources: gh<_i24.LocalCategoryManager>(),
    expenseDataManager: gh<_i28.LocalTransactionManager>(),
  ));
  gh.factory<_i53.CountryPickerCubit>(() => _i53.CountryPickerCubit(
        gh<_i19.GetCountriesUseCase>(),
        gh<_i21.GetSelectedCountryUseCase>(),
        gh<_i34.SaveSelectedCountryUseCase>(),
      ));
  gh.singleton<_i54.DebitRepository>(
      _i55.DebtRepositoryImpl(dataSource: gh<_i25.LocalDebitDataSource>()));
  gh.singleton<_i56.DeleteAccountUseCase>(_i56.DeleteAccountUseCase(
      accountRepository: gh<_i45.AccountRepository>()));
  gh.singleton<_i57.DeleteCategoryUseCase>(_i57.DeleteCategoryUseCase(
      categoryRepository: gh<_i51.CategoryRepository>()));
  gh.singleton<_i58.DeleteDebitUseCase>(
      _i58.DeleteDebitUseCase(debtRepository: gh<_i54.DebitRepository>()));
  gh.singleton<_i59.DeleteTransactionUseCase>(_i59.DeleteTransactionUseCase(
      expenseRepository: gh<_i41.TransactionRepository>()));
  gh.singleton<_i60.DeleteTransactionsByAccountIdUseCase>(
      _i60.DeleteTransactionsByAccountIdUseCase(
          expenseRepository: gh<_i41.TransactionRepository>()));
  gh.singleton<_i61.DeleteTransactionsByCategoryIdUseCase>(
      _i61.DeleteTransactionsByCategoryIdUseCase(
          transactionRepository: gh<_i41.TransactionRepository>()));
  gh.lazySingleton<_i62.Export>(
    () => _i63.JSONExportImpl(
      gh<_i44.AccountManager>(),
      gh<_i24.LocalCategoryManager>(),
      gh<_i28.LocalTransactionManager>(),
    ),
    instanceName: 'json_export',
  );
  gh.lazySingleton<_i62.Export>(
    () => _i64.CSVExport(
      gh<_i18.DeviceInfoPlugin>(),
      gh<_i44.AccountManager>(),
      gh<_i24.LocalCategoryManager>(),
      gh<_i28.LocalTransactionManager>(),
    ),
    instanceName: 'csv',
  );
  gh.singleton<_i65.FileHandler>(_i65.FileHandler(
    gh<_i18.DeviceInfoPlugin>(),
    gh<_i44.AccountManager>(),
    gh<_i24.LocalCategoryManager>(),
    gh<_i28.LocalTransactionManager>(),
  ));
  gh.singleton<_i66.GetAccountUseCase>(
      _i66.GetAccountUseCase(accountRepository: gh<_i45.AccountRepository>()));
  gh.singleton<_i67.GetAccountsUseCase>(
      _i67.GetAccountsUseCase(accountRepository: gh<_i45.AccountRepository>()));
  gh.singleton<_i68.GetCategoryUseCase>(_i68.GetCategoryUseCase(
      categoryRepository: gh<_i51.CategoryRepository>()));
  gh.singleton<_i69.GetDebitUseCase>(
      _i69.GetDebitUseCase(debtRepository: gh<_i54.DebitRepository>()));
  gh.singleton<_i70.GetDefaultCategoriesUseCase>(
      _i70.GetDefaultCategoriesUseCase(
          categoryRepository: gh<_i51.CategoryRepository>()));
  gh.singleton<_i71.GetTransactionUseCase>(_i71.GetTransactionUseCase(
      transactionRepository: gh<_i41.TransactionRepository>()));
  gh.singleton<_i72.GetTransactionsByAccountIdUseCase>(
      _i72.GetTransactionsByAccountIdUseCase(
          expenseRepository: gh<_i41.TransactionRepository>()));
  gh.singleton<_i73.GetTransactionsByCategoryIdUseCase>(
      _i73.GetTransactionsByCategoryIdUseCase(
          expenseRepository: gh<_i41.TransactionRepository>()));
  gh.singleton<_i74.GetTransactionsUseCase>(_i74.GetTransactionsUseCase(
      expenseRepository: gh<_i41.TransactionRepository>()));
  gh.factory<_i75.HomeBloc>(() => _i75.HomeBloc(
        gh<_i76.GetTransactionsUseCase>(),
        gh<_i77.GetDefaultCategoriesUseCase>(),
        gh<_i78.GetAccountUseCase>(),
        gh<_i77.GetCategoryUseCase>(),
        gh<_i76.GetTransactionsByCategoryIdUseCase>(),
      ));
  gh.singleton<_i79.ImagePickerUseCase>(
      _i79.ImagePickerUseCase(gh<_i30.ProfileRepository>()));
  gh.lazySingleton<_i62.Import>(
    () => _i63.JSONImportImpl(
      gh<_i18.DeviceInfoPlugin>(),
      gh<_i44.AccountManager>(),
      gh<_i24.LocalCategoryManager>(),
      gh<_i28.LocalTransactionManager>(),
    ),
    instanceName: 'json_import',
  );
  gh.singleton<_i80.InApp>(_i80.InApp(gh<_i23.InAppReview>()));
  gh.singleton<_i81.JSONFileExportUseCase>(_i81.JSONFileExportUseCase(
    gh<_i35.SettingsRepository>(),
    gh<_i62.Export>(instanceName: 'json_export'),
  ));
  gh.singleton<_i82.JSONFileImportUseCase>(_i82.JSONFileImportUseCase(
    gh<_i35.SettingsRepository>(),
    gh<_i62.Import>(instanceName: 'json_import'),
  ));
  gh.factory<_i83.OverviewCubit>(() => _i83.OverviewCubit(
        gh<_i76.GetTransactionsUseCase>(),
        gh<_i77.GetCategoryUseCase>(),
        gh<_i77.GetDefaultCategoriesUseCase>(),
      ));
  gh.factory<_i84.ProfileCubit>(() => _i84.ProfileCubit(
        gh<_i85.ImagePickerUseCase>(),
        gh<_i4.Box<dynamic>>(instanceName: 'settings'),
      ));
  gh.factory<_i86.RecurringCubit>(
      () => _i86.RecurringCubit(gh<_i87.AddRecurringUseCase>()));
  gh.singleton<_i88.SearchUseCase>(
      _i88.SearchUseCase(gh<_i41.TransactionRepository>()));
  gh.factory<_i89.TransactionBloc>(() => _i89.TransactionBloc(
        gh<_i37.SettingsUseCase>(),
        getTransactionUseCase: gh<_i76.GetTransactionUseCase>(),
        accountUseCase: gh<_i78.GetAccountUseCase>(),
        addTransactionUseCase: gh<_i76.AddTransactionUseCase>(),
        deleteTransactionUseCase: gh<_i76.DeleteTransactionUseCase>(),
        updateTransactionUseCase: gh<_i76.UpdateTransactionUseCase>(),
        accountsUseCase: gh<_i78.GetAccountsUseCase>(),
        getDefaultCategoriesUseCase: gh<_i77.GetDefaultCategoriesUseCase>(),
      ));
  gh.singleton<_i90.UpdateAccountUseCase>(_i90.UpdateAccountUseCase(
      accountRepository: gh<_i45.AccountRepository>()));
  gh.singleton<_i91.UpdateCategoryUseCase>(_i91.UpdateCategoryUseCase(
      categoryRepository: gh<_i51.CategoryRepository>()));
  gh.singleton<_i92.UpdateDebitUseCase>(
      _i92.UpdateDebitUseCase(debtRepository: gh<_i54.DebitRepository>()));
  gh.factory<_i93.AccountBloc>(() => _i93.AccountBloc(
        getAccountUseCase: gh<_i78.GetAccountUseCase>(),
        deleteAccountUseCase: gh<_i78.DeleteAccountUseCase>(),
        getTransactionsByAccountIdUseCase:
            gh<_i76.GetTransactionsByAccountIdUseCase>(),
        addAccountUseCase: gh<_i78.AddAccountUseCase>(),
        getCategoryUseCase: gh<_i68.GetCategoryUseCase>(),
        deleteExpensesFromAccountIdUseCase:
            gh<_i76.DeleteTransactionsByAccountIdUseCase>(),
        updateAccountUseCase: gh<_i78.UpdateAccountUseCase>(),
      ));
  gh.singleton<_i94.AddCategoryUseCase>(_i94.AddCategoryUseCase(
      categoryRepository: gh<_i51.CategoryRepository>()));
  gh.singleton<_i95.AddDebitUseCase>(
      _i95.AddDebitUseCase(debtRepository: gh<_i54.DebitRepository>()));
  gh.singleton<_i96.CSVFileExportUseCase>(_i96.CSVFileExportUseCase(
    gh<_i35.SettingsRepository>(),
    gh<_i62.Export>(instanceName: 'csv'),
  ));
  gh.factory<_i97.CategoryBloc>(() => _i97.CategoryBloc(
        getCategoryUseCase: gh<_i77.GetCategoryUseCase>(),
        addCategoryUseCase: gh<_i77.AddCategoryUseCase>(),
        deleteCategoryUseCase: gh<_i77.DeleteCategoryUseCase>(),
        deleteExpensesFromCategoryIdUseCase:
            gh<_i76.DeleteTransactionsByCategoryIdUseCase>(),
        updateCategoryUseCase: gh<_i77.UpdateCategoryUseCase>(),
      ));
  gh.factory<_i98.DebitBloc>(() => _i98.DebitBloc(
        addDebtUseCase: gh<_i99.AddDebitUseCase>(),
        getDebtUseCase: gh<_i99.GetDebitUseCase>(),
        getTransactionsUseCase: gh<_i20.GetDebitTransactionsUseCase>(),
        addTransactionUseCase: gh<_i48.AddDebitTransactionUseCase>(),
        updateDebtUseCase: gh<_i99.UpdateDebitUseCase>(),
        deleteDebtUseCase: gh<_i99.DeleteDebitUseCase>(),
        deleteDebitTransactionUseCase: gh<_i16.DeleteDebitTransactionUseCase>(),
        deleteDebitTransactionsByDebitIdUseCase:
            gh<_i17.DeleteDebitTransactionsByDebitIdUseCase>(),
      ));
  gh.factory<_i100.SearchCubit>(
      () => _i100.SearchCubit(gh<_i88.SearchUseCase>()));
  gh.factory<_i101.SettingCubit>(() => _i101.SettingCubit(
        gh<_i76.GetTransactionsUseCase>(),
        gh<_i77.GetDefaultCategoriesUseCase>(),
        gh<_i76.UpdateTransactionUseCase>(),
        gh<_i39.JSONFileImportUseCase>(),
        gh<_i39.JSONFileExportUseCase>(),
        gh<_i39.SettingsUseCase>(),
        gh<_i39.CSVFileExportUseCase>(),
      ));
  return getIt;
}

class _$HiveBoxModule extends _i102.HiveBoxModule {}

class _$ServiceBoxModule extends _i103.ServiceBoxModule {}
