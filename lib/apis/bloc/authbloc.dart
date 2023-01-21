import 'dart:async';


import 'package:oo/apis/modelclass/loginmodel.dart';
import 'package:oo/apis/modelclass/userloginresponse.dart';

import '../repositories/register_Repositories.dart';

class AuthBlocUser {
  AuthRepository? _authRepository;

  AuthBlocUser() {
    if (_authRepository == null) _authRepository = AuthRepository();
  }

  Future<UserSignInModel> userRegistration(String body) async {
    try {
      UserSignInModel response = await _authRepository!.registerUser(body);
      return response;
    } catch (e, s) {
      Completer().completeError(e, s);
      throw e;
    }
  }

  Future<UserSignInModel> login(String body) async {
    try {
      return await _authRepository!.login(body);
    } catch (e, s) {
      Completer().completeError(e, s);
      throw e;
    }
  }}