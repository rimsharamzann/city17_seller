// import 'package:city17_seller/source/constants/asset_string.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_svg/svg.dart';


// class CachedNetworkImageWidget extends StatelessWidget {
//   const CachedNetworkImageWidget({
//     super.key,
//     required this.imageUrl,
//     this.errorIcon = AssetString.logo,
//     this.fit = BoxFit.cover,
//     this.height,
//     this.width,
//   });

//   final String imageUrl;
//   final String errorIcon;
//   final BoxFit fit;
//   final double? height;
//   final double? width;

//   @override
//   Widget build(BuildContext context) {
//     return GetUtils.validateURL(imageUrl)
//         ? CachedNetworkImage(
//             imageUrl: imageUrl,
//             fit: fit,
//             height: height,
//             width: width,
//             placeholder: (context, text) {
//               return const Center(child: CupertinoActivityIndicator());
//             },
//             errorWidget: (context, string, dd) {
//               return Center(
//                   child: SvgPicture.asset(
//                 errorIcon,
//                 colorFilter: const ColorFilter.mode(
//                     MyColors.primaryColor, BlendMode.srcIn),
//               ));
//             },
//           )
//         : SvgPicture.asset(
//             errorIcon,
//             fit: fit,
//             colorFilter:
//                 const ColorFilter.mode(MyColors.primaryColor, BlendMode.srcIn),
//           );
//   }
// }
