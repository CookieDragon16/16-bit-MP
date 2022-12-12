# 16-bit General Purpose Processor

**Bit-depth:** 16 bits

**word:** 16 bits

**instruction set type:** RISC

**INSTRUCTION SET:**

- **rd** register destination
- **rs** register source
- **imm6** immediate value 6 bits

**COMMANDS:**

| **Name of command** | **Explanation** | **Syntax** | **Opcode** |
| --- | --- | --- | --- |
| **ldw (load word)** | load word from memory into register, addressing register only via any general register | **ldw rd,[r]** | **000000** |
| **stw (store word)** | store 16-bit value from register to memory, addressing register only via any general register | **stw rs,[r]** | **000001** |
| **mov (move)** | copy a value from one register to another, or load a direct 6-bit value into a register | **mov rd,rs/imm6** | **000010** |
| **j (jump)** | unconditional jump | **j rd/addr9** | **011001** |
| **jz (jump if zero)** | jump if ZF = 1 | **jz rd/addr9** | **011010** |
| **jc (jump if carry)** | jump if CF = 1 | **jc rd/addr9** | **011100** |
| **jo (jump if oveflow)** | jump if OF = 1 | **jo rd/addr9** | **011110** |
| **jp (jump if parity)** | jump if PF = 1 | **jp rd/addr9** | **100000** |
| **jnz (jump if no zero)** | jump if ZF = 0 | **jnz rd/addr9** | **011011** |
| **jnc (jump no carry)** | jump if CF = 0 | **jnc rd/addr9** | **011101** |
| **jno (jump no overflow)** | jump if OF = 0 | **jno rd/addr9** | **011111** |
| **jnp (jump no parity)** | jump if PF = 0 | **jnp rd/addr9** | **100001** |
| **jg (jump if greater)** | jump if GF = 1 | **jg rd/addr9** | **100010** |
| **jl (jump if lower)** | jump if LF = 1 | **jl rd/addr9** | **100011** |
| **jge (jump if greater or equal)** | jump if ZF = 1 or GF = 1 | **jge rd/addr9** |
| **jle (jump if lower or equal)** | jump if LF = 1 or ZF = 1 | **jle rd/addr9** |
| **ret (return)** | return from the function, the processor extracts the value from the RAF register and loads it into the PC   | **ret** | **001001** |
| **ch (call handler)** | saves to raf by increasing the value by 2 and loading jump address into PC | **ch rd/addr9** | **001000** |
| **int (interrupt)** | hardware interrupt request to device following vector | **int vector8** | **000101** |
| **rst (reset cpu)** | reset cpu to initialization state | **rst** | **000100** |
| **hlt (halt cpu)** | stop cpu | **hlt** | **000011** |
| **add (+)** | rd = rd + rs + ci | **add rd,rs.** | **001010** |
| **sub (-)** | rd =(rd – rs) - ci | **sub rd,rs.** | **001011** |
| **mul (\*)** | mul rd,rs. | **Rd = rd\*rs** | **001100** |
| **div (/)** | div rd,rs. | **Rd = rd/rs** | **001101** |
| **lsl (\<\<)** | rd = rd \<\< rs/imm6 | **lsl rd,rs/imm6.** | **010101** |
| **mod (%)** | rd  = rd % rs/imm6 | **mod rd,rs/imm6** | **100111** |
| **asr (\>\>\>)** | rd = rd \>\>\> rs,imm4 | **asr rd,rs/imm6.** | **010111** |
| **lsr (\>\>)** | rd = rd \>\> rs,imm4 | **lsr rd,rs/imm6.** | **010110** |
| **or** | Rd = rd OR rs/imm6 | **or rd,rs/imm6.** | **001111** |
| **eor (exlusive or)** | Rd = rd ^ rs | **eor rd,rs/imm6.** | **010011** |
| **orn (or not)** | Rd = rd ~OR rs | **orn rd,rs/imm6.** | **010001** |
| **and** | Rd = rd & rs | **and rd,rs/imm6.** | **010000** |
| **andn (and not)** | rd = rd ~& rs | **and rd,rs/imm6.** | **010010** |
| **eon (exlusive or not)** | rd = rd ~^ rs | **eon rd,rs/imm6 .** | **010100** |
| **mvn (move not)** | rd = ~rs/imm8 | **mvn rd,rs/imm6.** | **001110** |
| **rev (reverse bits)** | Swap bytes from swap high byte becomes low 0xadf1 -\> 0xf1ad | **rev rd,rs** | **011000** |
| **in (read input port I/O devices)** | read data from the I/O device buffer | **in rd,r/imm6** | **000110** |
| **out (write output port I/O devices)** | write data to I/O device buffer | **out r/imm6,rs** | **000111** |
| **cmp (compare)** | compare rd with rs or with imm6 | **cmp rd,rs/imm6** | **100110** |

**COMMAND PREFIX OR EXTENSION:**

- **r – register** (indicates that the processor works only with processor registers)
- **i – immediate** (indicates that the processor works with both registers and immediate values)

**Prefixes are mandatory in all instructions except for ldw stw alr rst hlt int ch ret.**

**Example:**

```
movr r2,r5

movi r2,0x4f
```

instruction entry:

instruction prefix/extension operand1,operand2

```
[15:9] [8:6] [5:3]/[5:0]
```

If we make an operation between 2 registers we will use this configuration of bits [15:9] [8:6] [5:0]

And if we make an operation between one register and one fixed value we will use this configuration of bits [15:9] [8:6] [5:3][2:0]

**Instruction size 16 bits**

```
instr r/i op1,op2
```

**PROCESSOR REGISTERS:**

- **r0-r6 (register):** 7 general purpose registers
- **pc (program counter):** instruction counter stores the current instruction address
- **raf/r7 (return address function register):** The function return address register contains the return address

####


#### Instruction Opcodes:

| opcode | Dest\_reg | Src1\_reg | Src2\_reg |
| --- | --- | --- | --- |
| bits 15 -\> 9 | bits 8 -\> 6 | bits 5 -\> 3 | bits 2 -\> 0 |

The address for conditional jump instructions is calculated by adding the 16-bit sign-extension of an 8-bit signed offset to the program counter.

| Opcode | 0 | 8-bit signed offset |
| --- | --- | --- |
| bits 15 -\> 9 | bit 8 | bits 7 -\> 0 |

The address for unconditional jump instructions is specified by the contents of src2\_reg.

| opcode | Dest\_reg | Src1\_reg | Src2\_reg |
| --- | --- | --- | --- |
| bits 15 -\> 9 | bits 8 -\> 6 | bits 5 -\> 3 | bits 2 -\> 0 |

**FLAGS (REGISTER FLAGS)**

- **ZF** zero flag
- **CF** carry flag
- **OF** overflow flag
- **GF** flag "greater than"
- **LF** flag "less than"
- **PF** parity flag

**For all operations, first the program counter is incremented and the processor takes the opcode for the next of the position of the program counter befor incrementing. Then the opcode its decoded in the Control Unit and the given operation its executed with the given parameters.**
