/** 
 * By using LX Studio, you agree to the terms of the LX Studio Software
 * License and Distribution Agreement, available at: http://lx.studio/license
 *
 * Please note that the LX license is not open-source. The license
 * allows for free, non-commercial use.
 *
 * HERON ARTS MAKES NO WARRANTY, EXPRESS, IMPLIED, STATUTORY, OR
 * OTHERWISE, AND SPECIFICALLY DISCLAIMS ANY WARRANTY OF
 * MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR A PARTICULAR
 * PURPOSE, WITH RESPECT TO THE SOFTWARE.
 */

// ---------------------------------------------------------------------------
//
// Welcome to LX Studio! Getting started is easy...
// 
// (1) Quickly scan this file
// (2) Look at "Model" to define your model
// (3) Move on to "Patterns" to write your animations
// 
// ---------------------------------------------------------------------------

// Reference to top-level LX instance
heronarts.lx.studio.LXStudio lx;

void setup() {
  // Processing setup, constructs the window and the LX instance
  size(1024, 720, P3D);
  lx = new heronarts.lx.studio.LXStudio(this, buildModel(), MULTITHREADED);
  lx.ui.setResizable(RESIZABLE);
}

int[] getIndices(List<LXPoint> points) {
  int[] indices = new int[points.size()];
  for (int i = 0; i < points.size(); i++) {
    indices[i] = points.get(i).index;
  }
  return indices;
}

void initialize(final heronarts.lx.studio.LXStudio lx, heronarts.lx.studio.LXStudio.UI ui) {
  final double MAX_BRIGHTNESS = 0.75;
  try {

    final String BAR_TOP_IP = "10.42.0.2";
    //final String BAR_FRONT_IP = "10.42.0.3";
    //final String BAR_BACK_IP = "10.42.0.4";

    final String UMBRELLA_IPs[] = {
        "10.42.0.10",
        "10.42.0.11",
        "10.42.0.12",
        "10.42.0.13",
        "10.42.0.14",
        "10.42.0.15",
        "10.42.0.16",
        "10.42.0.17",
        "10.42.0.18"
    };
    
    LXDatagramOutput output = new LXDatagramOutput(lx);

    Fixture bar = (Fixture)((GridModel3D)lx.model).fixtures.get(0);
    
    int universe = 0;
    int[] indices = getIndices(bar.top_front);
    int total = indices.length;
    int start = 0;
    
    
    while (total > 0) {
      int[] split = Arrays.copyOfRange(indices, start, start + Math.min(total, 170));
      ArtNetDatagram frontDatagram = new ArtNetDatagram(indices);
      frontDatagram.setAddress(BAR_TOP_IP);
      frontDatagram.setByteOrder(LXDatagram.ByteOrder.RGB);  
      frontDatagram.setUniverseNumber(universe);
      frontDatagram.setSequenceEnabled(true);
      output.addDatagram(frontDatagram);
      total -= split.length;
      start += split.length;
      universe++;
    }
    
    universe = 4;
    indices = getIndices(bar.top_back);
    total = indices.length;
    start = 0;      
    while (total > 0) {
      int[] split = Arrays.copyOfRange(indices, start, start + Math.min(total, 170));
      ArtNetDatagram backDatagram = new ArtNetDatagram(indices);
      backDatagram.setAddress(BAR_TOP_IP);
      backDatagram.setByteOrder(LXDatagram.ByteOrder.RGB);  
      backDatagram.setUniverseNumber(universe);
      backDatagram.setSequenceEnabled(true);
      output.addDatagram(backDatagram);
      total -= split.length;
      start += split.length;
      universe++;
    }
    
    for (int u = 0 ; u < bar.umbrellas.size(); u++) {
      universe = 4;
      indices = getIndices(bar.umbrellas.get(u));
      total = indices.length;
      start = 0;
      while (total > 0) {
        int[] split = Arrays.copyOfRange(indices, start, start + Math.min(total, 170));
        ArtNetDatagram backDatagram = new ArtNetDatagram(split);
        backDatagram.setAddress(UMBRELLA_IPs[u]);
        backDatagram.setByteOrder(LXDatagram.ByteOrder.RGB);  
        backDatagram.setUniverseNumber(universe);
        backDatagram.setSequenceEnabled(true);
        output.addDatagram(backDatagram);
        total -= split.length;
        start += split.length;
        universe++;
      }
    }

    output.brightness.setNormalized(MAX_BRIGHTNESS);
    
    // Add the datagram output to the LX engine
    lx.addOutput(output);
  } catch (Exception x) {
    x.printStackTrace();
  }
}

void onUIReady(heronarts.lx.studio.LXStudio lx, heronarts.lx.studio.LXStudio.UI ui) {
  // Add custom UI components here
}

void draw() {
  // All is handled by LX Studio
}

// Configuration flags
final static boolean MULTITHREADED = true;
final static boolean RESIZABLE = true;

// Helpful global constants
final static float INCHES = 1;
final static float IN = INCHES;
final static float FEET = 12 * INCHES;
final static float FT = FEET;
final static float CM = IN / 2.54;
final static float MM = CM * .1;
final static float M = CM * 100;
final static float METER = M;
