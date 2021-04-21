part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticatingUserState extends AuthenticationState {}

class UserAuthenticatedState extends AuthenticationState {
  final User user;
  final Town town;

  UserAuthenticatedState({
    @required this.user,
    @required this.town,
  });

  @override
  List<Object> get props => [user, town];
}

class UserNotAuthenticatedState extends AuthenticationState {}

class UserNotVerifiedState extends AuthenticationState {}

class UserRegisteringState extends AuthenticationState {}

class UserRegisteredState extends AuthenticationState {}

class VerifyLoadingState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {
  final String message;

  AuthenticationErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
