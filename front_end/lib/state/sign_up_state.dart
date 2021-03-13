import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class SignUpInitial extends SignUpState {

}

class SignUpStateEmailExisted extends SignUpState {
  final String message;

  SignUpStateEmailExisted({this.message});
}

class SignUpSateUserNameExited extends SignUpState {

  final String message;

  SignUpSateUserNameExited({this.message});

}



