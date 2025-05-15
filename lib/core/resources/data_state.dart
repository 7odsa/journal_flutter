import 'package:dio/dio.dart';

sealed class DataState<T> {
  final T? data;
  final DioException? error;

  DataState({this.data, this.error});
}

class DataSucces<T> extends DataState<T> {
  DataSucces({required T data}) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed({required DioException error}) : super(error: error);
}
