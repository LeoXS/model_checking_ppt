// The two processes will cause the value of the global variable x to alternate between 2 and 1, ad infinitum. No progress labels were used, so every cycle is guaranteed to be a non-progress cycle.
// Define two progress label, then will not trigger error. Or define only one, and enable fairness. (because fairness ensures the label will be triggered.

byte x = 2;

active proctype A()
{
    do
        :: x = 3 - x ->
           if
              :: x == 1 -> break;
              :: else -> skip;
           fi
    od
}

active proctype B()
{
    do
        :: x = 3 - x ->
           if
              :: x == 2 -> break;
              :: else -> skip;
           fi
    od
}
