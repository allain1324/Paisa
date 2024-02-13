// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:paisa/core/use_case/use_case.dart';
import 'package:paisa/features/debit_transaction/domain/repository/debit_transaction_repository.dart';

part 'delete_debit_transactions_by_debit_id_use_case.freezed.dart';

@singleton
class DeleteDebitTransactionsByDebitIdUseCase
    implements UseCase<void, DeleteDebitTransactionsDebitIdParams> {
  DeleteDebitTransactionsByDebitIdUseCase({required this.debtRepository});

  final DebitTransactionRepository debtRepository;

  @override
  Future<void> call(DeleteDebitTransactionsDebitIdParams params) {
    return debtRepository.deleteDebitTransactionsFromDebitId(
      params.debitTransactionId,
    );
  }
}

@freezed
class DeleteDebitTransactionsDebitIdParams
    with _$DeleteDebitTransactionsDebitIdParams {
  const factory DeleteDebitTransactionsDebitIdParams(int debitTransactionId) =
      _DeleteDebitTransactionsDebitIdParams;
}
