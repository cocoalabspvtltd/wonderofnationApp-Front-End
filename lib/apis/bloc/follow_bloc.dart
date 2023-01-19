import 'dart:async';
import 'package:oo/apis/modelclass/club_list_model.dart';
import 'package:oo/apis/modelclass/follow_modelclass.dart';
import 'package:oo/apis/repositories/club_list_repositories.dart';
import 'package:oo/apis/repositories/follow_repository.dart';
import 'package:oo/elements/LoadMoreListener.dart';

import '../../constants/response.dart';

class FollowBloc {
  FollowRepository _followRepository =  FollowRepository();

  bool hasNextPage = false;
  int pagenumber = 1;
  int perPage = 20;
  LoadMoreListener? listener;
  final _followController =
  StreamController<Response<FollowModelClass>>.broadcast();

  StreamSink<Response<FollowModelClass>> get followDataSink =>
      _followController.sink;

  Stream<Response<FollowModelClass>>? get followDataStream =>
      _followController.stream;


  getfollowingList(bool isPagination, {int? perpage}) async {
    if (isPagination) {
      pagenumber = pagenumber + 1;
      listener?.refresh(true);

      print("page number" + pagenumber.toString());
    } else {
      followDataSink.add(Response.loading('Fetching'));
      pagenumber = 1;
      followDataSink.add(Response.loading('Fetching'));
    }

    try {
      FollowModelClass? followinglist =
      await _followRepository.getFollowing(pagenumber, perPage);

      followDataSink.add(Response.success(followinglist!));
    } catch (error, s) {
      Completer().completeError(error, s);
      if (isPagination) {
        listener!.refresh(false);
      } else {
        followDataSink!
            .add(Response.error(error.toString()));
      }
    }
    finally {}
  }

  getfollowersList(bool isPagination, {int? perpage}) async {
    if (isPagination) {
      pagenumber = pagenumber + 1;
      listener?.refresh(true);

      print("page number" + pagenumber.toString());
    } else {
      followDataSink.add(Response.loading('Fetching'));
      pagenumber = 1;
      followDataSink.add(Response.loading('Fetching'));
    }

    try {
      FollowModelClass? followerslist =
      await _followRepository.getFollowers(pagenumber, perPage);

      followDataSink.add(Response.success(followerslist!));
    } catch (error, s) {
      Completer().completeError(error, s);
      if (isPagination) {
        listener!.refresh(false);
      } else {
        followDataSink!
            .add(Response.error(error.toString()));
      }
    }
    finally {}
  }
  getuserfollowersList(bool isPagination,int id, {int? perpage}) async {
    if (isPagination) {
      pagenumber = pagenumber + 1;
      listener?.refresh(true);

      print("page number" + pagenumber.toString());
    } else {
      followDataSink.add(Response.loading('Fetching'));
      pagenumber = 1;
      followDataSink.add(Response.loading('Fetching'));
    }

    try {
      FollowModelClass? followerslist =
      await _followRepository.getUserFollowers(pagenumber, perPage,id);

      followDataSink.add(Response.success(followerslist!));
    } catch (error, s) {
      Completer().completeError(error, s);
      if (isPagination) {
        listener!.refresh(false);
      } else {
        followDataSink!
            .add(Response.error(error.toString()));
      }
    }
    finally {}
  }
  dispose() {
    _followController.close();
  }

  getUserfollowingList(bool isPagination,int id, {int? perpage}) async {
    if (isPagination) {
      pagenumber = pagenumber + 1;
      listener?.refresh(true);

      print("page number" + pagenumber.toString());
    } else {
      followDataSink.add(Response.loading('Fetching'));
      pagenumber = 1;
      followDataSink.add(Response.loading('Fetching'));
    }

    try {
      FollowModelClass? followinglist =
      await _followRepository.getUserFollowing(pagenumber, perPage,id);

      followDataSink.add(Response.success(followinglist!));
    } catch (error, s) {
      Completer().completeError(error, s);
      if (isPagination) {
        listener!.refresh(false);
      } else {
        followDataSink!
            .add(Response.error(error.toString()));
      }
    }
    finally {}
  }
}
