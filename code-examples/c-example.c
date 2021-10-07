/* Examples of C, for CSE3666 */

/* Comments start with / followed immmediately by *, 
 * and end with * followed immediately by /
 * Comments can consist of mutltiple lines.
 * This is the fourth line in the comment.
 * The following line end the comment.
 */

// This is a single line comment. 
// Everything after double /'s is ignored by the compiler.

/* define variables of different types. 
 * varibale names are case sensitive. a is different from A.
 * The size of each type of data type depends on compiler/platform.
 * In CSE3666, we assume the following sizes:
 *  32 bits, words:
 *      int, unsigned, unsigned
 *      long, unsigned long 
 *  16 bits, halfwords:
 *      short, unsigned short 
 *  8 bits, bytes:
 *      char, unsigned char
 * */
long long var_dw;       // a 64-bit signed integer
long	var_longi;	// a 32-bit signed integer
int     var_i;          // a 32-bit signed integer
short   var_i16;        // a 16-bit signed ineger
char    var_i8;         // an 8-bit signed integer (byte)
                        // can represent an ASCII character

unsigned int    var_ui;     // unsigned 32-bit integer 
unsigned short  var_ui16;   // unsigned 16-bit integr 
unsigned char   var_ui8;    // unsigned  8-bit integer 

unsigned int    var_aui[128];   // an array of 128 unsigned words
unsigned char   var_aui8[128];  // an array of 128 bytes 

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

/* a function an array A and an integer as the paramenters and returns an integer 
 * 
 * It does not matter how many words are in array A. Only the starting address
 * of A is passed to the function.
 *
 * */
int loops(int A[], int n)
{
    // arr is an array on stack because it is defined in a function 
    // The array has 128 32-bit integers.
    // i, max, sum are also on stack. 
    // How many bytes does each of them need? 
    int     arr[128];
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
	// index starts from 0, like in Python
        arr[i] = i;
    }

    // Similarly, we can access A 
    // In assembly, A's address is in a register and arr's address is
    // also in a register. In this example, A's address is already
    // in a register (passed to the function in a register).
    // Since arr is allocated on the stack, its address can be
    // calculated from sp. 
    for (i = 0; i < 10; i += 1) {
	A[i] = arr[i];
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

/* define a function that takes three paramenters and returns an integer.
   
   Examples of passing arrays to a function.

   a, b, and c are the same, essentially.

   The function gets:
  	the adddress of array a, which is the address of a[0]
	the address of an integer, 
	the address of array c, which is the address of c[0]
*/
int     pointers(int a[], int *b, int c[10])
{
    /* define an array of integer and an integer */
    /* If arr is located at 0x1000, the adresses of the elements in arr are:
     * 
     * 0x1024: arr[9]
     * 0x1020: arr[8]
     * 0x101c: arr[7]
     * 0x1018: arr[6]
     * 0x1014: arr[5]
     * 0x1010: arr[4]
     * 0x100c: arr[3]
     * 0x1008: arr[2]
     * 0x1004: arr[1]
     * 0x1000: arr[0]
     * */
    int arr[10];
    int i;

    /* The following are examples for understanding pointers */

    // p is a pointer to an int, 
    // or p is the address of an int
    // Since we assume 32-bit processors, an address takes 32 bits (or 4 bytes)
    // In assembly, p is just a word. We can use it as the base register
    // in load/store instructions. 
    // p can be a register, or has storage on the stack.
    // if it is on the stack, we need to load it into a register before using it.
    int * p;

    // save i's address in p 
    p = &i;

    // save arr[0]'s address in p
    // arr[0] is the first element in the array while &arr[0] is the address of the element
    p = &arr[0];

    // *p, p[0], arr[0] refer to the same word

    // Let p point to the next element in the array
    // After the following statement, p is the address of arr[1].
    // In C, the index is scaled
    // In RISC-V assembly, we need to scale it ourselves
    //      addi    t0, t0, 4
    p = p + 1;      // or p += 1;  or p ++

    // Let p point to arr[3], i.e., let p have the address of arry[3]
    // Since p is the address of arr[1] currently, we add 8 to p
    //      addi    t0, t0, 8
    p += 2;

    return 0;
}

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

