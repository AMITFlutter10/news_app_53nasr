


import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_53nasr/constant.dart';
import 'package:news_app_53nasr/cubit/news_state.dart';
import 'package:news_app_53nasr/dio_helper.dart';

import '../model/articles_model.dart';

class NewsCubit extends Cubit<NewsStateApp>{
  // constructor
  NewsCubit(): super(InitialStateApp());

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=935fd7ff5d5d47b9b01be1f7c0b9ba00

 static NewsCubit get(context)=> BlocProvider.of(context);

  ArticlesModel articlesModel = ArticlesModel();  // object model
  List<Articles> sportList= [];
  List<Articles> businessList =[];
  List<Articles> technologyList =[];
  // 1- loading
  //2- success
  //3- failed
  getSport()async{
     emit(LoadingSportDataApp());
     DioHelper.getData(url: endPoint,
         query: {
       "country": "us",
       "category":"sport",
       "apiKey":"935fd7ff5d5d47b9b01be1f7c0b9ba00"
        }).then((value){
          articlesModel = ArticlesModel.fromJson(value.data);
          sportList = articlesModel.articles!;
          emit(SuccessGetSportDataApp());
     }).catchError((error){
       print(error);
       emit(ErrorGetSportDataApp());
     });
   }

  getBusiness()async{
    emit(LoadingBusinessDataApp());
    DioHelper.getData(url: endPoint,
        query: {
          "country": "us",
          "category":"business",
          "apiKey":"935fd7ff5d5d47b9b01be1f7c0b9ba00"
        }).then((value){
      articlesModel = ArticlesModel.fromJson(value.data);
      businessList = articlesModel.articles!;
      emit(SuccessGetBusinessDataApp());
    }).catchError((error){
      print(error);
      emit(ErrorGetBusinessDataApp());
    });
  }

  getTechnology()async{
    emit(LoadingTechnologyDataApp());
    DioHelper.getData(url: endPoint,
        query: {
          "country": "us",
          "category":"technology",
          "apiKey":"935fd7ff5d5d47b9b01be1f7c0b9ba00"
        }).then((value){
      articlesModel = ArticlesModel.fromJson(value.data);
      technologyList = articlesModel.articles!;
      emit(SuccessGetTechnologyDataApp());
    }).catchError((error){
      print(error);
      emit(ErrorGetTechnologyDataApp());
    });}




  int currentIndex= 0;
  
  void changeNavBar(int index){
    currentIndex= index;
    emit(ChangeNavBarState());
  }

}