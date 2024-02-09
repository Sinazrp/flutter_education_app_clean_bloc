import 'package:flutter_education_app_clean_bloc/core/utils/enums.dart';
import 'package:flutter_education_app_clean_bloc/core/utils/type_defs.dart';
import 'package:flutter_education_app_clean_bloc/features/auth/domain/entities/user.dart';

abstract class AuthRepo {
  const AuthRepo();
  ResultFuture<LocalUser> signIn({
    required String email,
    required String password,
  });
  ResultFuture<LocalUser> signUp({
    required String email,
    required String password,
    required String fullName,
  });

  ResultFuture<void> forgotPassword(String email);

  ResultFuture<void> updateUser({
    dynamic userData,
    UpdateUserAction action,
  });
}
