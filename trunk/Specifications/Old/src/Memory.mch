MACHINE
 Memory

SEES
FreeRTOSConfig,Types


CONSTANTS
STACK
,STACK_NULL
,HEAP_SIZE


,portMalloc
,portFree

PROPERTIES
  STACK = POINTER*NATURAL

& STACK_NULL : STACK
& HEAP_SIZE = 0..configTOTAL_HEAP_SIZE


& portMalloc : HEAP_SIZE * HEAP_SIZE --> HEAP_SIZE*STACK 
& portMalloc = %(heap,sz).(heap:HEAP_SIZE & sz:HEAP_SIZE & (heap-sz)+1> 0 | (heap-sz),(pointer,sz) )
& portMalloc = %(heap,sz).(heap:HEAP_SIZE & sz:HEAP_SIZE & (heap-sz)< 0 | 0,STACK_NULL)

& portFree : HEAP_SIZE* POINTER* HEAP_SIZE --> HEAP_SIZE 
& portFree = %(heap,pt,sz).(heap:HEAP_SIZE & pt:POINTER & sz:HEAP_SIZE & (heap+sz)<=configTOTAL_HEAP_SIZE|(heap+sz))
& portFree = %(heap,pt,sz).(heap:HEAP_SIZE & pt:POINTER & sz:HEAP_SIZE & (heap+sz)>configTOTAL_HEAP_SIZE|heap)



VARIABLES
heap




INVARIANT

heap:HEAP_SIZE


INITIALISATION
heap:=configTOTAL_HEAP_SIZE


OPERATIONS

setHeap(mem)=
PRE
 mem:NATURAL & mem <= configTOTAL_HEAP_SIZE
THEN
 heap:=mem	
END


/*
portMalloc(len)=
 PRE
   len : NATURAL & mem-len>=0
 THEN
   mem:=mem-len
 END
;

portFree(len)=
   PRE len :NATURAL & len+mem<=configTOTAL_HEAP_SIZE
   THEN mem:=mem-len
   END
*/

END