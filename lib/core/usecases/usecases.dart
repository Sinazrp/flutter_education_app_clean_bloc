import 'package:flutter_education_app_clean_bloc/core/utils/type_defs.dart';

abstract class UseCase<Type, Params> {
  const UseCase();
  ResultFuture<Type> call({required Params params});
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();
  ResultFuture<Type> call();
}
