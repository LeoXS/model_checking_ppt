byte n;

active proctype do_work()
{

  do
    :: true -> n++;
    :: true -> n--;
    :: true -> break;
  od;

  printf("n = %d", n);
}
