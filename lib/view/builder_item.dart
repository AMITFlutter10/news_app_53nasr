

import 'package:flutter/cupertino.dart';

import '../model/articles_model.dart';

class BuilderItem extends StatelessWidget {
  Articles articles;
   BuilderItem({super.key, required this.articles});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Image.network("${articles.urlToImage ?? " "} "),
          const SizedBox(height: 10,),
          Text("${articles.title ?? " no data"} "),
          const SizedBox(height: 10,),
          Text("${articles.description ?? " no data"}"),
        ],
      ),
    );
  }
}


Widget listItem({required List list}){
  return ListView.separated(
      separatorBuilder: (context , index)=>const  SizedBox(height: 10,),
      itemCount: list.length,
    itemBuilder: (context,index){
        return BuilderItem(articles: list[index],);
    },
  );
}