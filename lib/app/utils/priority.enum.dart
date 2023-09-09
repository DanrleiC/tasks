enum PriorityEnum {
  high,
  medium,
  low,
  noPriority
}

class Priority {
  int setPriority(PriorityEnum priority) {
    if (priority == PriorityEnum.high) {
      return 0;
    } else if (priority == PriorityEnum.medium) {
      return 1;
    } else if (priority == PriorityEnum.low) {
      return 3;
    } else {
      return 4;
    }
  }
}