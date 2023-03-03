import 'package:flutter/material.dart';
import 'package:module_notification/assets/colors.dart';
import 'package:module_notification/models/twit_from_api_model.dart';

class Tweet extends StatelessWidget {
  const Tweet({super.key, required this.tweetModel});

  final Twit tweetModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: AppColors.darkBlue,
          border: const Border(bottom: BorderSide())),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(tweetModel.image),
          ),
          _tweetContent()
        ],
      ),
    );
  }

  Widget _tweetContent() {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _userInfo(),
            _tweetText(),
            _tweetInteractions(),
          ],
        ),
      ),
    );
  }

  Widget _userInfo() {
    return Row(
      children: [
        Text(
          tweetModel.name,
          style: TextStyle(
              color: AppColors.tweetWhite, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5.0),
          child: Text(
            " · ${tweetModel.user} ·",
            style: TextStyle(color: AppColors.lightGray),
          ),
        )
      ],
    );
  }

  Widget _tweetText() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 10, right: 10.0),
      child: Text(
        tweetModel.message,
        style: TextStyle(color: AppColors.tweetWhite),
      ),
    );
  }

  Widget _tweetInteractions() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, right: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.message, color: AppColors.tweetWhite),
              Container(
                margin: const EdgeInsets.only(left: 3.0),
                child: Text(
                  tweetModel.reactionBanner.messsages.length.toString(),
                  style: TextStyle(color: AppColors.tweetWhite),
                ),
              )
            ],
          ),
          Row(
            children: [
              Icon(Icons.repeat, color: AppColors.tweetWhite),
              Container(
                margin: const EdgeInsets.only(left: 3.0),
                child: Text(
                  tweetModel.reactionBanner.sharings.length.toString(),
                  style: TextStyle(color: AppColors.tweetWhite),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.favorite, color: AppColors.tweetWhite),
              Container(
                margin: const EdgeInsets.only(left: 3.0),
                child: Text(
                  tweetModel.reactionBanner.favorites.length.toString(),
                  style: TextStyle(color: AppColors.tweetWhite),
                ),
              )
            ],
          ),
          Icon(Icons.share, color: AppColors.tweetWhite),
        ],
      ),
    );
  }
}
