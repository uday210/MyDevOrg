global class ScheduleTest implements Schedulable {
   global void execute(SchedulableContext SC) {
      System.debug('>>>>>>>>>>>>>>>>>> '+SC);
   }
}