import 'package:dip_app/bloc/Counter/bloc/news_bloc.dart';
import 'package:dip_app/model/news_model.dart';
import 'package:dip_app/service/dio_helper.dart';
import 'package:dip_app/service/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'package:pull_to_refresh/pull_to_refresh.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        List<Color> colors = [
          Colors.yellow,
          Colors.green,
          Colors.blue,
          Colors.deepOrange
        ];
        //BlocProvider.of<NewsBloc>(context).add(BussinessEvent());
        if (state is NewsInitial) {
          //for Get Data Auto without press FloatingActionButtom
          //  BlocProvider.of<NewsBloc>(context).add(BussinessEvent());
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<NewsBloc>(context).add(BussinessEvent());
              },
              child: Icon(Icons.add),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_chart,
                    size: 40,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text('Please click Button Add for Fetch Data from API '),
                ],
              ),
            ),
          );
        }
        if (state is LoadingBussinessState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SuccessBussinessState) {
          return SmartRefresher(
            header: WaterDropHeader(),
            // enablePullUp: true,
            controller: RefreshController(),
            // onLoading: () {
            //   BlocProvider.of<NewsBloc>(context).add(SportsEvent());
            // },
            onRefresh: () {
              BlocProvider.of<NewsBloc>(context).add(BussinessEvent());
            },
            child: ListView.builder(
                itemCount: state.news?.articles!.length,
                itemBuilder: (context, index) {
                  return Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          '${state.news?.articles![index].source!.name?.substring(1, 3)}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colors[math.Random().nextInt(colors.length)],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              '${state.news?.articles![index].title}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${state.news?.articles![index].publishedAt!.substring(0, 10)}',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]);
                }),
          );
        } else if (state is ErrorBussinessState) {
          return SmartRefresher(
            header: WaterDropHeader(),
            enablePullUp: true,
            controller: RefreshController(),
            // onLoading: () {
            //   BlocProvider.of<NewsBloc>(context).add(BussinessEvent());
            // },
            onRefresh: () {
              BlocProvider.of<NewsBloc>(context).add(BussinessEvent());
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.do_disturb_alt_sharp,
                    size: 40,
                    color: Colors.red,
                  ),
                  Text('please Check Connection'),
                ],
              ),
            ),
          );
        } else {
          return Text('The app is UnderConstructor');
        }
      },
    );
  }
}
  // color: colors[math.Random().nextInt(colors.length)],
                          //----------------------------------------------
                          //Random Color
                          //Color(
                          //         (math.Random().nextDouble() * 0xFFFFFF).toInt())
                          //     .withOpacity(1.0),
                          //--------------------------------------------
                          // image: DecorationImage(
                          //     image: NetworkImage(
                          //         '${state.news!.articles![index].urlToImage}'),
                          //     fit: BoxFit.cover))),