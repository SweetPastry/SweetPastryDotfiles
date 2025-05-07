section .spData
  spHello:  db 'Sweet Pastry Hello World!', 10
  spHello_len: equ $-spHello

section .text
  _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, spHello
  mov edx, spHello_len
  int 80h

  mov eax, 1
  mov ebx, 0
  int 80h