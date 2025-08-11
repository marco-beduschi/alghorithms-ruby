## Definition

Arrays are fixed size, continous memory chunks that get allocated to the program.
By being continous we can navigate through each item of the array without accessing
other random data from memory.

The fact that they are fixed size means we can't grow it, we can't `#append` or `#prepend`.
Yet most modern languages provide us with arrays can grow in size, how is that?
Turns out most arrays are not really arrays by definition, they are lists, a more flexible, more abstracted
data structure that lets developers work with array like objects without worrying about
memory allocation or array length.

In Ruby, for instance, we can create fixed size arrays using `IO::Buffer` class. In Javascript we
can use `ArrayBuffer` instead.
