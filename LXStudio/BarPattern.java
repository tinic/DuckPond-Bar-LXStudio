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

import java.util.List;
import java.lang.Math;
import java.util.Random;
import java.util.Iterator;
import java.util.Collections;

import heronarts.lx.LX;
import heronarts.lx.LXCategory;

import heronarts.lx.LXPattern;
import heronarts.lx.model.LXPoint;
import heronarts.lx.color.LXColor;
import heronarts.lx.model.LXModel;
import heronarts.lx.model.LXFixture;
import heronarts.lx.parameter.LXParameter;
import heronarts.lx.parameter.EnumParameter;
import heronarts.lx.parameter.BoundedParameter;

import org.tinic.duckpondbar.BarPattern;
import org.tinic.duckpondbar.BarFixture;
import org.tinic.duckpondbar.LXFloat4;

@LXCategory("DuckPond")
public class BarPattern extends LXPattern {
  double tm = 0.0;

  public enum Effect {
    Spring,
    Summer,
    Autum,
    Winter,
    AfterRain,
    SunsetSunrise,
    DesertDream,
    TestStrip,
  };

  public final EnumParameter<Effect> effect =
    new EnumParameter<Effect>("Effect", Effect.Spring)
    .setDescription("Which built-in Effect?");

  public final BoundedParameter speed = (BoundedParameter)
      new BoundedParameter("Speed", 0, -10, 10)
      .setDescription("Speed")
      .setUnits(LXParameter.Units.NONE);

  public BarPattern(LX lx) {
    super(lx);
    addParameter("effect", this.effect);
    addParameter("speed", this.speed);
  }

  public void run(double deltaMs) {
	double tm_factor = Math.pow(1024,speed.getNormalized() - 0.5);
    tm += ( deltaMs * (1.0 / 1000.0) ) * tm_factor;
    for (LXFixture fixture : model.fixtures) {
       BarFixture barFixture = (BarFixture)fixture;
       List<LXPoint> points = barFixture.getPoints();
       for (int c = 0; c < points.size(); c++) {
          LXPoint p = points.get(c);
          LXFloat4 f = barFixture.calc(effect.getEnum(), c, tm, new LXFloat4(p.x, p.y, p.z));
          colors[p.index] = LXColor.rgb((int)(f.x*255.0), (int)(f.y*255.0), (int)(f.z*255.0));
       } 
    }
  }  
}
