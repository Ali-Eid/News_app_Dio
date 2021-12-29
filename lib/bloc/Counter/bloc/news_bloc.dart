import 'package:bloc/bloc.dart';
import 'package:dip_app/model/news_model.dart';
import 'package:dip_app/service/http.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    // on<NewsEvent>((event, emit) {});
    // on<NewsEvent>((event, emit) {});
    on<BussinessEvent>((event, emit) async {
      try {
        emit(LoadingBussinessState());
        NewsData dataBussiness = await Http.getData();
        emit(SuccessBussinessState(news: dataBussiness));
      } catch (e) {
        emit(ErrorBussinessState(error: e.toString()));
      }
    });
    // on<SportsEvent>((event, emit) async {
    //   try {
    //     emit(LoadingBussinessState());
    //     NewsData data = await Http.getDataSport();
    //     emit(SuccessSportsState(news: data));
    //   } catch (e) {
    //     emit(ErrorSportsState(error: e.toString()));
    //   }
    // });
  }
}

class NewsSportBloc extends Bloc<NewsEvent, NewsState> {
  NewsSportBloc() : super(NewsInitialSport()) {
    // on<NewsEvent>((event, emit) {});
    // on<BussinessEvent>((event, emit) async {
    //   try {
    //     emit(LoadingBussinessState());
    //     NewsData dataBussiness = await Http.getData();
    //     emit(SuccessBussinessState(news: dataBussiness));
    //   } catch (e) {
    //     emit(ErrorBussinessState(error: e.toString()));
    //   }
    // });
    on<SportsEvent>((event, emit) async {
      try {
        emit(LoadingBussinessState());
        NewsData data = await Http.getDataSport();
        emit(SuccessSportsState(news: data));
      } catch (e) {
        emit(ErrorSportsState(error: e.toString()));
      }
    });
  }
}
  // List<Articles>? data = [];
        // List<String?>? dd = [];
        // data = dataBussiness.articles;
        // data!.forEach((element) {
        //   dd.add(element.title);
        // });
        // print(data);
        // print(dd[0]);
        // List<NewsData> data = data.add(dataBussiness.articles.);
        // List<NewsData> data = data.add(dataBussiness.articles.);