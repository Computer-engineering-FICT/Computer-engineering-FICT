#nasm print_string.asm -felf -o print_string.o
#ld -melf_i386 -Ttext 0x0 -o print_string print_string.o

#nasm print_hex.asm -felf -o print_hex.o
#ld -melf_i386 -Ttext 0x0 -o print_hex print_hex.o

nasm -f elf main.asm
ld -m elf_i386 -s -o main main.o

./main
