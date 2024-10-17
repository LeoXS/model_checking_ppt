byte n = 0;

active proctype processor() {
       do
       :: true -> printf("%d", n);

       od;
}

