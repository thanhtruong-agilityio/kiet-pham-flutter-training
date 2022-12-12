import 'package:chapter_06/models/plan.dart';
import 'package:chapter_06/plan_provider.dart';
import 'package:chapter_06/views/plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key});

  @override
  State<PlanCreatorScreen> createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  final textController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Master plan'),
      ),
      body: Column(
        children: <Widget>[
          _buildListCreator(),
          Expanded(child: _buildMasterPlan())
        ],
      ),
    );
  }

  _buildListCreator() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 10,
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
            labelText: 'Add a plan',
            contentPadding: EdgeInsets.all(20),
          ),
          onEditingComplete: addPlan,
        ),
      ),
    );
  }

  void addPlan() {
    final text = textController.text;
    if (text.isEmpty) {
      return;
    }
    final plan = Plan()..name = text;
    PlanProvider.of(context).add(plan);
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }

  _buildMasterPlan() {
    final plans = PlanProvider.of(context);

    if (plans.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.note,
            size: 100,
            color: Colors.grey,
          ),
          Text(
            'You do not have any plan yet',
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      );
    }
    return ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return ListTile(
            title: Text(plan.name),
            subtitle: Text(plan.completenessMessage),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => PlanScreen(plan: plan)));
            },
          );
        });
  }
}
