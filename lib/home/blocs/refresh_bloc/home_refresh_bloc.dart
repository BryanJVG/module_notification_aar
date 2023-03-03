import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import '../../../models/api_response_model.dart';
import '../../../models/twit_from_api_model.dart';
import '../../../networking/twitter_api.dart';
import '../../../repositories/twit_repository.dart';

part 'home_refresh_event.dart';
part 'home_refresh_state.dart';

class HomeRefreshBloc extends Bloc<HomeRefreshEvent, HomeRefreshState> {
  late TwitRepository twitRepo;
  HomeRefreshBloc() : super(UniatializedState()) {
    twitRepo = TwitRepository(TwitterApi());
    on<RefreshEvent>((event, emit)  async {  
      emit(LoadingState());
      final List<Twit> generatedTweets = await makeGetPetition(twitRepo);
      emit(LoadedState(generatedTweets));
    });  
    on<FirstLoadEvent>((event, emit) async {  
      emit(LoadingState());
      final generatedTweets =  await makeGetPetition(twitRepo);     
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(LoadedState(generatedTweets));
    });  
  }

  Future<List<Twit>> makeGetPetition(TwitRepository twitRepo)  async {
      var response = await twitRepo.getTwits();
      var responseObj = apiResponseModelFromJson(response.body);
      int responseCode = response.statusCode;
      if(responseCode == 200){
        return responseObj.data ?? [];
      }
      else {
        return [];
      }


  }
  
}
