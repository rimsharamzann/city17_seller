
import 'package:city17_seller/source/services/api_services.dart';

class DisplayDataSrc {
  Future getDisplays() async {
    print('getting data...........');
    return await APIService.instance.request(
      '/seller/v2',
      DioMethod.get,
    );
  }

  
}
