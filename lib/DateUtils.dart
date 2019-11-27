String intToMonth(int monthNum){
  List<String> month=["January","February","March","April","May","June","July","August","September","October","November","December"];
  return month[monthNum-1];
}

String intToWeekday(int dayNum){
  List<String> weekdays=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
  return weekdays[dayNum];
}

String dateToShortString(DateTime date){
  String monthFull;
  String dayFull;
  if(date.month<10){
    monthFull="0${date.month}";
  }else{
    monthFull="${date.month}";
  }

  if(date.day<10){
    dayFull="0${date.day}";
  }else{
    dayFull="${date.day}";
  }

  return "${date.year}-$monthFull-$dayFull";
}