## Coding problems

### Numbers

* Find GCD.

* Find LCM.

* Modular operations.  

* Large numbers. We can start with unsigned big numbers. 

```
// add big numbers res = x + y, each having n DWORDs
// return the carry
int  BIG_add(DWORD *res, DWORD *x, DWORD *y, int n); 

// add big numbers res = x + extended v. x has n DWORDs. v is a single DWORD.
// return the carry
int  BIG_add_single(DWORD *res, DWORD *x, DWORD v, int n); 

// compare x and y, each having n DWORDs
int  BIG_cmp_eq(const DWORD *x, const DWORD *y, int n); 
int  BIG_cmp_lt(const DWORD *x, const DWORD *y, int n); 

```

### ASCII strings

#### String functions in C

```
size_t strlen(const char *s);

char *strcpy(char *dest, const char *src);
char *strncpy(char *dest, const char *src, size_t n);
size_t strlcpy(char *dest, const char *src, size_t size);

char *strcat(char *dest, const char *src);
char *strncat(char *dest, const char *src, size_t n);

int strcmp(const char *s1, const char *s2);
int strncmp(const char *s1, const char *s2, size_t n);

char *strtok(char *str, const char *delim);

char *strstr(const char *haystack, const char *needle);
```
#### Memory functions in C

```
void *memset(void *str, int c, size_t n);
void *memcpy(void *dest, const void *src, size_t n);
void *memmove(void *str1, const void *str2, size_t n)
void *memccpy(void *restrict dest, const void *restrict src, int c, size_t n);
```

#### String functions in other languages 

We can also exercise with string functions in other programming languages. 
Assume ASCII strings.

```
char    *strtoupper(const char *s);  // PHP strtoupper 
char    *strtolower(const char *s);  // PHP strtolower
char    *strpad(char *t, int len,  const char *s, char pad, int left);  // PHP str_pad

int     substr(const char *s, int offset, int len); // PHP substr. Get a substring
 
int     str_starts_with(const char *haystack, const char *needle); // PHP str_starts_with
// case sensitive/insensitive

```

### Array oprations

* Copy, append, slice. Simlar operations are similar to operations on strings.

* Set all array elements to a specific value (like `memset`).

* Find max, min, average, median of elemetns in an array.

* Sort. Bubble sort, merge sort.

* Dot prodcut.

* Matrix operations like addition and transpose.

### Function calls 

* Write functions to call any other functions on an array. For example, 

```
void    array_strtoupper(const char **pstr, int n);  // convert an array of strings to upper cases

```

* Convert loops to recursion. For example, recursive `strlen()` and `strcmp()`.

