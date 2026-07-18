sealed class BaseState<T> {}

class InitialState<T> implements BaseState<T> {}

class LoadingState<T> implements BaseState<T> {}

class SuccessState<T> implements BaseState<T> {
  final T data;
  SuccessState({required this.data});
}

class ErrorState<T> implements BaseState<T> {
  final String error;
  ErrorState({required this.error});
}
