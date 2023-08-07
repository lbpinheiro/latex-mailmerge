# LaTeX Mail Merge Bash Script

This script automates the process of generating multiple LaTeX files by merging data from a CSV-like file into a LaTeX template. It's especially useful for tasks like creating reports or documents where you need to generate similar content with different data.

While initially designed for LaTeX files, this script can be used with any type of text file.

## Usage

1. Clone this repository to your local machine or download the script and required files.
2. Make sure you have the necessary files: `mailmerge.sh`, `info.dat`, and `template.tex`.
3. Open your terminal and navigate to the directory where the script is located.
4. Run the script with the following command:

   ```bash
   ./mailmerge.sh <data_file> <template_file>
   ```

    Replace \`**<data_file>**\` with the name of your data file and \`**<template_file>**\` with the name of your LaTeX template file.

## Example

1. \`**info.dat**\` contains data like this:

   ```sql
   COD|YEAR|INFORMATION
   66372|2022|something useful
   99312|2023|another thing

   ```
   The empty last line is important.

2. \`**template.tex**\` is a LaTeX template:

   ```latex
   \documentclass[11pt]{report}

   \begin{document}
   Information: %INFORMATION%

   Data with code %COD%, gathered in %YEAR%
   \end{document}
   ```

3. Running the script:

   ```bash
   ./mailmerge.sh info.dat template.tex
   ```

   This will generate two LaTeX files: \`**66372_2022$report_0.tex**\` and \`**99312_2023$report_1.tex**\`, each filled with the corresponding data from info.dat.

## Requirements

- Bash shell
- The data file should be in a CSV-like format, with a \`**|**\` separator.

## Notes

- Make sure the script is executable. You can use the following command to grant execution permissions:

   ```bash
   chmod +x mailmerge.sh
   ```

- The script assumes that the data file's first line contains variable names and the template file uses \`**%VARIABLE%**\` placeholders for replacement.

- If you want to customize the generated file names, you can modify line 35 of mailmerge.sh to change the format according to your preferences.

## License

Copyright 2023 [lbpinheiro](https://github.com/lbpinheiro)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.