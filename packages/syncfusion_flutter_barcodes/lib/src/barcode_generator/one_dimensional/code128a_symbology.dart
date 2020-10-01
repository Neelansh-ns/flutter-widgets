part of barcodes;

/// The [Code128A] (or chars set A) barcode includes all the standard upper
/// cases, alphanumeric keyboard characters and punctuation characters together
/// with the control characters, (characters with ASCII values from 0 to
/// 95 inclusive), and seven special characters.
class Code128A extends Code128 {
  /// Create a [Code128A] symbology with the default or required properties.
  ///
  /// The arguments [module] must be non-negative and greater than 0.
  ///
  Code128A({int module}) : super(module: module);

  @override
  bool _getIsValidateInput(String value) {
    for (int i = 0; i < value.length; i++) {
      if (!_code128ACharacterSets.contains(value[i])) {
        throw 'The provided input cannot be encoded : ' + value[i];
      }
    }
    return true;
  }
}
