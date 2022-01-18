part of 'file_request_bloc.dart';

@immutable
abstract class FileRequestEvent {}

class AddFileEvent extends FileRequestEvent{}
class AddFileInitialEvent extends FileRequestEvent{}
