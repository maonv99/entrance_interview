import 'package:get/get.dart';

abstract class ApiHelper {
  Future<Response> signUp({required String email, required String password});
  Future<Response> getListCategory();
}
