// Processing SVG library, required for exporting SVGs
import processing.svg.*;

// When the record variable has a value of true,
// the code will output an SVG and then flip it
// back to false (see below).
boolean record = false;

// Setup method - this is where you do all of your
// setup including setting the canvas size (required).
// Gets run once per execution.
void setup() {
  // Set size to dimensions of paper in pixels
  // I'm using P3D here because it tends to get
  // the best results for SVG export - I've always
  // had minor quirks and issues with P2D.
  size(960, 768, P3D);

  // Use HSB for color mode.
  colorMode(HSB, 360, 100, 100, 100);

  // Smooth lines
  smooth(8);
}

// This is the draw method where you put all of your
// code for drawing to the screen - it gets called
// after setup and runs as many times per second
// as your computer can handle, which is fun since
// you can use variables like frameCount (current frame)
// to make things change as a function of time.
void draw() {
  // If record flag is set, set up the SVG output.
  // This has to get called *before* anything is
  // drawn or it won't capture anything.
  if (record) {
    // Processing also has a 'beginRecord' function that
    // can also export SVGs, but it can't handle 3D.
    // beginRaw can and is used here instead.
    beginRaw(SVG, "output.svg");

    // Can improve appearance of 3D geometry drawn to 2D files
    hint(ENABLE_DEPTH_SORT);
  }

  // 
  // 
  // 
  // *Write your application code here*
  // 
  // 
  // 
  
  // Once we've finished drawing everything, we'll
  // finish recording the SVG to the file and stop
  // recording. The file will be saved in the same
  // directory where the sketch is saved, using the
  // filename from above.
  if (record) {
    endRaw();
    record = false;
  }
}

// This function gets run when (*gasp*) the mouse is clicked.
// When the mouse is clicked, we'll set record to true so
// that the very next frame is saved to SVG.
void mouseClicked() {
  record = true;
}
