import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kho_hang/data/datasourch/convert_respository.dart';
import 'package:meta/meta.dart';

import '../../../../data/enums/enums.dart';
import '../../../../data/model/convert_model.dart';

part 'convert_event.dart';
part 'convert_state.dart';

class ConvertBloc extends Bloc<ConvertEvent, ConvertState> {
  ConvertBloc() : super(const ConvertState()) {
    on<GetConvertEvent>(_getConvertData);
  }

  Future<void> _getConvertData(
     GetConvertEvent event, Emitter<ConvertState> emit) async {
    try {
      emit(
        state.copyWith(status: RequestStatus.loading),
      );
      ConvertModel result = await getConvertItem();
      emit(state.copyWith(status: RequestStatus.loaded, convertData: result));
    } catch (e) {
      emit(
        state.copyWith(
            status: RequestStatus.error, message: "Lỗi phát sinh $e"),
      );
    }
  }

}
