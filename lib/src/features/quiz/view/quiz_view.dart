import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../widgets/common/non_video_viewport.dart';
import '../../../widgets/state/error.dart';
import '../../../widgets/state/loading/loading.dart';
import '../model/question/question.dart';
import 'quiz_controller.dart';

class QuizView extends ConsumerStatefulWidget {
  const QuizView({
    super.key,
    required this.title,
    required this.quizId,
    required this.onQuizComplete,
  });

  final String title;
  final QuizId quizId;
  final VoidCallback onQuizComplete;

  @override
  ConsumerState<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends ConsumerState<QuizView> {
  late final _pageController = PageController(keepPage: false);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(
        quizControllerProvider(widget.quizId).select((value) => value.status));
    return status.when(
      data: (data) {
        final quiz = ref.watch(quizControllerProvider(widget.quizId)
            .select((value) => value.quiz));
        return NonVideoViewport(
          isQuiz: true,
          title: widget.title,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Consumer(builder: (context, ref, child) {
                  final currentIndex = ref.watch(
                      quizControllerProvider(widget.quizId)
                          .select((value) => value.currentQuestionIndex));
                  return LinearProgressIndicator(
                    value: currentIndex + 1 / quiz!.questions.length,
                  );
                }),
                Gaps.h12,
                Expanded(
                  child: PageView.builder(
                    onPageChanged: ref
                        .read(quizControllerProvider(widget.quizId).notifier)
                        .setCurrentQuestionIndex,
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quiz!.questions.length,
                    itemBuilder: (context, index) => QuestionView(
                      quizId: widget.quizId,
                      onNextPage: () => _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                      ),
                      onQuizComplete: widget.onQuizComplete,
                      index: index + 1,
                      question: quiz.questions[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => ErrorState(
        message: error.runtimeType.toString(),
      ),
      loading: LoadingState.new,
    );
  }
}

class QuestionView extends StatelessWidget {
  const QuestionView({
    super.key,
    required this.quizId,
    required this.question,
    required this.index,
    this.onNextPage,
    required this.onQuizComplete,
  });

  final QuizId quizId;
  final LQuestion question;
  final int index;
  final VoidCallback? onNextPage;
  final VoidCallback onQuizComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiParameters.screenPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question: $index',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Gaps.h12,
          Text(question.content),
          Gaps.h12,
          ...question.choices.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.p4),
              child: Consumer(builder: (context, ref, child) {
                final selected = ref.watch(quizControllerProvider(quizId)
                    .select((value) => value.selected));
                final checkIsCorrect = ref.watch(quizControllerProvider(quizId)
                    .select((value) => value.checkIsCorrect(e)));
                final enable = ref.watch(quizControllerProvider(quizId)
                    .select((value) => value.enable(e)));
                return QuestionListTile(
                  isCorrect: checkIsCorrect,
                  enabled: enable,
                  value: e,
                  selected: selected,
                  onSelected: ref
                      .read(quizControllerProvider(quizId).notifier)
                      .onAnswerChanged,
                );
              }),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: _buildBottomButton(),
          ),
          Gaps.h16,
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Consumer(builder: (context, ref, child) {
      final selected = ref.watch(
          quizControllerProvider(quizId).select((value) => value.selected));
      final hasCorrectAnswer = ref.watch(quizControllerProvider(quizId)
          .select((value) => value.hasCorrectAnswer));
      return FilledButton(
        onPressed: selected == null
            ? null
            : () => ref
                .read(quizControllerProvider(quizId).notifier)
                .onBottomButtonPressed(
                  onNextButtonPressed: onNextPage,
                  onQuizCompleted: onQuizComplete,
                ),
        child: Text(hasCorrectAnswer ? 'Next' : 'Check answer'),
      );
    });
  }
}

class QuestionListTile extends StatelessWidget {
  const QuestionListTile({
    super.key,
    required this.value,
    required this.onSelected,
    this.selected,
    this.isCorrect,
    this.enabled = true,
  });

  final String value;
  final ValueChanged<String> onSelected;
  final String? selected;
  final bool? isCorrect;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    late final Color backgroundColor;
    if (isCorrect == null) {
      backgroundColor = Theme.of(context).colorScheme.secondaryContainer;
    } else if (isCorrect!) {
      backgroundColor = Colors.green[200]!;
    } else {
      backgroundColor = Theme.of(context).colorScheme.errorContainer;
    }
    return ClipRRect(
      borderRadius: UiParameters.borderRadius,
      child: Material(
        color: backgroundColor,
        child: ListTile(
            enabled: enabled,
            onTap: () => onSelected(value),
            leading: _buildLeading(),
            title: Text(value),
            trailing: _buildTrailing(context, isCorrect)),
      ),
    );
  }

  Widget _buildLeading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          value: value,
          groupValue: selected,
          onChanged: enabled ? (_) => onSelected(value) : null,
        )
      ],
    );
  }

  Widget? _buildTrailing(BuildContext context, bool? isCorrect) {
    if (isCorrect == null) {
      return null;
    }
    final icon = isCorrect
        ? const Icon(
            Icons.check_circle,
            color: Colors.green,
          )
        : Icon(
            Icons.cancel,
            color: Theme.of(context).colorScheme.error,
          );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
      ],
    );
  }
}
