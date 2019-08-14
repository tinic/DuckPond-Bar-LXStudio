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
import java.util.Arrays;

import heronarts.lx.LX;
import heronarts.lx.LXPattern;
import heronarts.lx.model.LXPoint;
import heronarts.lx.color.LXColor;
import heronarts.lx.model.LXModel;
import heronarts.lx.model.LXFixture;
import heronarts.lx.model.LXAbstractFixture;
import heronarts.lx.parameter.LXParameter;

import org.tinic.duckpondbar.LXFloat4;
import org.tinic.duckpondbar.BarPattern;

public class BarFixture extends LXAbstractFixture {
  
  List<LXPoint> leds;
  
  BarFixture(String ip) {
    this.ip = ip;
    boundsValid = false;
    centerValid = false;
    sizeValid = false;
    factorValid = false;
  }

  public LXFloat4 calc(BarPattern.Effect effect, int index, double time, LXFloat4 glob_pos) { 
      return glob_pos.clamp().gamma();
  }
  
  public void calcBounds() {
    if (boundsValid) {
        return;
    }

    min = new LXFloat4(+1000.0, +1000.0, +1000.0, 0.0);
    max = new LXFloat4(-1000.0, -1000.0, -1000.0, 0.0);
    
    for (int c=0; c<leds.size(); c++) {
        min = min.min(new LXFloat4(leds.get(c)));
        max = max.max(new LXFloat4(leds.get(c)));
    }
    
    boundsValid = true;
  }

  public LXFloat4 center() {
    if (centerValid) {
        return this.center;
    }

    calcBounds();
    this.center = new LXFloat4(
      (max.x + min.x) * 0.5, 
      (max.y + min.y) * 0.5, 
      (max.z + min.z) * 0.5);
      
    centerValid = true;

    return this.center;
  }
  
  public LXFloat4 size() {
    if (sizeValid) {
        return this.size;
    }

    calcBounds();
    this.size = new LXFloat4(max.x - min.x, max.y - min.y, max.z - min.z);
    sizeValid = true;
    return this.size;
  }
  
  public LXFloat4 normalize(LXFloat4 pos) {
    if (factorValid) {
      return new LXFloat4(pos.x * this.factor.x,  pos.y * this.factor.y, pos.z * this.factor.z);
    }
    LXFloat4 size = size();
    double xf = 1.0;
    double yf = 1.0;
    double zf = 1.0;
    if (size.x != 0) xf = 2.0 / size.x;
    if (size.y != 0) yf = 2.0 / size.y;
    if (size.z != 0) zf = 2.0 / size.z;
    this.factor = new LXFloat4(xf, yf, zf);
    factorValid = true;
    return new LXFloat4(pos.x * this.factor.x,  pos.y * this.factor.y, pos.z * this.factor.z);
  }
  
  public LXFloat4 toLocal(LXFloat4 pos) {
      LXFloat4 center = center();
      return normalize(new LXFloat4(
        pos.x - center.x,
        pos.y - center.y,
        pos.z - center.z));
  }

  public final String ip;
  
  private boolean boundsValid;
  private LXFloat4 min;
  private LXFloat4 max;
  private boolean centerValid;
  private LXFloat4 center;
  private boolean sizeValid;
  private LXFloat4 size;
  private boolean factorValid;
  private LXFloat4 factor;
}
