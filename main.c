
#include <ctype.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include "ch341_api.h"

int main(int argc, char *argv[])
{
  int ret=0;
  ret = ch341_start(argc, argv);
   return ret;
}
