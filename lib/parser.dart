import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:intl/intl.dart';

Future getMeals(DateTime date, String mode) async {
  var formatter = DateFormat('yyyy/MM/dd');
  String formattedDate = formatter.format(date);
  var client = Client();
  Response response = await client.get('http://school.gyo6.net/mu-hak/food/$formattedDate/lunch');

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
  
  if(mode == 'meals') {
    String stringChanged = links[2].text.toString();
    var data = clean(stringChanged);

    if (data == "") {
      return '급식이 없습니다.';
    } else {
      return clean(stringChanged);
    }
  }

  if(mode == 'kcal') {
    String stringChanged = links[1].text.toString();
    var data = clean(stringChanged);

    if (data == "") {
      return '???';
    } else {
      return clean(stringChanged);
    }
  }
}