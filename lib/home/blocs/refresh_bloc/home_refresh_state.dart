part of 'home_refresh_bloc.dart';

@immutable
abstract class HomeRefreshState {}


class LoadedState extends HomeRefreshState {
  LoadedState(this.items);
  final List<Twit> items;
}
class LoadingState extends HomeRefreshState {}
class UniatializedState extends HomeRefreshState{}
