import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/models/categories_model.dart';
import 'package:shop/models/favorites_model.dart';
import 'package:shop/models/home_model.dart';
import 'package:shop/shared/network/end_points.dart';
import 'package:shop/shared/network/remote/dio_helper.dart';
import '../../../models/change_fav_model.dart';
import '../../../models/login_model.dart';
import '../../../views/home/categories/categories_view.dart';
import '../../../views/home/favorites/favorites_view.dart';
import '../../../views/home/products/products_view.dart';
import '../../../views/home/settings/settings_view.dart';
import '../../componantes/constsants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomsScreens = const [
    ProductsView(),
    CategoriesView(),
    FavoritesView(),
    SettingsView(),
  ];

  void changeBottom(index) {
    currentIndex = index;
    emit(HomeChangeBottomNavBar());
  }

  HomeModel? homeModel;
  Map <int , bool> favorites = {}; // to toggle between products
  void getHomeData() {
    emit(HomeDataLoading());
    DioHelper.getData(
      url: kHome,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data!.products!.forEach((element) {   //to add fav products to favorites map
        favorites.addAll({
          element.id! : element.inFavorites! ,
        });
      });
     // print(favorites.toString());
      emit(HomeDataSuccess());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(HomeDataError(error.toString()));
    });
  }

  CategoriesModel? categoriesModel;
  void getCategoriesData() {
    DioHelper.getData(
      url: kCategories,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(CategoriesDataSuccess());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(CategoriesDataError());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;
  void changeFavorites(int? productId){
    favorites[productId!] = !favorites[productId]! ;
    emit(ChangeSuccess());
    DioHelper.postData(
      url: kFavorites,
      token: token,
      data: {"product_id": productId ,},
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      //print(value.data);
      if(!changeFavoritesModel!.status!){
        favorites[productId] = !favorites[productId]! ;
      }else{getFavoritesData();}
      emit(ChangeFavoritesSuccess(changeFavoritesModel!));
    }).catchError((error){
      favorites[productId] = !favorites[productId]! ;
      emit(ChangeFavoritesError());
    });
  }

  FavoritesModel? favoritesModel;
  void getFavoritesData() {
    emit(GetFavoritesDataLoading());
    DioHelper.getData(
      url: kFavorites,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      emit(GetFavoritesDataSuccess());
     // print(value.data);
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetFavoritesDataError());
    });
  }

   LoginModel? userModel;
  void getUserData() {
    emit(GetUserDataLoading());
    DioHelper.getData(url: kProfile, token: token).then((value) {
      userModel = LoginModel.fromJson(value.data);
      //print(userModel!.data!.name);
      emit(GetUserDataSuccess(userModel!));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetUserDataError());
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(UpdateUserDataLoading());
    DioHelper.putData(url: kUpdateProfile, token: token, data: {
      'name': name,
      'email': email,
      'phone': phone,
    }).then((value) {
      userModel = LoginModel.fromJson(value.data);
      //print(userModel.data!.name);
      emit(UpdateUserDataSuccess(userModel!));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(UpdateUserDataError());
    });
  }
}
