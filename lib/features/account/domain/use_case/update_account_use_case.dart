// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/core/use_case/use_case.dart';
import 'package:paisa/features/account/domain/repository/account_repository.dart';

part 'update_account_use_case.freezed.dart';

@lazySingleton
class UpdateAccountUseCase implements UseCase<void, UpdateAccountParams> {
  UpdateAccountUseCase({required this.accountRepository});

  final AccountRepository accountRepository;

  @override
  Future<void> call(UpdateAccountParams params) {
    return accountRepository.update(
      bankName: params.bankName,
      holderName: params.holderName,
      cardType: params.cardType,
      amount: params.amount,
      key: params.key,
      color: params.color,
    );
  }
}

@freezed
class UpdateAccountParams with _$UpdateAccountParams {
  const factory UpdateAccountParams({
    required double amount,
    required String bankName,
    @Default(CardType.cash) CardType cardType,
    required int color,
    required String holderName,
    required int key,
  }) = _UpdateAccountParams;
}
