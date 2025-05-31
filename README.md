# Designing-Multiplexer
🔧 Approximate 4x4 Multiplier Design in Verilog
👨‍💻 Author:
Badavath Thirupathi

📘 Project Title:
Designing Approximate Multipliers in Verilog to Build Hardware Accelerators

📅 Duration:
10–12 Weeks

📌 Description:
This project focuses on the design and implementation of approximate multipliers using Verilog HDL to optimize hardware accelerators, particularly targeting machine learning applications.

Approximate computing trades off a small amount of accuracy for significant savings in power, area, and latency, making it ideal for error-resilient applications like neural networks.

The project includes:

Designing a 4×4 approximate multiplier.

Creating supporting components (half adders, full adders, compressors).

Testing functionality and evaluating relative errors.

Synthesizing the design for resource utilization and power metrics.

🧩 Module Structure:
half_adder.v
Performs a simplified sum and carry logic using:

verilog
Copy
Edit
assign sum_out = x | y;
assign carry_out = x & y;
full_adder.v
Approximates full adder by:

verilog
Copy
Edit
assign sum_out = x;
assign cout = y;
compressor.v
Approximates summation of four bits using XOR/AND/OR operations.

approx_multiplier.v
Implements the approximate 4x4 multiplier using the above modules and partial product logic.

🔬 Testbench (approx_testbench.v)
Iterates through all 256 input combinations.

Compares the approximate result with the exact result.

Calculates the relative error and mean relative error.

✅ Simulation Results:
📊 Error Analysis:
Parameter	Value
Total Combinations	256
Total Error	3109.0
Mean Relative Error	12.144%
Maximum Relative Error	9.0%

📸 See test result screenshot:

🔩 FPGA Resource Utilization (Post Synthesis):
Resource	Usage
Slice LUTs	6
Bonded IOBs	16

📸 See utilization screenshot:

⚡ Power Analysis:
Metric	Value
Total On-Chip Power	3.082 W
Dynamic Power	2.995 W
Static Power	0.087 W
I/O Power	2.810 W
Logic Power	0.028 W
Confidence Level	Low (estimated)

📸 See power report screenshot:

🚀 Applications:
Machine Learning Accelerators

Image Processing Pipelines

IoT Edge Devices

Low-Power Embedded Systems

📂 Files Included:
approx_multiplier.v

half_adder.v

full_adder.v

compressor.v

approx_testbench.v

README.md

📜 License:
This project is for academic and research use.
