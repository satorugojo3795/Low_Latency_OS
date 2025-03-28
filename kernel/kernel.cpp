// extern "C" void kernel_main() {
//     char* video = (char*)0xb8000;
//     video[0] = 'O';
//     video[2] = 'K';
//     video[4] = '!';
//     video[6] = '\0';

//     while (1) {}
// }


extern "C" void kernel_main(){
    // extern tell the compiler "dont mangle the name as C++ changes function names to support overloading; GRUB expects a plain C-style name for kernel_main so we are telling the compiler to export this function using C linkage"

    const char* msg = "hello from kernel"; // define a pointer to a constant string; Stored in memory for read-only space; C++ allows this - just like C

    char* video_memory = (char*)0xb8000; // direct memory address of VGA text buffer; every printable character on the screen is drawn by writing bytes to this address. Its a cast: we treat that memory address as a pointer to char; In real mode(or early protected mode), this is how tou draw text manually

    for(int i=0;msg[i]!='\0';++i){

        // Each character on screen uses 2 bytes:
        // First byte: ASCII character
        // Second byte: attribute (text color, background, brightness, etc.)
        // 0x07 = light grey on black (standard default look)

        // This loop manually copies each letter to screen

        video_memory[i*2] = msg[i];     // Character
        video_memory[i*2+1] = 0x07;     // attribute type
        
    }

    while(1){} // infinite loop to halt
}

