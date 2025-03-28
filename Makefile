# === Compiler setup ===
CXX := g++
CXXFLAGS := -std=c++17 -ffreestanding -m32 -nostdlib -O2 -Wall -Wextra

# === Targets ===
all: build/kernel.elf os-image.iso

# === Compile and link kernel ===
build/kernel.elf: boot/header.s kernel/kernel.cpp link.ld
	nasm -f elf32 boot/header.s -o build/header.o
	$(CXX) $(CXXFLAGS) -c kernel/kernel.cpp -o build/kernel.o
	ld -m elf_i386 -T link.ld --oformat=elf32-i386 build/header.o build/kernel.o -o build/kernel.elf


# === Build bootable ISO using GRUB ===
os-image.iso: build/kernel.elf
	cp build/kernel.elf iso/boot/kernel.elf
	grub-mkrescue -o build/os-image.iso iso

# === Run in QEMU ===
run: os-image.iso
	qemu-system-x86_64 -cdrom build/os-image.iso -boot d

# === Clean up ===
clean:
	rm -rf build/*.o build/*.elf build/os-image.iso iso/boot/kernel.elf
