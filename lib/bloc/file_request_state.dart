part of 'file_request_bloc.dart';

@immutable
abstract class FileRequestState {}
class FileRequestInitialState extends FileRequestState {}
class FileRequestErrorState extends FileRequestState {
  final String error;
  FileRequestErrorState({required this.error});
}
class FileRequestSuccessState extends FileRequestState {
  final AddFileResponse response;
  FileRequestSuccessState({required this.response});
}
