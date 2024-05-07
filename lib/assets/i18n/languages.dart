import 'package:get/get.dart';
import '_en.dart';
import '_th.dart';

class Languages extends Translations {
  // final MockDataLoader _mockDataLoader = inject<MockDataLoader>();
  @override
  Map<String, Map<String, String>> get keys => {
        'th_TH': THLanguage.th,
        'en_US': ENLanguage.en,
      };

  //TODO: Implement i18n
  // static Future<Map<String, Map<String, String>>> readJson() async {
  //   _mockDataLoader.loadArray(filename)
  //   final res = await rootBundle.loadString('assets/i18n/i18n.json');
  //   List<dynamic> data = jsonDecode(res);
  //   final listData = data.map((j) => I18nModel.fromJson(j)).toList();
  //   final keys = Map<String, Map<String, String>>();
  //   listData.forEach((value) {
  //     final String translationKey = value.code!;
  //     keys.addAll({translationKey: value.texts!});
  //   });
  //   return keys;
  // }
}
