import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/shared/cubits/home_cubit/home_cubit.dart';

import '../../../models/categories_model.dart';
import '../../../shared/componantes/componantes.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: HomeCubit.get(context).categoriesModel!.data!.data!.length,
          itemBuilder: (context, index) => BuildCatItem(dataModel: HomeCubit.get(context).categoriesModel!.data!.data![index],),
          separatorBuilder: (context, index) => myDivider(),
        );
      },
    );
  }
}

class BuildCatItem extends StatelessWidget {
  const BuildCatItem({
    Key? key, this.dataModel,
  }) : super(key: key);
 final DataModel? dataModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
                dataModel!.image!),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 20,),
          Text(dataModel!.name!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
