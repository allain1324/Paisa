// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paisa/config/routes.dart';
import 'package:paisa/core/error/account_error.dart';
import 'package:responsive_builder/responsive_builder.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/account/presentation/bloc/accounts_bloc.dart';
import 'package:paisa/features/account/presentation/widgets/card_type_drop_down.dart';
import 'package:paisa/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:paisa/main.dart';

final GlobalKey<FormState> _form = GlobalKey<FormState>();

class AccountPage extends StatefulWidget {
  const AccountPage({
    super.key,
    this.accountId,
  });

  final int? accountId;

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  final TextEditingController accountHolderController = TextEditingController();
  final TextEditingController accountInitialAmountController =
      TextEditingController();

  final TextEditingController accountNameController = TextEditingController();
  final AccountBloc accountsBloc = getIt<AccountBloc>();
  late final bool isAccountAddOrUpdate = widget.accountId == null;

  @override
  void dispose() {
    accountHolderController.dispose();
    accountInitialAmountController.dispose();
    accountNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.accountId != null) {
      accountsBloc.add(FetchAccountFromIdEvent(widget.accountId!));
    }
  }

  void _showInfo() => showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        context: context,
        builder: (context) {
          return SafeArea(
            maintainBottomViewPadding: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.info_rounded),
                  title: Text(
                    context.loc.accountInformationTitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(context.loc.accountInformationSubTitle),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      child: Text(context.loc.ok),
                    ),
                  ),
                ),
                const SizedBox(height: 10)
              ],
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return PaisaAnnotatedRegionWidget(
      color: context.background,
      child: BlocProvider(
        create: (context) => accountsBloc,
        child: BlocConsumer<AccountBloc, AccountState>(
          listener: (context, state) {
            if (state is AccountAddedState) {
              context.showMaterialSnackBar(
                isAccountAddOrUpdate
                    ? context.loc.addedAccount
                    : context.loc.updateAccount,
                backgroundColor: context.primaryContainer,
                color: context.onPrimaryContainer,
              );
              context.pop();
            }
            if (state is AccountDeletedState) {
              context.showMaterialSnackBar(
                context.loc.deleteAccount,
                backgroundColor: context.error,
                color: context.onError,
              );
              context.pop();
            } else if (state is AccountErrorState) {
              context.showMaterialSnackBar(
                state.accountErrors.errorString(context),
                backgroundColor: context.errorContainer,
                color: context.onErrorContainer,
              );
            } else if (state is AccountSuccessState) {
              accountNameController.text = state.account.bankName;
              accountNameController.selection = TextSelection.collapsed(
                  offset: state.account.bankName.length);

              accountHolderController.text = state.account.name;
              accountHolderController.selection =
                  TextSelection.collapsed(offset: state.account.name.length);

              accountInitialAmountController.text =
                  state.account.amount.toString();
              accountInitialAmountController.selection =
                  TextSelection.collapsed(
                      offset: state.account.amount.toString().length);
            }
          },
          builder: (context, state) {
            return ScreenTypeLayout.builder(
              mobile: (p0) => Scaffold(
                appBar: context.materialYouAppBar(
                  isAccountAddOrUpdate
                      ? context.loc.addAccount
                      : context.loc.updateAccount,
                  actions: [
                    DeleteAccountWidget(accountId: widget.accountId),
                    IconButton(
                      onPressed: _showInfo,
                      icon: const Icon(Icons.info_rounded),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: CardTypeButtons(),
                      ),
                      Form(
                        key: _form,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 16),
                              AccountCardHolderNameWidget(
                                controller: accountHolderController,
                              ),
                              const SizedBox(height: 16),
                              AccountNameWidget(
                                controller: accountNameController,
                              ),
                              const SizedBox(height: 16),
                              AccountInitialAmountWidget(
                                controller: accountInitialAmountController,
                              ),
                              const SizedBox(height: 16),
                              const AccountColorPickerWidget(),
                              AccountDefaultSwitchWidget(
                                accountId: widget.accountId ?? -1,
                              ),
                              AccountExcludedSwitchWidget(
                                accountId: widget.accountId ?? -1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: PaisaButton.largeElevated(
                      onPressed: () {
                        final isValid = _form.currentState!.validate();
                        if (!isValid) {
                          return;
                        }
                        context
                            .read<AccountBloc>()
                            .add(AddOrUpdateAccountEvent(isAccountAddOrUpdate));
                      },
                      text: isAccountAddOrUpdate
                          ? context.loc.add
                          : context.loc.update,
                    ),
                  ),
                ),
              ),
              tablet: (p0) => Scaffold(
                appBar: context.materialYouAppBar(
                  isAccountAddOrUpdate
                      ? context.loc.addAccount
                      : context.loc.updateAccount,
                  actions: [
                    IconButton(
                      onPressed: _showInfo,
                      icon: const Icon(Icons.info_rounded),
                    ),
                    DeleteAccountWidget(accountId: widget.accountId),
                    PaisaButton.mediumElevated(
                      onPressed: () {
                        final isValid = _form.currentState!.validate();
                        if (!isValid) {
                          return;
                        }
                        context
                            .read<AccountBloc>()
                            .add(AddOrUpdateAccountEvent(isAccountAddOrUpdate));
                      },
                      text: isAccountAddOrUpdate
                          ? context.loc.add
                          : context.loc.update,
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Form(
                          key: _form,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const CardTypeButtons(),
                                const SizedBox(height: 16),
                                AccountCardHolderNameWidget(
                                  controller: accountHolderController,
                                ),
                                const SizedBox(height: 16),
                                AccountNameWidget(
                                  controller: accountNameController,
                                ),
                                const SizedBox(height: 16),
                                AccountInitialAmountWidget(
                                  controller: accountInitialAmountController,
                                ),
                                const SizedBox(height: 16),
                                AccountDefaultSwitchWidget(
                                  accountId: widget.accountId ?? -1,
                                ),
                                const AccountColorPickerWidget()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AccountColorPickerWidget extends StatelessWidget {
  const AccountColorPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: () async {
            final color = await paisaColorPicker(
              context,
              defaultColor:
                  context.read<AccountBloc>().selectedColor ?? Colors.red.value,
            );
            if (context.mounted) {
              context.read<AccountBloc>().add(AccountColorSelectedEvent(color));
            }
          },
          leading: Icon(
            Icons.color_lens,
            color: context.primary,
          ),
          title: Text(context.loc.pickColor),
          subtitle: Text(context.loc.pickColorDesc),
          trailing: Container(
            margin: const EdgeInsets.only(right: 12),
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(context.read<AccountBloc>().selectedColor ??
                  Colors.red.value),
            ),
          ),
        );
      },
    );
  }
}

class DeleteAccountWidget extends StatelessWidget {
  const DeleteAccountWidget({super.key, this.accountId});

  final int? accountId;

  void onPressed(BuildContext context) {
    paisaAlertDialog(
      context,
      title: Text(context.loc.dialogDeleteTitle),
      child: RichText(
        text: TextSpan(
          text: context.loc.deleteAccount,
          style: context.bodyMedium,
          children: [
            TextSpan(
              text: context.read<AccountBloc>().accountName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      confirmationButton: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        onPressed: () {
          context.read<AccountBloc>().add(DeleteAccountEvent(accountId!));

          Navigator.pop(context);
        },
        child: Text(context.loc.delete),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (accountId == null) {
      return const SizedBox.shrink();
    }
    return ScreenTypeLayout.builder(
      mobile: (p0) => IconButton(
        onPressed: () => onPressed(context),
        icon: Icon(
          Icons.delete_rounded,
          color: context.error,
        ),
      ),
      tablet: (p0) => PaisaButton.mediumText(
        onPressed: () => onPressed(context),
        text: context.loc.delete,
      ),
    );
  }
}

class AccountCardHolderNameWidget extends StatelessWidget {
  const AccountCardHolderNameWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return PaisaTextFormField(
          controller: controller,
          hintText: context.loc.enterCardHolderName,
          keyboardType: TextInputType.name,
          inputFormatters: [
            FilteringTextInputFormatter.singleLineFormatter,
          ],
          onChanged: (value) =>
              context.read<AccountBloc>().accountHolderName = value,
        );
      },
    );
  }
}

class AccountNameWidget extends StatelessWidget {
  const AccountNameWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return PaisaTextFormField(
          controller: controller,
          hintText: context.loc.enterAccountName,
          keyboardType: TextInputType.name,
          inputFormatters: [
            FilteringTextInputFormatter.singleLineFormatter,
          ],
          onChanged: (value) => context.read<AccountBloc>().accountName = value,
        );
      },
    );
  }
}

class AccountInitialAmountWidget extends StatelessWidget {
  const AccountInitialAmountWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PaisaTextFormField(
      controller: controller,
      hintText: context.loc.enterAmount,
      maxLength: 13,
      maxLines: 1,
      counterText: '',
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true, signed: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        TextInputFormatter.withFunction((oldValue, newValue) {
          try {
            final text = newValue.text;
            if (text.isNotEmpty) double.parse(text);
            return newValue;
          } catch (_) {}
          return oldValue;
        }),
      ],
      onChanged: (value) {
        double? amount = double.tryParse(value);
        context.read<AccountBloc>().initialAmount = amount;
      },
    );
  }
}

class AccountDefaultSwitchWidget extends StatefulWidget {
  const AccountDefaultSwitchWidget({
    super.key,
    required this.accountId,
  });

  final int accountId;

  @override
  State<AccountDefaultSwitchWidget> createState() =>
      _AccountDefaultSwitchWidgetState();
}

class _AccountDefaultSwitchWidgetState
    extends State<AccountDefaultSwitchWidget> {
  late bool isAccountDefault =
      settingCubit.defaultAccountId == widget.accountId;

  late final SettingCubit settingCubit = context.read<SettingCubit>();

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      title: Text(context.loc.defaultAccount),
      value: isAccountDefault,
      onChanged: (value) {
        if (value) {
          settingCubit.setDefaultAccountId(widget.accountId);
        } else {
          settingCubit.setDefaultAccountId(-1);
        }
        setState(() {
          isAccountDefault = value;
        });
      },
    );
  }
}

class AccountExcludedSwitchWidget extends StatefulWidget {
  const AccountExcludedSwitchWidget({
    super.key,
    required this.accountId,
  });

  final int accountId;

  @override
  State<AccountExcludedSwitchWidget> createState() =>
      _AccountExcludedSwitchWidgetState();
}

class _AccountExcludedSwitchWidgetState
    extends State<AccountExcludedSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<dynamic>>(
      valueListenable: settings.listenable(),
      builder: (context, value, child) {
        final List<int> excludedAccounts = value.get(
          excludedAccountIdKey,
          defaultValue: <int>[],
        );
        return SwitchListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          title: Text(context.loc.excludeAccount),
          value: excludedAccounts.contains(widget.accountId),
          onChanged: (isEnable) {
            if (isEnable && !excludedAccounts.contains(widget.accountId)) {
              excludedAccounts.add(widget.accountId);
            } else {
              excludedAccounts.remove(widget.accountId);
            }
            value.put(excludedAccountIdKey, excludedAccounts);
          },
        );
      },
    );
  }
}
