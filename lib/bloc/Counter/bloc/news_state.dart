part of 'news_bloc.dart';

@immutable
class NewsState {}

class NewsInitial extends NewsState {}

class NewsInitialSport extends NewsState {}

class LoadingBussinessState extends NewsState {}

class SuccessBussinessState extends NewsState {
  NewsData? news;
  SuccessBussinessState({required this.news});
}

class ErrorBussinessState extends NewsState {
  String? error;
  ErrorBussinessState({required this.error});
}

class SuccessSportsState extends NewsState {
  NewsData? news;
  SuccessSportsState({required this.news});
}

class ErrorSportsState extends NewsState {
  String? error;
  ErrorSportsState({required this.error});
}
