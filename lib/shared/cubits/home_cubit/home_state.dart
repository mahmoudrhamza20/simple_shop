part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeChangeBottomNavBar extends HomeState {}

class HomeDataLoading extends HomeState {}
class HomeDataSuccess extends HomeState {}
class HomeDataError extends HomeState {
  final String error ;
  HomeDataError(this.error);
}

class CategoriesDataSuccess extends HomeState {}
class CategoriesDataError extends HomeState {}

class GetFavoritesDataSuccess extends HomeState {}
class GetFavoritesDataLoading extends HomeState {}
class GetFavoritesDataError extends HomeState {}

class ChangeFavoritesSuccess extends HomeState {
  final ChangeFavoritesModel model ;

  ChangeFavoritesSuccess(this.model);
}
class ChangeSuccess extends HomeState {}
class ChangeFavoritesError extends HomeState {}

class GetUserDataLoading extends HomeState {}
class GetUserDataSuccess extends HomeState {
  final LoginModel userModel ;

  GetUserDataSuccess(this.userModel);
}
class GetUserDataError extends HomeState {}

class UpdateUserDataLoading extends HomeState {}
class UpdateUserDataSuccess extends HomeState {
  final LoginModel userModel ;

  UpdateUserDataSuccess(this.userModel);
}
class UpdateUserDataError extends HomeState {}