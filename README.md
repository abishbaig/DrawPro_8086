# DrawPro_8086

![Main](https://github.com/abishbaig/DrawPro_8086/assets/150265259/a3f2bbb9-8fbf-406b-bdd7-9b0fdf54d5c7)

<h2>Project Documentation</h2>

<h3>Introduction</h3>
  DrawPro 8086 is an assembly 8086 project designed to provide two distinct modes for graphic manipulation on screen using interrupts.

<h3>Implementation Details</h3>
• Written in assembly language for 8086 architecture.
• Utilizes BIOS interrupts for screen and mouse interaction.
• Implements data structures for managing shape properties and screen updates.

<h3>Modes</h3>
<h4>Draw Mode</h4>
• Allows users to draw freely on the screen.
• Utilizes int 33h interrupts for mouse input.
• Enables drawing using mouse clicks and movements.
<h4>Shape Builder Mode</h4>
• Offers predefined shapes: square, rectangle, circle, and triangle.
• Users can customize:
  ‣ Size (length, width, radius, sides).
  ‣ Colors (foreground and background).
  ‣ Shapes are drawn automatically based on user input.

<h3>Features</h3>
• Interactive graphical interface using mouse interrupts (int 33h).
• Real-time rendering of shapes and drawings on screen.
• Color customization for shapes drawn elements.
• Seamless mode switching between Draw Mode and Shape Builder Mode.

<h3>Conclusion</h3>
  DrawPro 8086 provides a robust platform for graphic manipulation in assembly 8086, offering both freeform drawing capabilities and structured shape building functionalities. This project is ideal for educational purposes to explore low-level programming with real-time graphical outputs.
