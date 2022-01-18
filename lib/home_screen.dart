import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_muliti_part/api/dio.dart';
import 'package:test_muliti_part/bloc/file_request_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    DioHelpear.initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FileRequestBloc bloc = FileRequestBloc();
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: apBar(),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer<FileRequestBloc, FileRequestState>(
          listener: (context, state) {
            if (state is FileRequestInitialState) {
              BlocProvider.of<FileRequestBloc>(context).add(AddFileEvent());
            }
            if (state is FileRequestSuccessState) {
              pop();
              _showDialogForSuccessOrField(context: context, state: state);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  _sizedBox(InkWell(
                    onTap: () {
                      BlocProvider.of<FileRequestBloc>(context)
                          .add(AddFileInitialEvent());
                      showDialog(
                          context: context,
                          builder: (_) =>
                              const Center(child: CircularProgressIndicator()));
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(child: Text("Add", style: _style()))),
                  )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget apBar() => AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: const Text("MulitiPart"),
      );

  TextStyle _style() => const TextStyle(color: Colors.blue, fontSize: 20);

  _showDialogForSuccessOrField({context, state}) => showDialog(
      context: context,
      builder: (_) => Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 1.1,
              child: Card(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(state.response.message!),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            pop();
                          },
                          child: const Text("Done"))
                    ],
                  ),
                ),
              ),
            ),
          ));

  SizedBox _sizedBox(Widget child) => SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 1,
      child: child);

  pop() => Navigator.pop(context);
}
