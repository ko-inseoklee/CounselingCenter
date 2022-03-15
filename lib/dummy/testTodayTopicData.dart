import 'package:online_counseling_center/model/board/todayTopic.dart';

// buildPage("0", "2022.01.30", "그저께 질문", "Producer", 76, 70),
// buildPage("1", "2022.01.31", "어제 질문", "Producer", 40, 25),
// buildPage(
// "2", "2022.02.01", "학창시절로 다시 돌아간다면, 무엇을 가장 하고 싶어요?", "Producer", 15, 10),

TodayTopic topic1 = TodayTopic(
    title: "오늘의 주제1",
    date: "2022.02.04",
    question: "그저께 질문",
    writerID: "Producer",
    likes: 50,
    comments: List.empty());

TodayTopic topic2 = TodayTopic(
    title: "오늘의 주제1",
    date: "2022.02.05",
    question: "어제 질문",
    writerID: "Producer",
    likes: 40,
    comments: List.empty());

TodayTopic topic3 = TodayTopic(
    title: "오늘의 주제1",
    date: "2022.02.06",
    question: "학창시절로 다시 돌아간다면, 무엇을 가장 하고 싶어요?",
    writerID: "Producer",
    likes: 10,
    comments: List.empty());

List<TodayTopic> topicData = [topic1, topic2, topic3];
