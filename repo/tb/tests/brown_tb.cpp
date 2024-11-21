/*
 *  Verifies the results of the mux, exits with a 0 on success.
 */

#include "base_testbench.h"

Vdut *top;
VerilatedVcdC *tfp;
unsigned int ticks = 0;

class BrownTestbench : public BaseTestbench
{
protected:
    void initializeInputs() override
    {
        top->clk = 1;
    }

    void runEQSimulation(int cycles = 1)
    {
        for (int i = 0; i < cycles; i++)
        {
            for (int clk = 0; clk < 2; clk++)
            {
                top->eval();
                tfp->dump(2 * ticks + clk);
                top->clk = !top->clk;
            }
            ticks++;

            if (Verilated::gotFinish())
            {
                exit(0);
            }
        }
    }

    void runLOADSimulation(int cycles = 1)
    {
        for (int i = 0; i < cycles; i++)
        {
            for (int clk = 0; clk < 2; clk++)
            {
                top->eval();
                tfp->dump(2 * ticks + clk);
                top->clk = !top->clk;
            }
            ticks++;

            top->rs1 = 0;
            top->rs2 = 0;
            top->rd = 10;
            top->ALUsrc = 1;
            top->ALUctrl = 0;
            top->RegWrite = 1;
            top->ImmOp = 3;


            if (Verilated::gotFinish())
            {
                exit(0);
            }
        }
    }

};

TEST_F(BrownTestbench, EQWORKS)
{
    top->rs1 = 0;
    top->rs2 = 1;
    top->ALUsrc = 0;
    top->ALUctrl = 0;
    top->RegWrite = 0;

    runEQSimulation(1);
    EXPECT_EQ(top->EQ, 1);
}

TEST_F(BrownTestbench, SUMWORKS)
{
    runLOADSimulation(3);

    EXPECT_EQ(top->a0, 3);
}

int main(int argc, char **argv)
{
    top = new Vdut;
    tfp = new VerilatedVcdC;

    Verilated::traceEverOn(true);
    top->trace(tfp, 99);
    tfp->open("waveform.vcd");

    testing::InitGoogleTest(&argc, argv);
    auto res = RUN_ALL_TESTS();

    top->final();
    tfp->close();

    delete top;
    delete tfp;

    return res;
}
