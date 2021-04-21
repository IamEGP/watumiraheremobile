class BlocFunctions {
  static String getErrorMessage(dynamic e) {
    print(e);
    try {
      if (e.message != null) {
        return e.message;
      } else {
        return 'A system error has occured. Try again later.';
      }
    } catch (e) {
      return 'A system error has occured. Try again later.';
    }
  }
}
