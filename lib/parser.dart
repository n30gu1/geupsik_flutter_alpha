import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:intl/intl.dart';

class Meals {
  String meal;
  String kcal;
  Future get(DateTime date) async {
    var formatter = DateFormat('yyyy/MM/dd');
    String formattedDate = formatter.format(date);
    var client = Client();
    Response response = await client.get('https://school.gyo6.net/mu-hak/food/$formattedDate/lunch');

    // Use html parser
    var document = parse(response.body.replaceAll('<br />', '|'));
    List<Element> links = document.querySelectorAll('tr > td');
    
    String clean(String text) {
      String cleanedText = text.replaceAll('div', '')
      .replaceAll('</div>', '')
      .replaceAll('\r', '')
      .replaceAll('\n', '')
      .replaceAll('\t', '')
      .replaceAll('&amp', '&')
      .replaceAll('Kcal', '');
      return cleanedText.replaceAll('|', '\n');
    }
    
    String stringChanged = links[2].text.toString();
    var data = clean(stringChanged);

    if (data == "") {
      meal = '급식이 없습니다.';
    } else {
      meal = clean(stringChanged);
    }

    stringChanged = links[1].text.toString();
    data = clean(stringChanged);

    if (data == "") {
      kcal = '???';
    } else {
      kcal = clean(stringChanged);
    }
  }
}