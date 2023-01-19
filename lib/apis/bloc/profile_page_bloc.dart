import 'dart:async';
import 'package:oo/apis/modelclass/profile_model.dart';
import 'package:oo/apis/repositories/register_Repositories.dart';
import '../../constants/response.dart';
import '../repositories/profile_page_repositories.dart';

class ProfilePageBloc {
  ProfilepageRepositories _profileRepository = new ProfilepageRepositories();
  final _profileDataController =
  StreamController<Response<List<ProfileModelClass>>>();

  StreamSink<Response<List<ProfileModelClass>>> get profileListDataSink =>
      _profileDataController.sink;

  Stream<Response<List<ProfileModelClass>>>? get profileDataStream =>
      _profileDataController.stream;

  ProfilePageBloc() {
    _profileRepository = ProfilepageRepositories();
    getprofilesList();

    print("fsfds");
  }

  getprofilesList() async {
    profileListDataSink.add(Response.loading('Fetching...'));
    try {print("object");
    List<ProfileModelClass> _vitallist =
    await _profileRepository.getprofileList();

    profileListDataSink.add(Response.success(_vitallist));
    } catch (e) {
      profileListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }


  dispose() {
    _profileDataController.close();
  }

}
class SuggestionProfilePageBloc {
  ProfilepageRepositories _profileRepository = new ProfilepageRepositories();
  final _UserprofileDataController =
  StreamController<Response<List<dynamic>>>();

  StreamSink<Response<List<dynamic>>> get userprofileListDataSink =>
      _UserprofileDataController.sink;

  Stream<Response<List<dynamic>>>? get userprofileDataStream =>
      _UserprofileDataController.stream;

  SuggestionProfilePageBloc() {
    _profileRepository = ProfilepageRepositories();

    getSuggestionProfileList(userid);
    print("fsfds");
  }

  getSuggestionProfileList(int? userid) async {
    userprofileListDataSink.add(Response.loading('Fetching...'));
    try {
      print("object");
      List<dynamic> _vitallist =
      await _profileRepository.getUserProfilesuggestionList(userid!);

      userprofileListDataSink.add(Response.success(_vitallist));
    } catch (e) {
      userprofileListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _UserprofileDataController.close();
  }
}