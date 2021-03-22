import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {

  @override
  // TODO: implement props
  List<Object> get props => [];

}

class SignUpInitial extends SignUpState {

}

class SignUpStateCheckExisted extends SignUpState {

  final String message;

  SignUpStateCheckExisted({this.message});
}

class SignUpStepOneStateSuccess extends SignUpState {

}

class SignUpLoading extends SignUpState {

}



