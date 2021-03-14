import 'package:equatable/equatable.dart';

class SignUpEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class CheckUsernameExistedEvent extends SignUpEvent {
    final String username;

    CheckUsernameExistedEvent({this.username});
}

class CheckEmailExistedEvent extends SignUpEvent {
  final String email;
  CheckEmailExistedEvent({this.email});
}
