import 'package:dip_app/bloc/Counter/bloc/news_bloc.dart';
import 'package:dip_app/layout/pages/page1.dart';
import 'package:dip_app/layout/pages/page2.dart';
import 'package:dip_app/layout/pages/page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int currentindex = 0;
  List<Widget> screen = [PageOne(), PageTwo(), PageThree()];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     // DioHelper.getData(url: 'v2/top-headlines', query: {
          //     //   'country': 'us',
          //     //   'category': 'business',
          //     //   'apiKey': '82ba4205494946078b0a8c1bf43f9cfb',
          //     // }).then((value) {
          //     //   print(value.data);
          //     // }).catchError((error) {
          //     //   print('$error');
          //     // });
          //    // BlocProvider.of<NewsBloc>(context).add(BussinessEvent());
          //   },
          //   child: Icon(Icons.add),
          // ),
          appBar: AppBar(
            title: Text('News App'),
          ),
          body: screen[currentindex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                currentindex = index;
              });
            },
            currentIndex: currentindex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business), label: 'Bussines'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: 'Sports'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: 'Sciense')
            ],
          ),
        );
      },
    );
  }
}
