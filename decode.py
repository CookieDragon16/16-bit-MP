import sys

if __name__ == '__main__':
    file_input = open("RISC_input.txt",'r')
    file_output = open("RISC_MC.txt",'wb+')
    commands = file_input.readlines()
    
    
    for command in commands:
        if command.strip():
            words = command.split(" ")
            if words[0] == "LDW":
                file_output.write("000000\n")
            elif words[0] == "STW":
                file_output.write("000001\n")
            elif words[0] == "MOV":
                file_output.write("000010\n")
            elif words[0] == "HLT":
                file_output.write("000011\n")
            elif words[0] == "RST":
                file_output.write("000100\n")
            elif words[0] == "INT":
                file_output.write("000101\n")
            elif words[0] == "IN":
                file_output.write("000110\n")
            elif words[0] == "OUT":
                file_output.write("000111\n")
            elif words[0] == "CH":
                file_output.write("001000\n")
            elif words[0] == "RET":
                file_output.write("001001\n")
            elif words[0] == "ADD":
                file_output.write("001010\n")
            elif words[0] == "SUB":
                file_output.write("001011\n")
            elif words[0] == "MUL":
                file_output.write("001100\n")
            elif words[0] == "DIV":
                file_output.write("001101\n")
            elif words[0] == "MVN":
                file_output.write("001110\n")
            elif words[0] == "OR":
                file_output.write("001111\n")
            elif words[0] == "AND":
                file_output.write("010000\n")
            elif words[0] == "ORN":
                file_output.write("010001\n")
            elif words[0] == "ANDN":
                file_output.write("010010\n")
            elif words[0] == "EOR":
                file_output.write("010011\n")
            elif words[0] == "EON":
                file_output.write("010100\n")
            elif words[0] == "LSL":
                file_output.write("010101\n")
            elif words[0] == "LSR":
                file_output.write("010110\n")
            elif words[0] == "ASR":
                file_output.write("010111\n")
            elif words[0] == "REV":
                file_output.write("011000\n")
            elif words[0] == "J":
                file_output.write("011001\n")
            elif words[0] == "JZ":
                file_output.write("011010\n")
            elif words[0] == "JNZ":
                file_output.write("011011\n")
            elif words[0] == "JC":
                file_output.write("011100\n")
            elif words[0] == "JNS":
                file_output.write("011101\n")
            elif words[0] == "JO":
                file_output.write("011110\n")
            elif words[0] == "JNO":
                file_output.write("011111\n")
            elif words[0] == "JP":
                file_output.write("100000\n")
            elif words[0] == "JNP":
                file_output.write("100001\n")
            elif words[0] == "JG":
                file_output.write("100010\n")
            elif words[0] == "JL":
                file_output.write("100011\n")
            elif words[0] == "JNG":
                file_output.write("100100\n")
            elif words[0] == "JNL":
                file_output.write("100101\n")
            elif words[0] == "CMP":
                file_output.write("100110\n")
            elif words[0] == "MOD":
                file_output.write("100111\n")
            else :
                print("OPERATION UNKNOWN: ")
                print(words[0])
                exit(1)
    sys.exit(0)