MACHINE
 Memory

SEES
FreeRTOSConfig,Types


CONSTANTS
STACK
,STACK_NULL


,portMalloc
,portFree

PROPERTIES
  STACK = POINTER*NATURAL

& STACK_NULL : STACK


& portMalloc : NATURAL*NATURAL --> NATURAL*STACK 
& portMalloc = %(heap,sz).(heap:NATURAL & sz:NATURAL & (heap-sz)>=0|(heap-sz),(pointer,sz))
& portMalloc = %(heap,sz).(heap:NATURAL & sz:NATURAL & (heap-sz)<0 |0,STACK_NULL)

& portFree : NATURAL*POINTER*NATURAL --> NATURAL 
& portFree = %(heap,pt,sz).(heap:NATURAL & (pt,sz):(POINTER * NATURAL) & (heap+sz)<=configTOTAL_HEAP_SIZE|(heap+sz))
& portFree = %(heap,pt,sz).(heap:NATURAL & (pt,sz):(POINTER * NATURAL) & (heap+sz)>configTOTAL_HEAP_SIZE|heap)



VARIABLES
heap


INVARIANT

heap:NATURAL & heap <= configTOTAL_HEAP_SIZE



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