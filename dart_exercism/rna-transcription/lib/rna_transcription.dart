class RnaTranscription {
  // Put your code here
  Map<String, String> rna = {
    'G': 'C',
    'C': 'G',
    'T': 'A',
    'A': 'U',
  };
  String toRna(String dna) {
    return dna.split('').map((e) => rna[e]).toList().join();
  }
}
