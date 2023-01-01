import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/componantes/componantes.dart';
import '../../../shared/cubits/home_cubit/home_cubit.dart';
import '../../../shared/widget/build_fav_item.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return HomeCubit.get(context).favoritesModel!.data!.data!.isEmpty  ? const Center(child: Text('Add Favorites')): ConditionalBuilder(
        condition: state is !GetFavoritesDataLoading ,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: HomeCubit.get(context).favoritesModel!.data!.data!.length,
            itemBuilder: (context, index) => BuildFavItem(model:HomeCubit.get(context).favoritesModel!.data!.data![index].product),
            separatorBuilder: (context, index) => myDivider(),
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}


