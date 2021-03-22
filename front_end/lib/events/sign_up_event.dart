import 'package:equatable/equatable.dart';

class SignUpEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class CompleteStepOneEvent extends SignUpEvent {
  final String email;
  final String username;
  final String password;

  CompleteStepOneEvent({this.email, this.username, this.password});
}

class CompleteStepSecondEvent extends SignUpEvent {

}

