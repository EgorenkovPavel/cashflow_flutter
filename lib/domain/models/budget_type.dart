enum BudgetType {MONTH, YEAR}

String getBudgetTypeTitle(BudgetType type){
  switch(type){
    case BudgetType.MONTH:
      return 'Month';
    case BudgetType.YEAR:
      return 'Year';
  }
}