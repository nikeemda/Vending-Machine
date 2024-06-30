# Vending-Machine (State Machine)

## Overview
The provided project implements a control unit for a vending machine that dispenses items costing $0.25. The system displays the current total using two 7-segment displays and triggers a vend signal when $0.25 has been deposited in any combination. The system also includes an optional output for a change dispenser that dispenses the change as nickels.

## Design
The design uses a Moore-type sequential state machine to implement the vending machine logic. The state machine has the following states:
- s0: Reset state
- s1: 5 cents deposited
- s2: 10 cents deposited
- s3: 15 cents deposited
- s4: 20 cents deposited
- s5: 25 cents deposited
- s6: Vend state
- s7: Change dispensing state
- s8: Display change
- s9: Display result

The state machine transitions between these states based on the inputs:
- Init: Resets the circuit to the default state (s0)
- N: Indicates a nickel ($0.05) was deposited
- D: Indicates a dime ($0.10) was deposited
- Q: Indicates a quarter ($0.25) was deposited
The outputs of the state machine are:
- Disp1: 7-segment display for the most significant digit of the current total
- Disp2: 7-segment display for the least significant digit of the current total
- Vend: Signal to indicate that the machine should dispense the item
- ChangeL: 7-segment display for the most significant digit of the change
- ChangeR: 7-segment display for the least significant digit of the change
- Change_pulse: Signal to indicate that change should be dispensed as nickels

