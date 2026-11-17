# Finite State Machine Lab

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Name
Boston Holdaway, Wyatt Davis

## Summary
In this lab we used DFF’s to create a state machine

## Lab Questions

### Compare and contrast One Hot and Binary encodings
With the one hot we only look at 1 dff state at a time and the binary we view all 3 at once. The binary requires checking to see if we are moving into an invalid state.

### Which method did your team find easier, and why?
Our team found the one hot implementation to be the easiest as it translated from the diagrams and state logic easier. 

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
There was 5 dff in the one hot and only 3 in the binary. The implementation with 3 would be a better resource utilization, and better for resource intensive tasks.
