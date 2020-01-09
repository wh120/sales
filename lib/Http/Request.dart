import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio/dio.dart' ;
import 'package:flutter/material.dart';
import 'APIurls.dart';


Future<Response> getHttps(String url , var data , {String method ='POST'}) async {
  BaseOptions options = new BaseOptions(
    baseUrl: "http://bahaa.skoobudy.com/api",
    connectTimeout: 5000,
    receiveTimeout: 3000,

  );
  Dio dio = new Dio(options);
  dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: "$Server/api")).interceptor);

  Map<String, String> headers = {
  "Content-Type": "application/x-www-form-urlencoded",
  "Content-type": "application/json"};

  try {
    Response response=await dio.request(

      url,
      data: data,
      options: buildCacheOptions(Duration(days:  7)  , forceRefresh: true,options: Options( headers: headers,method:method)) ,
    );
    print(response.statusCode);

    print(response.data['data'].length);
    return response;
  } catch (e) {
  throw e;
   // print('error is'+e.toString());
  }

}
Future<int> login(String email , String password )async
{
  var json ={"email": email, "password": password};

  //print(json);
  try {

    Response r = await getHttps(apis['login'], json);
    print('response = '+r.toString());
    Map<String, dynamic> data = new Map();
    if(r.data!='')
     data =r.data;

    if(data.containsKey('success'))
      if(data.containsKey('data'))
         return data['data']['id'];


        return -1;
  }
  catch (e) {

    print('error is '+e.toString());
    return -1;
  }



}

Future<List<dynamic>>getProducts() async
{
  try {
    Response r = await getHttps(apis['getproducts'], {} ,method: 'GET');
    // print('response = '+r.toString());
    Map<String, dynamic> data =r.data;
    if(data.containsKey('success'))
      if(data.containsKey('data'))
      {
        return data['data'];
      }
    return new List();
  }
  catch (e) {
    print('error is '+e.toString());
    return new List();
  }

}
Future<List<dynamic>>getOffers() async
{
  try {
    Response r = await getHttps(apis['getOffers'], {} ,method: 'GET');
    // print('response = '+r.toString());
    Map<String, dynamic> data =r.data;
    if(data.containsKey('success'))
      if(data.containsKey('data'))
      {
        return data['data'];
      }
    return new List();
  }
  catch (e) {
    print('error is '+e.toString());
    return new List();
  }

}

Future<Map<String, dynamic>>getprofile(int id) async
{
  try {
    Response r = await getHttps(apis['getProfile'], {"id" :id});
    // print('response = '+r.toString());
    Map<String, dynamic> data =r.data;
    if(data.containsKey('success'))
      if(data.containsKey('data'))
      {

        return data['data'];
      }
    return new Map();
  }
  catch (e) {
    print('error is '+e.toString());
    return new Map();
  }

}

