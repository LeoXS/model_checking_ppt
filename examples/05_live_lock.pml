// Both proc1 and proc2 needs both lock[0] and lock[1] to work.

bit lock[2] = 0;  // Shared lock (0 = unlocked, 1 = locked)

proctype proc1() {
    do
    :: lock[0] == 0 ->
        printf("proc1: locking\n");
        lock[0] = 1;
        // Simulate detecting the other process is trying to lock
        if
        :: lock[1] == 1 ->  // if the lock is held (by proc2), release lock[0]
            printf("proc1: unlocking\n");
            lock[0] = 0;
        fi
    od
}

proctype proc2() {
    do
    :: lock[1] == 0 ->
        printf("proc2: locking\n");
        lock[1] = 1;
        // Simulate detecting the other process is trying to lock
        if
        :: lock[0] == 1 ->  // if the lock is held (by proc1), release it
            printf("proc2: unlocking\n");
            lock[0] = 0;
        fi
    od
}

init {
    atomic {
        run proc1();
        run proc2();
    }
}
