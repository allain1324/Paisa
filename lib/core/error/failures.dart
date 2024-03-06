// Package imports:
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class FileNotFoundFailure extends Failure {}

class ErrorFileExportFailure extends Failure {}

class ErrorImagePickFailure extends Failure {}

String mapFailureToMessage(Failure failure) {
  if (failure is FileNotFoundFailure) {
    return 'File not found';
  } else if (failure is ErrorFileExportFailure) {
    return 'Error file export';
  }
  return 'Unexpected error';
}

class FailedToAddTransactionFailure extends Failure {}
