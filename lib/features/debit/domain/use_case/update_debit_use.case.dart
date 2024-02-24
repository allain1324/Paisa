// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/core/use_case/use_case.dart';
import 'package:paisa/features/debit/domain/repository/debit_repository.dart';

part 'update_debit_use.case.freezed.dart';

@singleton
class UpdateDebitUseCase implements UseCase<void, UpdateDebitParams> {
  UpdateDebitUseCase({required this.debtRepository});

  final DebitRepository debtRepository;
  @override
  Future<void> call(UpdateDebitParams params) {
    return debtRepository.updateDebt(
      description: params.description,
      name: params.name,
      amount: params.amount,
      currentDateTime: params.currentDateTime,
      dueDateTime: params.dueDateTime,
      debtType: params.debtType,
      key: params.key,
    );
  }
}

@freezed
class UpdateDebitParams with _$UpdateDebitParams {
  const factory UpdateDebitParams({
    required String description,
    required String name,
    required double amount,
    required DateTime currentDateTime,
    required DateTime dueDateTime,
    required DebitType debtType,
    required int key,
  }) = _UpdateDebitParams;
}
