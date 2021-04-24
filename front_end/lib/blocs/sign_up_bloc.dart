import 'package:ecommerce/events/sign_up_event.dart';
import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/service/register_service.dart';
import 'package:ecommerce/state/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/service/user_service.dart';
import 'package:intl/intl.dart';
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState());

  RegisterService registerService = RegisterService();

  UserService userService = UserService();

  User user = User();

  String otp = "";

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is CompleteStepOneEvent) {
      yield SignUpLoading();
      bool isEmailExisted =
          await registerService.isEmailExisted(email: event.email);
      bool isUsernameExisted =
          await registerService.isUsernameExisted(username: event.username);
      String message = "";
      if (isEmailExisted) {
        message = "Email is existed";
      } else {
        if (isUsernameExisted)
          message = "Username is existed";
      }
      if (message.isNotEmpty)
        yield SignUpStateCheckExisted(message: message);
      else {
        user.username = event.username;
        user.password = event.password;
        user.email = event.email;
        yield SignUpStepOneStateSuccess();
      }
    }
    else
      if (event is CompleteStepSecondEvent){
        yield SignUpLoading();
        user.name = event.name;
        user.phone = event.phoneNumber;
        user.address = event.address;
        user.dateOfBirth = DateFormat('yyyy-MM-dd').format(event.dateOfBirth);
        otp = await registerService.sendOtp(email: user.email, name: user.name);
        yield SignUpStepSecondStateSuccess();
      }
      else
        if (event is SubmitOtpEvent){
          if (otp == event.otp){
            userService.create(user);
            yield SignUpOtpSuccess();
          }
          else
            yield SignUpOtpFailure();
        }
  }
}
