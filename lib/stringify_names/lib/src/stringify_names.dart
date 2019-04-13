///"Anthony"
///"Anthony and Tyler"
///"Anthony, João, and Tyler"
///"All roommates"
///"All teammates"
///"All tenants"
///"All tenants and Mills Rentals"
///"Anthony, Tyler, and Mills Rentals"
String stringifyNames(List<String> names) {
  String result = "";

  for (var i = 0; i < names.length; i++) {
    final name = names[i];
    if (i == 0) {
      result += name;
    } else if (i == names.length - 1) {
      if (names.length == 2) {
        result += " and ";
      } else {
        result += ", and ";
      }
      result += name;
    } else {
      result += ", " + name;
    }
  }
  return result;
}
