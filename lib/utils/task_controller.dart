
class TaskController {
  final Function onStart;
  final Function onFinished;
  final Function onError;
  final Function task;

  TaskController({this.task, this.onStart, this.onFinished, this.onError});

  void execute() async{
    onStart();
    try {
      await task();
    } catch (e) {
      onError(e);
    } finally {
      onFinished();
    }
  }
}
