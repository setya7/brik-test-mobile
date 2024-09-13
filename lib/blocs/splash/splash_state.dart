part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();
}

final class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}
final class SplashLoading extends SplashState {
  @override
  List<Object> get props => [];
}
final class SplashFailed extends SplashState {
  @override
  List<Object> get props => [];
}
final class SplashSuccess extends SplashState {
  @override
  List<Object> get props => [];
}
