import 'package:ecommerce/events/authentication_event.dart';
import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/service/authentication_service.dart';
import 'package:ecommerce/service/user_service.dart';
import 'package:ecommerce/state/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService authenticationService = AuthenticationService();

  AuthenticationBloc() : super(AuthenticationState());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is LogInEvent) {
      String token =
          await authenticationService.authenticate(event.username, event.password);
      if (token == null) {
        yield AuthenticationStateFailure();
      } else {
        User user = await authenticationService.getUserInfor(token);
        yield AuthenticationStateSuccess(user: user);
      }
    }
  }
}
