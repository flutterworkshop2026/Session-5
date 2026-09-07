abstract class Api {
  Future<dynamic> get(String url);

  Future<dynamic> post(
    String url, {
    dynamic body,
  });

  Future<dynamic> put(
    String url, {
    dynamic body,
  });
  Future<dynamic> patch(
    String url, {
    dynamic body,
  });

  Future<dynamic> delete(String url);
}
