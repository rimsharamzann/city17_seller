// import 'package:city17_seller/source/core/extensions/context_extension.dart';
// import 'package:flutter/material.dart';

// class CustomDropDownMenu extends StatelessWidget {
//   const CustomDropDownMenu({super.key});
//   final String value;
//    final String

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton<String>(
//         value: 'Textual',
//         borderRadius: BorderRadius.circular(10),

//         dropdownColor: Colors.transparent.withValues(alpha: 0.2),
//         style: context.textTheme.bodySmall?.copyWith(
//           color: Colors.white,
//           height: 2,
//           decorationColor: Colors.white,
//           decoration: TextDecoration.underline,
//         ),
//         alignment: Alignment.topRight,

//         icon: Icon(
//           Icons.arrow_drop_down_rounded,
//           color: Colors.white.withAlpha(230),
//           size: 40,
//         ),
//         items: ['Textual', 'Graphical', 'Tabular']
//             .map(
//               (String value) =>
//                   DropdownMenuItem<String>(value: value, child: Text(value)),
//             )
//             .toList(),
//         onChanged: (value) {},
//       ),
//     );
//   }
// }
