class ExpenseSummaryModel {
  final double totalExpense;
  final double today;
  final int categories;
  final double budget;
  final double progress;

  const ExpenseSummaryModel({
    required this.totalExpense,
    required this.today,
    required this.categories,
    required this.budget,
    required this.progress,
  });
}
