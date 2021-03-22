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

  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String address;

  CompleteStepSecondEvent(
      {this.firstName, this.lastName, this.phoneNumber, this.address});
}

class SubmitOtpEvent extends SignUpEvent {

  final String otp;

  SubmitOtpEvent({this.otp});
}
