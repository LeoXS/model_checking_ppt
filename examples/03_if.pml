byte n;

active proctype do_work()
{
  if
    :: true -> n = 1;
    :: true -> n = 2;
    :: true -> n = 3;
  fi

  printf("n = %d", n);
}
