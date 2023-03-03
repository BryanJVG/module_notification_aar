part of 'home_refresh_bloc.dart';

@immutable
abstract class HomeRefreshEvent {}

class RefreshEvent extends HomeRefreshEvent{}
class FirstLoadEvent extends HomeRefreshEvent{}