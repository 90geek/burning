#include<sys/time.h>
#include<time.h>

#if 1 //linux
struct timeval start;
void start_time(void)
{
  gettimeofday(&start,NULL);
}

double end_time(void)
{
  struct timeval end;
  double time_used;//ms

  gettimeofday(&end,NULL);
  time_used = 1000 * (end.tv_sec-start.tv_sec)+ (end.tv_usec-start.tv_usec)/1000;

  return time_used;
}

#else
clock_t start_clock;
void start_time(void)
{
  start_clock = clock();
}

double end_time(void)
{
  clock_t time_used;

  time_used = (clock() - start_clock);

  return (double)time_used;
}
#endif
