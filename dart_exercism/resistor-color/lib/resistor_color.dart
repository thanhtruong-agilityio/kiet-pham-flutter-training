class ResistorColor {
  // Put your code here
  var colors = [
    'black',
    'brown',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'violet',
    'grey',
    'white'
  ];

  int colorCode(String selectorCode) {
    return colors.indexOf(selectorCode);
  }
}
