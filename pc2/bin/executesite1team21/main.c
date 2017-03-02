#include<stdio.h>
#include<string.h>
const int maxn = 1000 + 100;

int main()
{
  char str[maxn], buf[maxn];
  int c = 0;
  bool flag = false;
  while(fgets(str, maxn, stdin) != NULL) {
  //  if(flag) putchar('\n');
   // flag = true;

    int len = strlen(str);
    for(int i = 0; i < len; i++) {
      if(str[i] == 'y' && str[i+1] == 'o' && str[i+2] == 'u') {
        buf[c++] = 'w';
        buf[c++] = 'e';
        i+=2;
      } else buf[c++] = str[i];
    }
    buf[c] = '\0';
    c = 0;
    printf("%s", buf);
  }

  return 0;
}
