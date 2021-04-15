## Coding problems

### Numbers

* Find the greatest common divisor (GCD) of two numbers.

* Find the least common multiple  (LCM) of two numbers.

* Modular operations: add, sub, mul, and exponentiation. 

#### Large numbers

Even 64 bits are not enough in some applications. Computer can handle big
numbers!  Each number is stored in an array of `n` doublewords.  We can start
with unsigned big numbers. 

```
// add a big number and a doubleword
// res = x + extended v, where v is a doublewords
// return the carry
int  BIG_add_vs(DWORD *res, DWORD *x, DWORD v, int n); 

// add big numbers res = x + y 
// return the carry
int  BIG_add(DWORD *res, DWORD *x, DWORD *y, int n); 

// compare x and y, each having n DWORDs
int  BIG_cmp_eq(const DWORD *x, const DWORD *y, int n); 
int  BIG_cmp_lt(const DWORD *x, const DWORD *y, int n); 

```

### Bits

* Find the Hamming weight of a number.

* Rotate bits in a register.

* Reverse the order of bytes in a register.

### ASCII strings

Implement string functions.

```
// String functions in C

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

// String functions in other languages 

char    *strtoupper(const char *s);  // PHP strtoupper 
char    *strtolower(const char *s);  // PHP strtolower
char    *strpad(char *t, int len,  const char *s, char pad, int left);  // PHP str_pad

char    *strrev(const char *s);   // reverse the characters in a string

int     substr(const char *s, int offset, int len); // PHP substr. Get a substring
 
int     str_starts_with(const char *haystack, const char *needle); // PHP str_starts_with

```

### Memory block operations

Memory functions in C

```
void *memset(void *str, int c, size_t n);
void *memcpy(void *dest, const void *src, size_t n);
void *memmove(void *str1, const void *str2, size_t n)
void *memccpy(void *restrict dest, const void *restrict src, int c, size_t n);
```

### Array oprations

Assume doubleword arrays. We can also practice with other kinds of arrays.

* Set all array elements to a specific value (like `memset`).

* Copy an array.

* Append an array with a number.

* Append an array with another array.

* Slice an array, for example, get `A[5:]` from array `A`. 

### Math operations  

#### Operations on 1-D arrays

* Find max, min, and/or average of elemetns in an array.

* Sort, for example, Bubble sort and merge sort.

* Find the median.

* Binary search.

#### Vector

* Addition.

* Multiplication with a scalar.

* Dot prodcut.

#### Matrix 

* Addition. 

* Transpose.

* Multiplication.

### Function

* Convert loops to recursion. For example, recursive `strlen()` and `strcmp()`.

* Operate on elements in an array. For example, 

```
// convert an array of strings to upper cases
void    array_strtoupper(const char **pstr, int n);  

```

### Floating-point

* Compute math functions, e.g., `sin`, `cos`.

* Solve quadratic equations.

### Classic problems

There are many classic computer science problems. Try to solve simple ones
with assembly code.

* Print multiplication table, say, up to 11 by 11. We do not need multiplcations.

* Print a calendar. 

* Eight queens.

Here are a list of questions for beginners  
[link](https://adriann.github.io/programming_problems.html).

There are more lists on the Internet.

