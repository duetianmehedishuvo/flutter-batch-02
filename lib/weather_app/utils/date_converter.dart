import 'package:intl/intl.dart';

String getFormattedDate(int timestamp,String format){
  return DateFormat(format).format(DateTime.fromMillisecondsSinceEpoch(timestamp*1000));
}