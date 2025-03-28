# 🚀 Low-Latency Kernel OS (WIP)
> This is the initial phase of a low-latency operating system project. The goal is to build a bare-metal kernel optimized for minimal instruction overhead and real-time event handling — inspired by systems used in high-frequency trading.

---

## 🧠 Project Goals

This project aims to:
- Build a minimal OS from scratch (bootloader → kernel)
- Explore low-level systems design (interrupts, timing, syscalls)
- Profile boot & syscall latency using precise timers (e.g., RDTSC)
- Simulate a cooperative tasking engine for concurrent workloads
- Showcase high-performance systems thinking for roles in HFT, embedded systems, or OS-level C++ development

---

## 📦 Features (So Far)

- ✅ GRUB-bootable C++ kernel (Multiboot2 compliant)
- ✅ Custom linker script (`link.ld`)
- ✅ Assembly entry point (`_start`) that calls `kernel_main`
- ✅ VGA text mode output: direct printing to video memory

---

## 🔧 Requirements

Install build dependencies (for Ubuntu/WSL):

```bash
xargs -a requirements.txt sudo apt install -y
```
