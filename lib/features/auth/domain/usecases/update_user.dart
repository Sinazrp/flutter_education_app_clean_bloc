import 'package:equatable/equatable.dart';
import 'package:flutter_education_app_clean_bloc/core/usecases/usecases.dart';
import 'package:flutter_education_app_clean_bloc/core/utils/enums.dart';
import 'package:flutter_education_app_clean_bloc/core/utils/type_defs.dart';
import 'package:flutter_education_app_clean_bloc/features/auth/domain/repositories/auth_repo.dart';

class UpdateUser extends UseCase<void, UpdateUserParams> {
  const UpdateUser(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call({required UpdateUserParams params}) =>
      _repo.updateUser(
        action: params.action,
        userData: params.userData,
      );
}

class UpdateUserParams extends Equatable {
  const UpdateUserParams({required this.action, required this.userData});

  const UpdateUserParams.empty()
      : this(action: UpdateUserAction.displayName, userData: '');

  final UpdateUserAction action;
  final dynamic userData;

  @override
  List<dynamic> get props => [action, userData];
}
