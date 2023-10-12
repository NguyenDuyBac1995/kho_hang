import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kho_hang/data/datasourch/export_respository.dart';
import 'package:kho_hang/data/enums/enums.dart';
import 'package:kho_hang/data/model/export_model.dart';
import 'package:meta/meta.dart';

part 'export_event.dart';

part 'export_state.dart';

class ExportBloc extends Bloc<ExportEvent, ExportState> {
  ExportBloc() : super(const ExportState()) {
    on<GetExportEvent>(_getExportData);
  }

  Future<void> _getExportData(
      GetExportEvent event, Emitter<ExportState> emit) async {
    try {
      emit(
        state.copyWith(status: RequestStatus.loading),
      );
      ExportModel result = await getExportItem();
      emit(state.copyWith(status: RequestStatus.loaded, exportData: result));
    } catch (e) {
      emit(
        state.copyWith(
            status: RequestStatus.error, message: "Lỗi phát sinh $e"),
      );
    }
  }
}
