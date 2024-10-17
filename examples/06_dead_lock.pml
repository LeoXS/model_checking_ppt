// Both proc1 and proc2 needs both lock[0] and lock[1] to work.

byte lock[2];  // Shared lock (0 = unlocked, 1 = locked)

proctype proc1() {
    do
    :: lock[0] == 0 ->
        lock[0] = 1;
        printf("proc1: locking 1\n");
    :: lock[1] == 0 ->
        lock[1] = 1;
        printf("proc1: locking 2\n");
    :: (lock[0] == 1) && (lock[1] == 1) -> break;
    od

    // Release locks
    lock[0] = 0;
    printf("proc1: releasing 1\n");
    lock[1] = 0;
    printf("proc1: releasing 2\n");
}

proctype proc2() {
    do
    :: lock[0] == 0 ->
        lock[0] = 2;
        printf("proc2: locking 1\n");
    :: lock[1] == 0 ->
        lock[1] = 2;
        printf("proc2: locking 2\n");
    :: ((lock[0] == 2) && (lock[1])) == 2 -> break;
    od

    // Release locks
    lock[0] = 0;
    printf("proc2: releasing 1\n");
    lock[1] = 0;
    printf("proc2: releasing 2\n");
}

init {
    atomic {
        run proc1();
        run proc2();
    }
}
// TODO
