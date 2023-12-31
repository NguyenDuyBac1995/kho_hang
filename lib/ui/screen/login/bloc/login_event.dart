part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginChanged extends LoginEvent{
  const LoginChanged({this.username,this.password});
  final String? username;
  final String? password;
  @override
  List<Object?> get props => [username, password];
}


class TogglePasswordStatusChanged extends LoginEvent{
  const TogglePasswordStatusChanged();
}

