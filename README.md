# Universal Shift Register

## Introduction
A Universal Shift Register supports multiple modes of operation controlled via select lines:

- Shift left  
- Shift right  
- Parallel load  
- Hold state  

This makes it a flexible and reusable data-handling module in digital systems.

---

## Importance and Features

- High flexibility: Replaces multiple dedicated shift registers  
- Fundamental building block in communication and sequential logic  
- Enables serial ↔ parallel conversion  
- Reduces hardware duplication in modular designs  

---

## Architecture

![Universal Shift Register - Logisim Implementation](docs/USR_logisim.png)

- Implemented in Logisim using D Flip-Flops and multiplexers  
- Each stage consists of a D flip-flop for storage  
- Multiplexers control data input for each flip-flop  
- Control signals (s1, s0) determine operation mode  
- Data propagates synchronously on the clock edge  

---

## Use Cases

**UART / SPI / I2C communication**  
→ Parallel-to-serial and serial-to-parallel data transfer  

**Data buffering**  
→ Temporary storage between asynchronous modules  

**Bit manipulation**  
→ Shifting, alignment, and controlled bit-wise operations  

**FSM-driven designs**  
→ Deterministic shifting using clock/tick control  

**Basic DSP operations**  
→ Delay elements and simple shift-based processing  

---

## Need for a Well-Designed Shift Register

A poorly implemented shift register leads to system-level failures. A robust design ensures:

- Timing accuracy  
  → Shifting aligned with clock edges (posedge/negedge control)  

- Data integrity  
  → Glitch-free load and shift operations  

- Synchronization  
  → Safe interaction with sampled or synchronized inputs  

- Clear control interface  
  → Well-defined signals (load, shift_en, direction)  

- Scalability  
  → Easily extendable bit-width  

---

## Relevance to My Work

This module serves as a core component in my upcoming projects, i.e. UART and SPI protocol implementations and more. I will be using variations of this universal shift register due to its reliability.

- UART TX/RX shift registers  
- SPI Master/Slave data paths (MOSI/MISO)  

Particular care is taken to avoid:

- Bit misalignment  
- Incorrect clock-edge shifting  
- Silent data corruption bugs  