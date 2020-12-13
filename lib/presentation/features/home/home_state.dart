import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class HomeInitialState extends HomeState {
  @override
  String toString() => 'HomeInitialState';
}

@immutable
class HomeLoadedState extends HomeState {
  HomeLoadedState();

  @override
  String toString() => 'HomeLoadedState';

  @override
  List<Object> get props => [];
}
