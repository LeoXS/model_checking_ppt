bool	flag[3]; // 0th element is not used.

active proctype P1()
{
again:
  flag[1] = true;

  !flag[2]; // wait for flag[2] becomes false

  flag[1] = false;
  goto again
}

active proctype P2()
{
again:
  flag[2] = true;

  !(flag[1]); // wait for flag[1] becomes false

  flag[2] = false;
  goto again
}
