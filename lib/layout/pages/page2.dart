import 'package:dip_app/bloc/Counter/bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsSportBloc, NewsState>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      if (state is NewsInitialSport) {
        BlocProvider.of<NewsSportBloc>(context).add(SportsEvent());
      }
      if (state is LoadingBussinessState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is SuccessSportsState) {
        return SmartRefresher(
          header: WaterDropHeader(),
          //  enablePullUp: true,
          controller: RefreshController(),
          // onLoading: () {
          //   BlocProvider.of<NewsBloc>(context).add(SportsEvent());
          // },
          onRefresh: () {
            BlocProvider.of<NewsSportBloc>(context).add(SportsEvent());
          },
          child: ListView.builder(
              itemCount: state.news?.articles!.length,
              itemBuilder: (context, index) {
                return Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${state.news?.articles![0].urlToImage}'))),
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
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  )
                ]);
              }),
        );
      } else if (state is ErrorSportsState) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.do_disturb_rounded,
                color: Colors.red,
                size: 40,
              ),
              //    Padding(padding: EdgeInsets.all(8)),
              Text('Please Check Connection'),
            ],
          ),
        );
      } else {
        return Center(
          child: Text('the app is Under Constructor'),
        );
      }
    });
  }
}
