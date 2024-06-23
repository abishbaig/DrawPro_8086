# DrawPro_8086

![Main](https://github.com/abishbaig/DrawPro_8086/assets/150265259/a3f2bbb9-8fbf-406b-bdd7-9b0fdf54d5c7)

<h2>Project Documentation</h2>

<h3>Introduction</h3>
  DrawPro 8086 is an assembly 8086 project designed to provide two distinct modes for graphic manipulation on screen using interrupts.

<h3>Implementation Details</h3>
<p>• Written in assembly language for 8086 architecture.</p>
<p>• Utilizes BIOS interrupts for screen and mouse interaction.</p>
<p>• Implements data structures for managing shape properties and screen updates.</p>

<h3>Modes</h3>
<h4>Draw Mode</h4>
<p>• Allows users to draw freely on the screen.</p>
<p>• Utilizes int 33h interrupts for mouse input.</p>
<p>• Enables drawing using mouse clicks and movements.</p>
<h4>Shape Builder Mode</h4>
<p>• Offers predefined shapes: square, rectangle, circle, and triangle.</p>
<p>• Users can customize:</p>
  <p>‣ Size (length, width, radius, sides).</p>
  <p>‣ Colors (foreground and background).</p>
  <p>‣ Shapes are drawn automatically based on user input.</p>

<h3>Features</h3>
<p>• Interactive graphical interface using mouse interrupts (int 33h).</p>
<p>• Real-time rendering of shapes and drawings on screen.</p>
<p>• Color customization for shapes drawn elements.</p>
<p>• Seamless mode switching between Draw Mode and Shape Builder Mode.</p>

<h3>Conclusion</h3>
  DrawPro 8086 provides a robust platform for graphic manipulation in assembly 8086, offering both freeform drawing capabilities and structured shape building functionalities. This project is ideal for educational purposes to explore low-level programming with real-time graphical outputs.
