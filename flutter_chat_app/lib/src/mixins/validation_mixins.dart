class ValidationMixins{

  String validateEmail(String value){
    if(!value.contains('@'))
      return 'Email invalido';
    return null;
  }

  String validatePassword(String value){
    if(value.length < 6)
      return 'Password corto';
    return null;
  }

}