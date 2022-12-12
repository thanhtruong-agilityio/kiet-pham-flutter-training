import 'package:chapter_06/models/plan.dart';
import 'package:chapter_06/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final plan;
  const PlanScreen({super.key, this.plan});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  // final plan = Plan();
  ScrollController? scrollController;
  Plan get plan => widget.plan;

  @override
  void dispose() {
    super.dispose();
    scrollController!.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  Widget build(BuildContext context) {
    // final plan = PlanProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(plan.name),
      ),
      body: Column(children: <Widget>[
        Expanded(child: _buildList()),
        SafeArea(child: Text(plan.completenessMessage))
      ]),
      floatingActionButton: _buildAskTaskButton(),
    );
  }

  _buildAskTaskButton() {
    // final plan = PlanProvider.of(context);
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        setState(() {
          plan.tasks.add(Task());
        });
      },
    );
  }

  _buildList() {
    // final plan = PlanProvider.of(context);
    return ListView.builder(
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index]),
      itemCount: plan.tasks.length,
      controller: scrollController,
    );
  }

  _buildTaskTile(Task task) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            task.complete = selected!;
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onFieldSubmitted: (text) {
          setState(() {
            task.description = text;
          });
        },
      ),
    );
  }
}
