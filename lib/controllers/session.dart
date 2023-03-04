import 'package:get_storage/get_storage.dart';

class Session {
  final box = GetStorage();

  setData(key, value) {
    box.write(key, value);
  }

  getData(key) {
    print(box.read(key));
  }
}
