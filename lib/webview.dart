

import 'package:url_launcher/url_launcher.dart';

geturl(
{
  required articalurl,
}
    ) async {
  final Uri url = Uri.parse(articalurl);
  if(!await launchUrl(url))
    {
      throw Exception("could not lunch");
    }
}