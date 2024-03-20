import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_53nasr/cubit/news_cubit.dart';
import 'package:news_app_53nasr/cubit/news_state.dart';

import 'builder_item.dart';

class Business extends StatelessWidget {
  const Business({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStateApp>(
      listener: (context, state) {
        if(state is LoadingBusinessDataApp){
           CircularProgressIndicator();
        }
        else if(state is ErrorGetBusinessDataApp){
         const Center(child:  Text("error happen"));
      };
        },
      builder: (context, state) {
        return listItem(list: NewsCubit
            .get(context)
            .businessList);
      },
    );
  }
}
