part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  HomeState([List props = const <dynamic>[]]) : super(props);
}

class EmptyHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class ErrorHomeState extends HomeState {}

class GoToHomeState extends HomeState {}

class SplashScreenState extends HomeState {}
