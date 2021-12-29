part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsGetBussinessSuccess extends NewsState {}

class NewsBussinessLoading extends NewsState {}

class NewsGetBussinessError extends NewsState {
  final String? error;
  NewsGetBussinessError(this.error);
}
