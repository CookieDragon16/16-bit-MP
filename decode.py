import sys

if __name__ == '__main__':
    file_input = open("RISC_input.txt",'r')
    file_output = open("RISC_MC.txt",'w+')
    commands = file_input.readlines()
    command_list=["LDW","STW","MOV","HLT","RST","INT","IN","OUT","CH",
                "RET","ADD","SUB","MUL","DIV","MVN","OR","AND","ORN","ANDN",
                "EOR","EON","LSL","LSR","ASR","REV","J","JZ","JNZ","JC",
                "JNS","JO","JNO","JP","JNP","JG","JL","JNG","JNL","CMP",
                "MOD"]
    regs_list=["R0","R1","R2","R3","R4","R5","R6","R7"]
    getbinary = lambda x, n: format(x, 'b').zfill(n)
    for command in commands:
        if command.strip():
            words = command.split(" ")
            if words[0] in command_list:
                command_number=command_list.index(words[0])
                file_output.write(getbinary(command_number, 8)+"\n")
            else :
                print("OPERATION UNKNOWN: "+str(words[0]))
                exit(1)
                
            if words[1] in regs_list:
                #TODO IMPLEMENT REGISTER DECODE
    sys.exit(0)