part of 'convert_bloc.dart';

@immutable
abstract class ConvertEvent extends Equatable{}

class GetConvertEvent extends ConvertEvent{
  @override
  List<Object?> get props => [];
}
