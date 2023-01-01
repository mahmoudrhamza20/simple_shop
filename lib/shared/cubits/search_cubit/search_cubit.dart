import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/models/search_model.dart';
import 'package:shop/shared/componantes/constsants.dart';
import 'package:shop/shared/network/end_points.dart';
import 'package:shop/shared/network/remote/dio_helper.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

   SearchModel? searchModel;
  void search(String text){
    emit(SearchLoading());
    DioHelper.postData(
        url: kSearch,
        token: token,
        data: {"text":text},
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccess());
    }).catchError((error){
      emit(SearchError());
    });
  }
}
