abstract class BaseApiServices{
  Future<dynamic> callGetApiResponse(String url) ;

  Future<dynamic> callPostApiResponse(
      String url,
      dynamic data,
      );
}