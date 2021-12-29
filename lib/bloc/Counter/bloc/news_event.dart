part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class BussinessEvent extends NewsEvent {
  // NewsData? news;
  // BussinessEvent({required this.news});
}

class SportsEvent extends NewsEvent {}
