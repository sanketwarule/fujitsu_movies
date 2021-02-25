import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieEvent extends Equatable {}

class FetchMoviesEvent extends MovieEvent {

  @override
  List<Object> get props => [];

}