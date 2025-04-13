
# Parser and Lexer Setup

This project uses **Bison** and **Flex** to create a lexical analyzer and a parser. Below is a guide on how to set up and compile the project, along with known issues.

## Setup and Compilation

1. **Install Required Tools:**
   Make sure you have **Bison** and **Flex** installed. You can install them using the following commands:
   
   - For **Ubuntu/Debian**:
     ```bash
     sudo apt-get install bison flex
     ```
   
   - For **macOS** (using Homebrew):
     ```bash
     brew install bison flex
     ```

2. **Generate Parser Files:**
   Use **Bison** to generate the C source and header files for the parser.
   ```bash
   bison -d parser.y   # Generates parser.tab.c and parser.tab.h
   ```

3. **Generate Lexer Files:**
   Use **Flex** to generate the C source for the lexer.
   ```bash
   flex lexer.l        # Generates lex.yy.c
   ```

4. **Compile the Files:**
   Compile the generated files using **gcc**.
   ```bash
   gcc lex.yy.c parser.tab.c -o parser -lfl  # Compiles everything into 'parser' executable
   ```

5. **Run the Parser:**
   Once compiled, you can run the parser with input.js using:
   ```bash
   ./parser < input.js
   ```

## Known Issues

### 1. **String Recognition Issue:**
   The current implementation does not recognize strings correctly. For example:
   ```js
   console.log("Test")
   ```
   This will throw an error.


### 2. **Line Count Error Issue:**
   The line numbers in error messages are not being updated correctly.

