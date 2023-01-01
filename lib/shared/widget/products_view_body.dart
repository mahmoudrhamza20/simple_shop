import 'package:flutter/material.dart';
import 'package:shop/models/categories_model.dart';
import 'package:shop/shared/cubits/home_cubit/home_cubit.dart';
import '../../models/home_model.dart';
import 'custom_categories_item.dart';
import 'custom_product_item.dart';
import 'custom_slider.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({Key? key, required this.homeModel, this.categoriesModel}) : super(key: key);
  final HomeModel homeModel;
  final CategoriesModel? categoriesModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSlider(homeModel: homeModel),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,

                  ),),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: categoriesModel!.data!.data!.length,
                    itemBuilder: (context,
                        index) =>  CustomCategoriesItem(dataModel: HomeCubit.get(context).categoriesModel!.data!.data![index]),
                    separatorBuilder: (context, index) =>
                    const SizedBox(width: 10,),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Products',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,

                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: homeModel.data!.products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.72,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0,
                ),
                itemBuilder: (context, index) => CustomProductItem(productModel: homeModel.data!.products![index])),
          )
        ],
      ),
    );
  }
}


