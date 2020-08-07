import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2res = await task2();
  task3(task2res);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 2);
  String result;
  await Future.delayed(threeSeconds, () {
    print('Task 2 complete');
    result = 'task2KompleteBish';
  });
  return result;
}

void task3(String taskTwoData) {
  String result = 'task 3 data';
  print('Task 3 complete with $taskTwoData');
}
