sealed class DataState<T> {
  final T? data;
  final Exception? error;

  DataState({this.data, this.error});
}

class DataSucces<T> extends DataState<T> {
  DataSucces({required T data}) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed({required Exception error}) : super(error: error);
}
