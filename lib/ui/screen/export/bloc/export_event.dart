part of 'export_bloc.dart';

@immutable
abstract class ExportEvent extends Equatable {
  const ExportEvent();
  @override
  List<Object?> get props => [];
}

class GetExportEvent  extends ExportEvent{}