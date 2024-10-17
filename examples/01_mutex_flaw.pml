bit     mutex;
byte  counter;


proctype processor(byte id) {
         mutex != 1;
         mutex = 1;
         counter++;
         printf("processor (%d) has entered section.\n", id);
         counter--;
         mutex = 0;
}

proctype monitor() {
         assert(counter != 2);
}

init {
      atomic {
             run processor(0);
             run processor(1);
             run monitor();
             }
}
