class Constants {
  static const String BASE_SCHEMA = "https://";
  static const String BASE_URL_DOMAIN = "way-stage.azurewebsites.net";

  static String getBaseUrl() {
    return BASE_SCHEMA + BASE_URL_DOMAIN;
  }
}
