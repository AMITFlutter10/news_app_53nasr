import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_53nasr/cubit/news_cubit.dart';
import 'package:news_app_53nasr/cubit/news_state.dart';
import 'package:news_app_53nasr/view/sport_page.dart';
import 'package:news_app_53nasr/view/technology_page.dart';

import 'business_page.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
List<Widget>screens=[
  Technology(),
  Business(),
  Sport(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit,NewsStateApp>(
      builder: (context,state)=>
      Scaffold(
        body:screens[NewsCubit.get(context).currentIndex] ,
        bottomNavigationBar:  BottomNavigationBar(
           currentIndex: NewsCubit.get(context).currentIndex,
          onTap: (index){
            NewsCubit.get(context).changeNavBar(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.temple_buddhist_outlined),label: "Technology"),
            BottomNavigationBarItem(icon: Icon(Icons.business),label: "Business"),
            BottomNavigationBarItem(icon: Icon(Icons.sports),label: "Sport"),

          ],
        ),
      ),
    );
  }
}
