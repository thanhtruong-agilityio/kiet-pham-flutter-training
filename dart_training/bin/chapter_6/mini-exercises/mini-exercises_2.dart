// ignore: slash_for_doc_comments
/**
 * Given the following class:
 ```
 class Password { String value = '';
}
```
  1. Make value a final variable, but not private.
  2.Add a const constructor as the only way to initialize a Password object.
 */

class Password {
  final String value;

  const Password({required String value})
      : assert(value.length >= 8),
        value = value;
}
