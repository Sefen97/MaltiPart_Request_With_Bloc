import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_muliti_part/api/add_file_response.dart';
import 'package:test_muliti_part/api/repostory.dart';

part 'file_request_event.dart';
part 'file_request_state.dart';

class FileRequestBloc extends Bloc<FileRequestEvent, FileRequestState> {
  FileRequestBloc() : super(FileRequestInitialState()) {
    on<AddFileEvent>(_onAddFileEvent);
    on<AddFileInitialEvent>(_onAddFileInitialEvent);
  }
  FutureOr<void> _onAddFileEvent(AddFileEvent event, Emitter<FileRequestState> emit) async{
    FileRequestState fileRequestState =await Repostory.addTask();
    if (fileRequestState is FileRequestSuccessState){
      emit(FileRequestSuccessState(response: fileRequestState.response));
    }
  }

  FutureOr<void> _onAddFileInitialEvent(AddFileInitialEvent event, Emitter<FileRequestState> emit) {
      emit(FileRequestInitialState());
  }
}
