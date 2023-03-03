import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_notification/models/twit_from_api_model.dart';
import '../blocs/refresh_bloc/home_refresh_bloc.dart';
import 'tweet.dart';

class TweetList extends StatelessWidget {
  const TweetList({Key? key, required this.tweetList}) : super(key: key);
  final List<Twit> tweetList;
  @override
  Widget build(BuildContext context) {
    final refreshBloc = BlocProvider.of<HomeRefreshBloc>(context);
    return RefreshIndicator(
      onRefresh: () async {
        refreshBloc.add(RefreshEvent());
      },
      child: ListView.builder(
        itemBuilder: (_, int index) => Tweet(tweetModel: tweetList[index]),
        itemCount: tweetList.length,
        reverse: false,
      ),
    );
  }
}
