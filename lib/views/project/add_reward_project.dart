import 'package:flutter/material.dart';

class AddRewardProject extends StatefulWidget {
  const AddRewardProject({
    super.key,
    required this.projectId,
  });

  final String projectId;

  @override
  State<AddRewardProject> createState() => _AddRewardProjectState();
}

class _AddRewardProjectState extends State<AddRewardProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('리워드'),
      ),
    );
  }
}
