import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/shared/cubits/search_cubit/search_cubit.dart';
import '../../../shared/componantes/componantes.dart';
import '../../../shared/widget/build_fav_item.dart';
import '../../../shared/widget/custom_text_form.dart';


class SearchView extends StatelessWidget {
   SearchView({Key? key}) : super(key: key);
  final TextEditingController searchController =TextEditingController() ;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: searchController,
                      labelText: 'Search',
                      prefix: Icons.search,
                      inputType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter text to start search';
                        }
                        return null;
                      },
                      onSubmitted: (text){
                        SearchCubit.get(context).search(text);
                      },
                    ),
                    const  SizedBox(height: 15,),
                    if(state is SearchLoading)
                    const LinearProgressIndicator(),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: SearchCubit.get(context).searchModel!.data!.data!.length,
                        itemBuilder: (context, index) => BuildFavItem(model:SearchCubit.get(context).searchModel!.data!.data![index],isOldPrice: false,),
                        separatorBuilder: (context, index) => myDivider(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
