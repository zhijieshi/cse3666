## Coding problems

### ASCII strings

#### String functions in C

```
size_t strlen(const char *s);

char *strcpy(char *dest, const char *src);
char *strncpy(char *dest, const char *src, size_t n);
size_t strlcpy(char *dest, const char *src, size_t size);

char *strcat(char *dest, const char *src);
char *strncat(char *dest, const char *src, size_t n);

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

