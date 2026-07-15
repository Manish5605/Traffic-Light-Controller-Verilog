# Traffic-Light-Controller-Verilog
# 4-Way Traffic Light Controller (Verilog HDL)

A synthesizable Moore FSM that controls a four-way road intersection, giving each direction a dedicated Green → Yellow phase before handing off to the next. Designed in Verilog and verified in Xilinx Vivado.

## Overview

The controller cycles through eight states — one Green and one Yellow state per direction (North, East, South, West) — using a single shared down-counter for timing. Only one direction is ever active at a time, which keeps the design simple and inherently free of conflicting green signals.

**Architecture:** Clock → State Register → Next-State Logic → Output Decoder, with a Timer Counter driving state transitions.

## State Sequence

```
S0 North Green → S1 North Yellow → S2 East Green → S3 East Yellow
→ S4 South Green → S5 South Yellow → S6 West Green → S7 West Yellow → S0 …
```

## I/O

| Signal | Direction | Description |
|---|---|---|
| `clk` | Input | System clock |
| `reset` | Input | Active-high synchronous reset |
| `north`, `east`, `south`, `west` | Output | 2-bit light state per direction |

**Output encoding:** `00` Red · `01` Yellow · `10` Green

## Timing

| Parameter | Default |
|---|---|
| Green duration | 20 clock cycles |
| Yellow duration | 5 clock cycles |

Both are RTL parameters and can be changed without restructuring the FSM.

## Repository Structure

```
├── rtl/            traffic_controller.v
├── tb/              traffic_controller_tb.v
├── simulation/      waveform.png, simulation_output.png
├── synthesis/       rtl_schematic.png, utilization_report.pdf, timing_report.pdf
└── README.md
```

## Simulation

1. Open Vivado and create a new RTL project.
2. Add `traffic_controller.v` and `traffic_controller_tb.v`.
3. Run **Behavioral Simulation** and inspect the waveform.
4. Run **Synthesis**; review the RTL schematic and utilization report.

## Concepts Demonstrated

Finite State Machines (Moore), sequential and combinational logic, state encoding, counter-based timing, and synthesizable RTL design practices.

## Roadmap

- Emergency vehicle priority override
- Pedestrian crossing signal
- Vehicle density sensors (adaptive timing)
- Night / blinking mode
- FPGA deployment

## Author

**Manish** — Electronics Engineering student focused on RTL design, FPGA, and VLSI.

---
If this project is useful to you, consider starring the repository.
