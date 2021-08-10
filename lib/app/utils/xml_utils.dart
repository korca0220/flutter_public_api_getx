import 'package:xml/xml.dart';

class XmlUtils {
  static T serchResult<T>(XmlElement xml, String key) {
    assert(null is! T,
        '제네릭 타입을 지정해 주세요. searchResult<String> | searchResult<double>');

    late T val;
    var elements = xml.findAllElements(key).map((e) => e.text);

    switch (T) {
      case double:
        val = (elements.isEmpty ? 0 : double.parse(elements.first)) as T;
        break;
      case String:
        val = (elements.isEmpty ? "" : elements.first) as T;
        break;
    }
    return val;
  }
}
