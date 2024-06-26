String capitalizeFirstLetter(String textToCapitalize) {
  if (textToCapitalize.isEmpty) {
    return textToCapitalize;
  }
  return textToCapitalize[0].toUpperCase() + textToCapitalize.substring(1);
}
