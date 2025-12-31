class MonthlySummaryModel {
  final double totalSpent;
  final double budget;
  final int daysLeft;

  const MonthlySummaryModel({
    required this.totalSpent,
    required this.budget,
    required this.daysLeft,
  });

  double get remaining => budget - totalSpent;
  double get progress => totalSpent / budget;
}
