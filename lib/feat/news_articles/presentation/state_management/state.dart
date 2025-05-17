sealed class State<T, E> {
  final T? data;
  final E? error;

  State({this.data, this.error});
}

class SuccessState<T, E> extends State<T, E> {
  SuccessState(T? data) : super(data: data);
}

class ErrorState<T, E> extends State<T, E> {
  ErrorState(E? error) : super(error: error);
}

class LoadingState<T, E> extends State<T, E> {}
