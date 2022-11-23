enum ENV { LOCAL, DEV, PROD }

class DevEnvironment {
  static String serverUri = 'localhost';
  static String port = '8080';

  static String getServer () => serverUri + ":" + port;

  /// DEV, PROD 환경 구축될 때 변수 추가
  ///
  static void setEnvironment(ENV e) {
    switch (e) {
      case ENV.DEV:
        serverUri  = '';
        port = '0';
        break;
      case ENV.PROD:
        serverUri = '';
        port = '0';
        break;
      default:
        serverUri = 'localhost';
        port = '0';
    }
  }

  static void setPort(int portNum) => port = portNum.toString();
  static void setServerUri(String uri) => serverUri = uri;
}