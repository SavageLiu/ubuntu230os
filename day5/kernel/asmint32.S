.global asm_inthandler21
.global load_gdtr
.global load_idtr
.code32
asm_inthandler21:
  pushw %es
  pushw %ds
  pushal
  movl %esp,%eax
  pushl %eax
  movw %ss,%ax
  movw %ax,%ds
  movw %ax,%es
 // ;call inthandler21

  popl %eax
  popal
  popw %ds
  popW %es
  iret
load_gdtr:		#; void load_gdtr(int limit, int addr);
  mov 4(%esp) ,%ax
  mov %ax,6(%esp)
  lgdt 6(%esp)
  ret


load_idtr:		#; void load_idtr(int limit, int addr);
  mov 4(%esp) ,%ax
  mov %ax,6(%esp)
  lidt 6(%esp)
  ret
