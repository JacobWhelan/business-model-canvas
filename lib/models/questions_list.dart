class QuestionsList {
  static List<String> questionList = [
    "Simple Question to start. Describe your business in 3-5 words? ",
    "Customer Segments. Start with their target market, who they’re trying to supply their goods and services to. To whom do you provide your goods and/or services to? ",
    "Value Propositions. What goods and services do you provide? What do you provide to your consumers that is of value to them and is something that they could not live without?",
    "Revenue Streams. How are you being rewarded for your efforts by your consumer base? Provide your projected Revenue Models. Do you make money, or are you a Non-Profit?",
    "Channels and Distribution. How do you distribute your goods and services, how does your product reach your client/consumer base?",
  ];

  static List<String> answerList =
      List.filled(QuestionsList.questionList.length, "No Answer Provided");
}
