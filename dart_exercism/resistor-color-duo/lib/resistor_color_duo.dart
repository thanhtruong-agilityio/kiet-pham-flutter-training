class ResistorColorDuo {
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

  int value(List<String> selectorCode) {
    return int.parse(colors.indexOf(selectorCode[0]).toString() +
        colors.indexOf(selectorCode[1]).toString());
  }
}

void main(List<String> args) {
  print(ResistorColorDuo().value(['red', 'brown']));
}
