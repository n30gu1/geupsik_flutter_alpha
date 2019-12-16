import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:intl/intl.dart';

Future initiate(DateTime date) async {
  var formatter = DateFormat('yyyy/MM/dd');
  String formattedDate = formatter.format(date);
  var client = Client();
  Response response = await client.get('http://school.gyo6.net/mu-hak/food/$formattedDate/lunch');

  // Use html parser
  var document = parse(response.body.replaceAll('<br />', '|'));
  List<Element> links = document.querySelectorAll('tr > td');
  String stringChanged = links[2].text.toString();
  
  List<String> clean(String text) {
    String cleanedText = text.replaceAll('div', '')
    .replaceAll('</div>', '')
    .replaceAll('\r', '')
    .replaceAll('\n', '')
    .replaceAll('\t', '')
    .replaceAll('&amp', '&');
    return cleanedText.split('|');
  }
  
  return clean(stringChanged);
}