import 'package:bloc/bloc.dart';
import 'package:dip_app/service/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  NewsCubit get(context) => BlocProvider.of(context);

  List<dynamic> bussiness = [];

  void getData() {
    emit(NewsBussinessLoading());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '82ba4205494946078b0a8c1bf43f9cfb',
    }).then((value) {
      bussiness = value.data['articles'];
      emit(NewsGetBussinessSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBussinessError(error));
    });
  }
}
