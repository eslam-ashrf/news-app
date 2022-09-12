import 'package:flutter/material.dart';
import '../../modules/webview.dart';

Widget buildArticleItem( articles,context){
  return  InkWell(
    onTap: (){
      Navigator.push(
          context,
      MaterialPageRoute(
          builder:(context)=> WebViewScreen(articles)
      )
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('${articles["urlToImage"]}')
                )
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${articles["title"]}',
                      style:Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    '${articles["publishedAt"]}',
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
Widget formField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required IconData prefix,
  required String label,
  String? Function(String?)? validate,
  void Function()? onTap,
  IconData? suffix,
  String? Function(String?)? onSubmit,
  double height=80,
  bool isPassword = false,
  void Function()? onPressed,
  String? Function(String?)? onChange,
  bool isClickable = true,
}) =>
    Container(
      height: height,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validate,
        obscureText: isPassword,
        onTap: onTap,
        enabled:isClickable ,
        onFieldSubmitted: onSubmit,
        onChanged:onChange ,
        decoration: InputDecoration(
          prefixIcon: Icon(prefix),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(suffix),
          ),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
    );
