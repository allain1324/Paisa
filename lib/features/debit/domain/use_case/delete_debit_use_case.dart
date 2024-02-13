// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:paisa/core/use_case/use_case.dart';
import 'package:paisa/features/debit/domain/repository/debit_repository.dart';

part 'delete_debit_use_case.freezed.dart';

@singleton
class DeleteDebitUseCase implements UseCase<void, DeleteDebitParams> {
  DeleteDebitUseCase({required this.debtRepository});

  final DebitRepository debtRepository;

  @override
  Future<void> call(DeleteDebitParams params) {
    return debtRepository.deleteDebtOrCreditFromId(params.debitId);
  }
}

@freezed
class DeleteDebitParams with _$DeleteDebitParams {
  const factory DeleteDebitParams(int debitId) = _DeleteDebitParams;
}
