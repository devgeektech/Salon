// import 'package:flutter/material.dart';
//
// import '../util/theme.dart';
//
// class CustomTextField extends StatelessWidget {
//   //final String title;
//   final String? hintText;
//   final TextStyle? hintStyle;
//   final TextEditingController? controller;
//   final bool obscureText;
//   final bool readOnly;
//   final Function(String)? onChanged;
//   final TextInputType? keyboardType;
//   final String? Function(String?)? validator;
//   final Widget? suffixIcon;
//   final FocusNode? focusNode;
//   final VoidCallback? ontap;
//   final TextInputAction? textInputAction;
//
//   const CustomTextField({
//     Key? key,
//     //  required this.title,
//     this.ontap,
//     this.hintText,
//     this.hintStyle = const TextStyle(
//       fontSize: 14,
//       color: Color(0xFF697D95),
//       fontFamily: 'Circular Std',
//     ),
//     this.controller,
//     this.obscureText = false,
//     this.onChanged,
//     this.keyboardType,
//     this.validator,
//     this.suffixIcon,
//     this.focusNode,
//     this.textInputAction,
//     this.readOnly = false,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height *.075,
//       padding: EdgeInsets.only(left: 10),
//       clipBehavior: Clip.none,
//       decoration: BoxDecoration(
//         border: Border.all(
//             width: 1,
//             color: Color(0xFF000000).withOpacity(0.2)
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//       ),
//       child: TextFormField(
//         textInputAction: textInputAction,
//         onTap: ontap,
//         focusNode: focusNode,
//         controller: controller,
//         obscureText: obscureText,
//         onChanged: onChanged,
//         keyboardType: keyboardType,
//         validator: validator,
//         readOnly: readOnly,
//         decoration: InputDecoration(
//           suffixIcon: suffixIcon,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(
//               color: Colors.transparent,
//               width: 1,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.transparent,
//               width: 1,
//             )
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.transparent,
//               width: 1,
//             )
//           ),
//             errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(4)),
//                 borderSide: BorderSide(
//                   width: 1,
//                   color: Colors.transparent,
//                 )),
//           isDense: true,
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: 0,
//             vertical: 14,
//           ),
//           hintText: hintText,
//             hintStyle: TextStyle(
//                 fontSize: 15,
//                 fontFamily: "Lato-Bold",
//                 fontWeight: FontWeight.w400,
//                 color: Color(0xFF000000).withOpacity(0.4)
//             )
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/theme.dart';


class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final bool obscureText;
  final Color? backgroundColor;
  final int? minLines; // Set this
  final int? maxLines;
  final bool readOnly;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final VoidCallback? ontap;
  final TextInputAction? textInputAction;

  const CustomTextField({
    Key? key,
    //  required this.title,
    this.ontap,
    this.hintText,
    this.hintStyle ,
    this.controller,
    this.obscureText = false,
    this.backgroundColor ,
    this.onChanged,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      onTap: ontap,
      focusNode: focusNode,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: validator,
      readOnly: readOnly,
      minLines: minLines,
      maxLines: maxLines,
      style: TextStyle(
          fontSize: 16.sp,
          fontFamily: "ManoropeLight",
          fontWeight: FontWeight.w400,
          color: Color(0xFF000000).withOpacity(0.4)
      ),

      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ThemeProvider.blackColor.withOpacity(0.2),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeProvider.blackColor.withOpacity(0.2),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeProvider.blackColor.withOpacity(0.2),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),

          isDense: true,
          contentPadding:  EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 14,
              fontFamily: "ManoropeRegular",
              fontWeight: FontWeight.w400,
              color: ThemeProvider.hintTextColor
          )
      ),
    );
  }
}
