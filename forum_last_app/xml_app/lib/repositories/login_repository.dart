import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xml_app/core/app_errors.dart';
import 'package:xml_app/modules/login/models/credential_model.dart';
import 'package:xml_app/modules/login/models/user_model.dart';

class LoginRepository{
  Future<Either<Failure, UserModel>> login(CredentialModel credential) async {
    try{
      final user = ParseUser(
      credential.email.trim(),
      credential.password.trim(),
      credential.email.trim(),
    );
    final response = await user.login();
    if(response.success){
      final result = UserModel.fromMap(response.results.first);
      return Right();
    }
    } on Exception catch(error){
      return throw ApiError(error.toString());
    }
    
  }
}