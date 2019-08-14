/*
Copyright 2019 Tinic Uro

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
package org.tinic.duckpondbar;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Arrays; //<>//

import heronarts.lx.LX;
import heronarts.lx.model.LXPoint;
import heronarts.lx.output.LXDatagramOutput;
import heronarts.lx.output.LXDatagram;
import heronarts.lx.output.ArtNetDatagram;

public class NetworkSetup {
  private static int[] getIndices(List<LXPoint> points) {
    int[] indices = new int[points.size()];
    for (int i = 0; i < points.size(); i++) {
      indices[i] = points.get(i).index;
    }
    return indices;
  }
  
  private static void addDatagram(LXDatagramOutput output, int universe, int[] indices, String address) {
      try {
        int total = indices.length;
        int start = 0;
        while (total > 0) {
          int[] split = Arrays.copyOfRange(indices, start, start + Math.min(total, 170));
          ArtNetDatagram datagram = new ArtNetDatagram(split);
          datagram.setAddress(address);
          datagram.setByteOrder(LXDatagram.ByteOrder.RGB);  
          datagram.setUniverseNumber(universe);
          datagram.setSequenceEnabled(true);
          output.addDatagram(datagram);
          total -= split.length;
          start += split.length;
          universe++;
        }
    } catch (Exception x) {
      x.printStackTrace();
    }
  }

  public static void setup(LX lx) {
    try {
      LXDatagramOutput output = new LXDatagramOutput(lx);
  
      BarTop bar = ((DuckPondBar)lx.model).barTop();
      if (bar != null) {
        // Port A
        addDatagram(output, 0, getIndices(bar.top_front), bar.ip);
        // Port B
        addDatagram(output, 4, getIndices(bar.top_back), bar.ip);
      }
      
      List<Umbrella> umbrellas = ((DuckPondBar)lx.model).umbrellas();
      for (int u = 0 ; u < umbrellas.size(); u++) {
        // Port A
        addDatagram(output, 0, getIndices(umbrellas.get(u).getPoints()), umbrellas.get(u).ip);
      }
  
      final double MAX_BRIGHTNESS = 0.75;
      output.brightness.setNormalized(MAX_BRIGHTNESS);
  
      // Add the datagram output to the LX engine
      lx.addOutput(output);
    } catch (Exception x) {
      x.printStackTrace();
    }
  }
}
