class IncomeSummaryModel {
  final double totalIncome;
  final String source;
  final String nextDate;
  final double growthPercent;

  const IncomeSummaryModel({
    required this.totalIncome,
    required this.source,
    required this.nextDate,
    required this.growthPercent,
  });
}
