import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_53nasr/cubit/news_state.dart';

import '../cubit/news_cubit.dart';
import 'builder_item.dart';

class Sport extends StatelessWidget {
  const Sport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStateApp>(
      builder: (context, state) {
        return listItem(list: NewsCubit
            .get(context)
            .sportList);
      },
    );
  }
}
