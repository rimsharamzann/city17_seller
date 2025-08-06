
// import 'package:city17_seller/source/features/home/models/display_model.dart';
// import 'package:city17_seller/source/features/home/network/display_data_src.dart';

// class DisplayRepo {
//   DisplayRepo() {
//     _dataSource = DisplayDataSrc();
//   }

//   late DisplayDataSrc _dataSource;

//   Future<List<DisplayModel>> getDisplays() async {
//     final res = await _dataSource.getDisplays();
//     print(res.data);

//     if (res.data['success']) {
//       // ignore: prefer_interpolation_to_compose_strings
//       return List.from(
//         res.data['data']['seller'].map(
//           (e) => DisplayModel.fromMap(e),
//         ),
//       );
//     }
//     throw MyException(res.data['message']);
//   }
// }
