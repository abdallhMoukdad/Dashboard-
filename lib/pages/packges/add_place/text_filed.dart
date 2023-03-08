import 'package:flutter/material.dart';

class TextFormFiledWidget extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final String? lapleText;
  final int? mline;
  final int? maxl;
  //final String? helpertext;
  final Function(String)? onChange;
  final Function(String?)? onSave;

  String? Function(String? val)? validator;
  final TextInputType? textInputType;
  final bool? isObserver;
  final TextEditingController? textEditingController;

  TextFormFiledWidget(
      {Key? key,
      required this.icon,
      required this.hintText,
      this.mline,
      this.maxl,
      // required this.helpertext,
      required this.lapleText,
      required this.onChange,
      required this.onSave,
      required this.validator,
      required this.textInputType,
      this.textEditingController,
      this.isObserver = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: textEditingController,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,
      decoration: InputDecoration(
        //   helperText: helpertext,

        hoverColor: Colors.blue.shade100,
        hintText: hintText,
        icon: Icon(icon,color: Colors.deepPurple,),
        iconColor: Colors.deepPurple,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        labelText: lapleText,
        //  prefixIcon: Icon(icon),
      ),
      maxLines: maxl,
      minLines: mline,
      onChanged: onChange,
      validator: validator,
      onSaved: onSave,

    );
  }
}
