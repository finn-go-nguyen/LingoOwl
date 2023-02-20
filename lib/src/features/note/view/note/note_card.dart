import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Chip(
            label: Text('00:36'),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.description_outlined,
              ),
              Column(
                children: const [
                  Text('Lecture name'),
                  Text(
                    'Course name',
                  )
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              )
            ],
          ),
          const Text('Note content'),
        ],
      ),
    );
  }
}
