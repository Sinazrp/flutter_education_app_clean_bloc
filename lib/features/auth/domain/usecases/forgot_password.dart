import 'package:flutter_education_app_clean_bloc/core/usecases/usecases.dart';
import 'package:flutter_education_app_clean_bloc/core/utils/type_defs.dart';
import 'package:flutter_education_app_clean_bloc/features/auth/domain/repositories/auth_repo.dart';

class ForgotPassword extends UseCase<void, String> {
  const ForgotPassword(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call({required String params}) =>
      _repo.forgotPassword(params);
}
