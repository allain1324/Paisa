import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:paisa/core/use_case/use_case.dart';
import 'package:paisa/features/debit_transaction/domain/entities/debit_transaction_entity.dart';
import 'package:paisa/features/debit_transaction/domain/repository/debit_transaction_repository.dart';
part 'get_debit_transactions_use_case.freezed.dart';

@singleton
class GetDebitTransactionsUseCase
    implements
        UseCase<List<DebitTransactionEntity>, GetDebitTransactionsParams> {
  GetDebitTransactionsUseCase({required this.debtRepository});

  final DebitTransactionRepository debtRepository;

  @override
  List<DebitTransactionEntity> call(GetDebitTransactionsParams param) {
    return debtRepository.fetchTransactionsFromId(param.debitId);
  }
}

@freezed
class GetDebitTransactionsParams with _$GetDebitTransactionsParams {
  const factory GetDebitTransactionsParams(int debitId) =
      _GetDebitTransactionsParams;
}
