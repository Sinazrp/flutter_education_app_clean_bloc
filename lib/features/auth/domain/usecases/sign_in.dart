import 'package:equatable/equatable.dart';
import 'package:flutter_education_app_clean_bloc/core/usecases/usecases.dart';
import 'package:flutter_education_app_clean_bloc/core/utils/type_defs.dart';
import 'package:flutter_education_app_clean_bloc/features/auth/domain/entities/user.dart';
import 'package:flutter_education_app_clean_bloc/features/auth/domain/repositories/auth_repo.dart';

class SignIn extends UseCase<LocalUser, SignInParams> {
  const SignIn(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<LocalUser> call({required SignInParams params}) => _repo.signIn(
        email: params.email,
        password: params.password,
      );
}

class SignInParams extends Equatable {
  const SignInParams({
    required this.email,
    required this.password,
  });

  const SignInParams.empty()
      : email = '',
        password = '';

  final String email;
  final String password;

  @override
  List<String> get props => [email, password];
}
