part of 'export_bloc.dart';

class ExportState  extends Equatable {
  final ExportModel? exportData;
  final RequestStatus status;
  final String message;

  const ExportState({
    this.exportData,
    this.status = RequestStatus.loading,
    this.message = "",
   });

  ExportState copyWith({
    ExportModel? exportData,
    RequestStatus? status,
    String? message,
    }){
    return ExportState(
      exportData: exportData ?? this.exportData,
      status: status ?? this.status,
      message: message ?? this.message,
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [exportData, status , message];
}
