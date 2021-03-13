import 'package:ecommerce/events/sign_up_event.dart';
import 'package:ecommerce/state/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/service/user_service.dart';
class SignUpBloc extends Bloc<SignUpEvent,SignUpState> {

  SignUpBloc(SignUpState initialState) : super(initialState);

  UserService userService = UserService();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is CheckEmailExistedEvent) {
        bool isExisted = userService.isEmailExisted(email: event.email) as bool;
        String message = "";
        if (isExisted){
          message = "Email is existed";
          yield SignUpStateEmailExisted(message : message);
        }
    }
  }
}