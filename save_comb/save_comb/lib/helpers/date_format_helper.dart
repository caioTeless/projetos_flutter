import 'package:intl/intl.dart';

class DateHelper{

  formatDate(DateTime date){
    return DateFormat('dd/MM/yyyy').format(date);
  }

}