#include <verilated.h>
#include "Vsign_extend.h" // Generated header file

int main() {
    Verilated::commandArgs(0, nullptr);
    Vsign_extend* sign_extend = new Vsign_extend;

    // Test Case 1: Sign extend a small immediate
    sign_extend->imm_in = 0x0FFC; // Immediate value
    sign_extend->eval();
    printf("Sign-Extended Output: 0x%08X\n", sign_extend->imm_out);

    // Test Case 2: Sign extend another value
    sign_extend->imm_in = 0x0004;
    sign_extend->eval();
    printf("Sign-Extended Output: 0x%08X\n", sign_extend->imm_out);

    delete sign_extend;
    return 0;
}
