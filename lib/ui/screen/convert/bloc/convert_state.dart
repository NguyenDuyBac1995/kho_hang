part of 'convert_bloc.dart';

class ConvertState  extends Equatable {
  final ConvertModel? convertData;
  final RequestStatus status;
  final String message;

  const ConvertState({
    this.convertData,
    this.status = RequestStatus.loading,
    this.message = "",
  });

  ConvertState copyWith({
    ConvertModel? convertData,
    RequestStatus? status,
    String? message,
  }){
    return ConvertState(
      convertData: convertData ?? this.convertData,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [convertData, status , message];
}
