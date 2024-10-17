chan queue = [3] of {bit};

active proctype producer()
{
    queue!0; // send 0 to channel
    printf("Produce 0\n");

    queue!1; // send 1 to channel
    printf("Produce 1\n");
}

active proctype consumer()
{
    bit data;

//process:
    do
    :: queue?data ->
       printf("Consume %d\n", data);
    od
}
