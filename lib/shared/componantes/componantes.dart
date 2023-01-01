
import 'package:flutter/material.dart';

import '../../views/login_view.dart';
import '../network/local/cache_helper.dart';


void printFullText(String text){
  final pattern = RegExp('.{1,800}'); //800 the size
  pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
}
void signOut(BuildContext context) {
  CacheHelper.removeData(key: 'token').then((value){
    if(value ){
      navigateAndFinish(context, ShopLoginView());
    }
  });
}

void navigateAndFinish(BuildContext context ,Widget widget) =>
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  widget,), (Route<dynamic> route) => false);

void navigateTo(context,widget) => Navigator.push(context,MaterialPageRoute(builder: (context) => widget,) );
// Widget defaultFormField({
//   required TextEditingController controller,
//   required String labelText,
//   required IconData prefix,
//   required String? Function(String?)? validator,
//   required TextInputType inputType,
//   bool isPassword = false,
//   required IconData? suffix,
//   required void Function()? suffixPressed,
//   required void Function()? onTap,
//   required void Function(String)? onChange,
//   bool isClickable = true,
// }) => TextFormField(
//   controller: controller,
//   keyboardType: inputType,
//   obscureText: isPassword,
//   decoration: InputDecoration(
//     border: const OutlineInputBorder(),
//     labelText: labelText,
//     prefixIcon: Icon(prefix),
//     suffixIcon: suffix != null
//         ? IconButton(
//         onPressed: suffixPressed,
//         icon: Icon(
//           suffix,
//         ))
//         : null,
//   ),
//   validator:validator ,
//   onTap: onTap,
//   onChanged:onChange ,
//   enabled:isClickable ,
// );



// Widget buildTaskItem (Map model,context)=> Dismissible(
//   key: Key(model['id'].toString()),
//   child:   Padding(
//
//     padding: const EdgeInsets.all(20),
//
//     child: Row(
//
//       children: [
//
//         CircleAvatar(
//
//           radius: 40,
//
//           child: Text('${model['time']}'),
//
//         ),
//
//         const SizedBox(width: 20,),
//
//         Expanded(
//
//           child: Column(
//
//             crossAxisAlignment: CrossAxisAlignment.start,
//
//             mainAxisSize: MainAxisSize.min,
//
//             children: [
//
//               Text(
//
//                 '${model['title']}',
//
//                 style: const TextStyle(
//
//                   fontSize: 18,
//
//                   fontWeight: FontWeight.bold,
//
//                 ),
//
//               ),
//
//               Text(
//
//                 '${model['date']}',
//
//                 style: const TextStyle(
//
//                   color: Colors.grey,
//
//                 ),
//
//               ),
//
//             ],
//
//           ),
//
//         ),
//
//         const SizedBox(width: 20,),
//
//         IconButton(
//
//             icon: const Icon(Icons.check_box,color: Colors.green,),
//
//             onPressed: (){
//
//               AppCubit.get(context).updateData(status: 'done', id: model['id']);
//
//             },
//
//         ),
//
//         IconButton(
//
//             icon: const Icon(Icons.archive,color: Colors.black45,),
//
//             onPressed: (){
//
//               AppCubit.get(context).updateData(status: 'archive', id: model['id']);
//
//             },
//
//         ),
//
//       ],
//
//     ),
//
//   ),
//   onDismissed: (directions)
//   {
// AppCubit.get(context).deleteData(id: model['id']);
//   },
// );
// Widget tasksBuilder({
//    required List<Map> tasks
// })=> ConditionalBuilder(
//   condition: tasks.isNotEmpty,
//   builder: (context)=> ListView.separated(
//     itemBuilder: (context, index) => buildTaskItem(tasks[index],context),
//     separatorBuilder: (context, index) => myDivider(),
//     itemCount: tasks.length,
//   ),
//   fallback: (context)=>Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: const [
//         Icon(
//           Icons.menu,
//           size: 100,
//           color: Colors.grey,
//         ),
//         Text('No Tasks Yet, Please Add Some Tasks',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//             color: Colors.grey,
//           ),)
//       ],),
//   ),
// );

Widget myDivider()=>Padding(
  padding: const EdgeInsetsDirectional.only(start: 20),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ),
);

// Widget buildArticleItem (article,context)=>InkWell(
//   onTap: (){
//     //navigateTo(context, WebViewScreen(article['url']));
//   },
//   child:   Padding(
//
//     padding: const EdgeInsets.all(20.0),
//
//     child: Row(
//
//       children: [
//
//         Container(
//
//           width: 120,
//
//           height: 120,
//
//           decoration: BoxDecoration(
//
//               borderRadius: BorderRadius.circular(10),
//
//               image: DecorationImage(
//
//                 image:NetworkImage('${article['urlToImage']}',),
//
//                 fit: BoxFit.cover,
//
//               ),
//
//           ),
//
//         ),
//
//         const SizedBox(width: 20,),
//
//         Expanded(
//
//           child: Container(
//
//             height: 120,
//
//             child: Column(
//
//               crossAxisAlignment: CrossAxisAlignment.start,
//
//               mainAxisAlignment: MainAxisAlignment.start,
//
//               children: [
//
//                 Expanded(
//
//                   child: Text(
//
//                     '${article['title']}' ,
//
//                     maxLines: 3,
//
//                     overflow:TextOverflow.ellipsis,
//
//                     style:Theme.of(context).textTheme.bodyText1,
//
//                   ),
//
//                 ),
//
//                 Text(
//
//                   '${article['publishedAt']}',
//
//                   style: const TextStyle(
//
//                       color: Colors.grey
//
//                   ),
//
//                 ),
//
//               ],
//
//             ),
//
//           ),
//
//         )
//
//       ],
//
//     ),
//
//   ),
// );
// Widget articleBuilder( list,context,{ isSearch = false})=>ConditionalBuilder(
//   condition: list.length>0,
//   builder: (context)=>ListView.separated(
//       physics: const BouncingScrollPhysics(),
//       itemBuilder: (context,index)=>buildArticleItem(list[index],context),
//       separatorBuilder:(context,index)=> myDivider(),
//       itemCount:list.length
//   ),
//   fallback: (context)=> isSearch ? Container():const Center(child: CircularProgressIndicator()),
// );