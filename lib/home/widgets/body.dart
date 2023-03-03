import 'package:flutter/material.dart';
import 'package:module_notification/assets/colors.dart';
import 'package:module_notification/home/blocs/refresh_bloc/home_refresh_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_notification/home/widgets/tweet_swipable_list.dart';
import '../../networking/firebase_message_provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  void initState() {
    super.initState();
    NotificationListenerProvider().getMessage(context);

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Scaffold(
            backgroundColor: AppColors.darkBlue,
            body: BlocProvider(
              create: (context) => HomeRefreshBloc()..add(FirstLoadEvent()),
              child: BlocBuilder<HomeRefreshBloc, HomeRefreshState>(
                builder: (context, state) {
                  if (state is LoadedState) {
                    return TweetList(
                      tweetList: state.items,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            floatingActionButton: const FloatingActionButton(
              onPressed: null,
              //child: Text(_totalNotifications.toString()),
              child:  Icon(Icons.edit),
            ),
          ),
        ),
      ],
    );
  }
}
