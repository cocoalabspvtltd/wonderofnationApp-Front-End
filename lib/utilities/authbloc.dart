// import 'dart:async';
//
// import 'package:oo/apis/modelclass/loginmodel.dart';
//
// import '../apis/repositories/register_Repositories.dart';
//
// class AuthBlocUser {
//   drLOginRepository? _authRepository;
//
//   AuthBlocUser() {
//     if (_authRepository == null) _authRepository = drLOginRepository();
//   }
//
//   Future<UserDetails> userRegistration(String body) async {
//     try {
//       UserDetails response = await _authRepository!.login(body);
//       return response;
//     } catch (e, s) {
//       Completer().completeError(e, s);
//       throw e;
//     }
//   }
//
//   Future<UserDetails> login(String body) async {
//     print("body->${body}");
//     try {
//       return await _authRepository!.login(body);
//     } catch (e, s) {
//       Completer().completeError(e, s);
//       throw e;
//     }
//   }}