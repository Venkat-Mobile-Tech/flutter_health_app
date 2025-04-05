import 'dart:math';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../domain/entities/chat_message_entity.dart';
import 'chat_remote_data_source.dart';

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final _systemResponses = [
    'From your weekly food pattern,\nConsider reducing sugar rich\nfoods like Kesari bath',
    'I noticed you walked 2000 steps today',
    'Remember to stay hydrated!',
    'Great progress on your health goals!',
    'Consider taking a short break now',
    'Your sleep pattern shows improvement,\nkeep maintaining this schedule',
    'Try incorporating more leafy greens\nin your diet this week',
    'Your meditation streak is impressive!\nKeep up the good work',
    'Consider reducing screen time\nbefore bedtime for better sleep',
    'Your water intake has been consistent,\nthat\'s excellent!',
    'Try taking the stairs instead of\nthe elevator today',
    'Your heart rate during exercise\nshows good cardiovascular health',
    'Consider adding more protein\nto your breakfast',
    'Your stress levels have decreased\nsignificantly this week',
    'Great job on maintaining\nyour daily step goal!',
    'Your blood pressure readings\nare within healthy range',
    'Try incorporating more\nwhole grains in your meals',
    'Your sleep quality has improved\nby 15% this week',
    'Consider adding more\nfruits to your diet',
    'Your meditation practice\nis showing positive results',
    'Try reducing processed foods\nin your diet',
    'Your exercise intensity\nis perfect for your goals',
    'Consider adding more\nvegetables to your lunch',
    'Your hydration levels\nare optimal today',
    'Great job on maintaining\na consistent sleep schedule',
    'Your stress management\ntechniques are effective',
    'Try incorporating more\nhealthy fats in your diet',
    'Your heart rate variability\nshows good recovery',
    'Consider adding more\nprotein to your snacks',
    'Your sleep duration\nis within recommended range',
    'Great job on reducing\nsugar intake this week',
    'Your exercise consistency\nis impressive',
    'Consider adding more\nfiber to your diet',
    'Your meditation duration\nhas increased this week',
    'Try incorporating more\nplant-based meals',
    'Your step count shows\nconsistent activity',
    'Consider adding more\nantioxidant-rich foods',
    'Your sleep efficiency\nhas improved',
    'Great job on maintaining\nbalanced meals',
    'Your stress reduction\ntechniques are working',
    'Try incorporating more\nprobiotic foods',
    'Your exercise variety\nis excellent',
    'Consider adding more\niron-rich foods',
    'Your hydration pattern\nis consistent',
    'Great job on reducing\nprocessed food intake',
    'Your sleep quality\nis improving steadily',
    'Try incorporating more\nomega-3 rich foods',
    'Your meditation consistency\nis commendable',
    'Consider adding more\ncalcium-rich foods',
    'Your exercise intensity\nis well-balanced',
    'Great job on maintaining\nportion control',
    'Your stress levels\nare well-managed',
    'Try incorporating more\nvitamin C rich foods',
    'Your sleep schedule\nis very consistent',
    'Consider adding more\nmagnesium-rich foods',
    'Your hydration habits\nare excellent',
    'Great job on reducing\nsaturated fat intake',
    'Your exercise duration\nis optimal',
    'Try incorporating more\nzinc-rich foods',
    'Your meditation quality\nis improving',
    'Consider adding more\nvitamin D rich foods',
    'Your sleep patterns\nare very healthy',
    'Great job on maintaining\na balanced diet',
    'Your stress management\nis effective',
    'Try incorporating more\npotassium-rich foods',
    'Your exercise frequency\nis perfect',
    'Consider adding more\nselenium-rich foods',
    'Your hydration routine\nis well-established',
    'Great job on reducing\nprocessed sugar intake',
  ];

  @override
  Future<Either<Failure, ChatMessage>> getRandomSystemResponse() async {
    try {
      final random = Random();
      await Future.delayed(const Duration(seconds: 1));
      final response =
          _systemResponses[random.nextInt(_systemResponses.length)];
      return Right(ChatMessage(text: response, isUser: false));
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to get system response: $e'));
    }
  }
}
