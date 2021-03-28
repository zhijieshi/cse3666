/* Examples of C, for CSE3666 */

/* Comments start with / followed immmediately by *, 
 * and end with * followed immediately by /
 * Comments can consist of mutltiple lines.
 * This is the fourth line in the comment.
 * The following line end the comment.
 */

// This is a single line comment. 
// Everything after double /'s is ignored by the compiler.

// include this header file to use more standard integer types like int64_t
#include    <cstdint>

// Macro
// Define a constant MAX_LEN. MAX_LEN will be replaced by 128
#define     MAX_LEN     128

/* define variables of different types. 
 * varibale names are case sensitive. a is different from A.
 * The size of each type of data type depends on compiler/platform.
 * In CSE3666, we assume the following sizes:
 *  64 bits, doublewords:
 *      long long, unsigned long long, 
 *      int64_t, uint64_t
 *  32 bits, words:
 *      int, unsigned, unsigned
 *      int32_t, uint32_t
 *      long, unsigned long 
 *  16 bits, halfwords:
 *      short, unsigned short 
 *      int16_t, uint16_t
 *  8 bits, bytes:
 *      char, unsigned char
 *      int8_t, uint8_t
 * */
long long var_dw;       // a 32-bit signed integer
int     var_i;          // a 32-bit signed integer
short   var_i16;        // a 16-bit signed ineger
char    var_i8;         // an 8-bit signed integer (byte)
                        // can represent an ASCII character

uint64_t        var_ui64;   // unsigned 64-bit integer 
unsigned int    var_ui;     // unsigned 32-bit integer 
unsigned short  var_ui16;   // unsigned 16-bit integr 
unsigned char   var_ui8;    // unsigned  8-bit integer 

uint64_t        var_aull[MAX_LEN];  // an array of 128 unsigned doublewords
unsigned int    var_aui[MAX_LEN];   // an array of 128 unsigned words
unsigned char   var_aui8[MAX_LEN];  // an array of 128 bytes 

// define a structure where you can put relevant data together.
// consider it as an object in Python.
struct {
    int     hour;    // Define fields in the structure.
    int     minute; 
    int     second;
}   var_time;
// once we know the address of a structure, 
// we can assess its fiels by offset + base address
// For example, if the address of var_time is in s0
// the address of fields are as follows.
// hour:      (s0)
// minute:   4(s0)
// second:   8(s0)

// function definition
// This function takes two arguments of int, and returns an int
// Note that everything in C has a type
int     my_max(int a, int b)
{
    /* variables defined in a function
     * are called local variables, or auto variables.
     * They are stored on stack. */
    int     c;

    // if statement, similar to Python
    // Python code would be
    //      if a > b:
    //          c = a
    //      else:
    //          c = b
    if (a > b) {
        c = a;
    } else {
        c = b;
    }

    // return from a function
    return c;
}

/* a function that does not need a paramenter and returns an integer */
int loops()
{
    // arr is an array on stack. It has 128 32-bit integers.
    // arr, i, max, sum are on stack. How many bytes do they need? 
    int     arr[MAX_LEN];
    int     i;
    int     max, sum;  // define multiple variables of the same type

    // for loop
    // initialize i to 0, 
    // while i is less than 10 (this is the condition),  
    // the loop body is executed.
    // After all statements in the loop body are exectued, i is incremented by 1.
    // Then, the condition is checked again.
    for (i = 0; i < 10; i += 1) {
        // arr[i] means element i in the array
        arr[i] = i;
    }

    // while loop
    // similar to Python
    i = 0;
    while (i < 10) {
        arr[i] = arr[i] + 1;
        i ++;  // i ++ means i = i + 1. Similar to i += 1
    }

    max = -1;
    sum = 0;
    // go through first 10 elements in arr.
    // This is a typical loop in C. Again, i ++ means i += 1
    for (i = 0; i < 10; i ++) {
        // calling a function. 
        // Recall my_max takes two arguments of int and returns an int
        max = my_max(t, arr[i]);
        sum += arr[i];
    }

    return 0;
}


/* define a function that does not need a paramenter and returns an integer */
int     pointers()
{
    /* define an array of integer and an integer */
    /* If arr is located at 0x1000, the adresses of the elements in arr are:
     * 
     * 0x1048: arr[9]
     * 0x1040: arr[8]
     * 0x1038: arr[7]
     * 0x1030: arr[6]
     * 0x1028: arr[5]
     * 0x1020: arr[4]
     * 0x1018: arr[3]
     * 0x1010: arr[2]
     * 0x1008: arr[1]
     * 0x1000: arr[0]
     * */
    int64_t     arr[10];
    int64_t         i;

    /* The following are examples for understanding pointers */

    // p is a pointer to an int, 
    // or p is the address of an int
    // Since we assume 64-bit processors, an address takes 64 bits (or 8 bytes)
    int64_t * p;

    // save i's address in p 
    // Notice that i is a doubleword and &i is the address of the integer.
    p = &i;

    // save arr[0]'s address in p
    // arr[0] is the first element in the array while &arr[0] is the address of the element
    p = &arr[0];

    // *p, p[0], arr[0] refer to the same doublewords

    // Let p point to the next element in the array 
    // After the following statement, p is the address of arr[1].
    // In C, the index is scaled
    // In RISC-V assembly, we need to scale it ourselves
    //      addi    t0, t0, 8
    p = p + 1;      // or p += 1;  or p ++

    // Let p point to the element after the next arr[3]
    p += 2;

    return 0;
}
