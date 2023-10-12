part of 'qr_code_bloc.dart';

@immutable
abstract class QrCodeEvent extends Equatable {}

class GetDataExportEvent extends QrCodeEvent {
  @override
  List<Object?> get props => [];
}