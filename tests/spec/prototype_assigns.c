

/*@
assigns *p;
*/
extern int f(char * p); // fonction de mise � jour qui "�crit" dans *p

int main(char *x) {

  return f(x);
}
