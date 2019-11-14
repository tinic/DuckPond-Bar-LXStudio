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

import heronarts.lx.model.LXPoint;

import org.tinic.duckpondbar.BarPattern;
import org.tinic.duckpondbar.BarFixture;

public class BarTop extends BarFixture {
  
  private Gradient springGradient;
  private Gradient summerGradient;
  private Gradient autumGradient;
  private Gradient winterGradient;
  private Gradient rainbowGradient;
  private Gradient rainbowGradientBright;
  private Gradient happyGradient;
  private Gradient desertDream;
  private Gradient inTheJungle;

  public LXFloat4 calc(BarPattern.Effect effect, int LEDindex, double time, LXFloat4 glob_pos) { 
      switch (effect) {
          case Spring: {
            double x = ((glob_pos).x + 1.0) * 0.25 + time * 0.05;
            return springGradient.reflect(x).gamma().clamp();
          }
          case Summer: {
            double x = ((glob_pos).x + 1.0) * 0.25 + time * 0.05;
            return summerGradient.reflect(x).gamma().clamp();
          } 
          case Autum: {
            double x = ((glob_pos).x + 1.0) * 0.25 + time * 0.05;
            return autumGradient.reflect(x).gamma().clamp();
          } 
          case Winter: {
            double x = ((glob_pos).x + 1.0) * 0.25 + time * 0.05;
            return winterGradient.reflect(x).gamma().clamp();
          } 
          case AfterRain: {
            double x = (((glob_pos).x + 1.0) * 0.25 + time * 0.05) * 0.25;
            return rainbowGradientBright.repeat(x).gamma().clamp();
          } 
          case SunsetSunrise: {
            double x = (((glob_pos).x + 1.0) * 0.25 + time * 0.05) * 0.25;
            return happyGradient.reflect(x).gamma().clamp();
          } 
          case DesertDream: {
            double x = ((glob_pos).x + 1.0) * 0.25 + time * 0.05;
            return desertDream.reflect(x).gamma().clamp();
          } 
          case InTheJungle: {
            double x = ((glob_pos).x + 1.0) * 0.25 + time * 0.05;
            return inTheJungle.reflect(x).gamma().clamp();
          } 
          case TestStrip: {
              int led = (int)(time * 10.0);
              led %= leds.size();
             return new LXFloat4(1.0, 1.0, 1.0).mul(led == LEDindex ?  1.0 : 0.0);
          }
      }
      return glob_pos;    
  }

  public void initGradients() {

      //
      // Go https://cssgradient.io/ to create gradients the easiest way
      //

      LXFloat4[] springGradient = {
         new LXFloat4(0x289877,0.00),
         new LXFloat4(0xd4e8c2,0.49),
         new LXFloat4(0xe2dda1,0.75),
         new LXFloat4(0xdea120,1.00)
      };
  
      this.springGradient = new Gradient(springGradient, Gradient.ColorMode.RGB);
  
      LXFloat4[] summerGradient = {
         new LXFloat4(0x0e7396,0.00),
         new LXFloat4(0x7dbc3c,0.22),
         new LXFloat4(0x91cb2b,0.34),
         new LXFloat4(0xff9d61,0.64),
         new LXFloat4(0xff7940,0.85),
         new LXFloat4(0xff9100,1.00)
      };
  
      this.summerGradient = new Gradient(summerGradient, Gradient.ColorMode.RGB);
  
      LXFloat4[] autumGradient = {
         new LXFloat4(0xe7790b,0.00),
         new LXFloat4(0xd1aa29,0.32),
         new LXFloat4(0xfac5a4,0.56),
         new LXFloat4(0xed7353,0.90),
         new LXFloat4(0xff0000,1.00)
      };
  
      this.autumGradient = new Gradient(autumGradient, Gradient.ColorMode.RGB);
    
      LXFloat4[] winterGradient = {
         new LXFloat4(0xa3eed6,0.00),
         new LXFloat4(0xdcbcd4,0.21),
         new LXFloat4(0xff96d0,0.39),
         new LXFloat4(0xcb81d6,0.65),
         new LXFloat4(0x4b51f5,1.00)
      };
  
      this.winterGradient = new Gradient(winterGradient, Gradient.ColorMode.RGB);

      LXFloat4[] rainbowGradient = {
         new LXFloat4(0.0, 1.0, 1.0, 0.00),
         new LXFloat4(1.0, 1.0, 1.0, 1.00)
      };
  
      this.rainbowGradient = new Gradient(rainbowGradient, Gradient.ColorMode.HSV);

      LXFloat4[] rainbowGradientBright = {
         new LXFloat4(0xff0000, 0.00),
         new LXFloat4(0xffbd96, 0.10),
         new LXFloat4(0xffff00, 0.17),
         new LXFloat4(0xc3ffa9, 0.25),
         new LXFloat4(0x00ff00, 0.33),
         new LXFloat4(0xd1ffbf, 0.38),
         new LXFloat4(0xaffff3, 0.44),
         new LXFloat4(0x29fefe, 0.50),
         new LXFloat4(0x637eff, 0.59),
         new LXFloat4(0x0000ff, 0.67),
         new LXFloat4(0x9c3fff, 0.75),
         new LXFloat4(0xff00ff, 0.83),
         new LXFloat4(0xffc2b0, 0.92),
         new LXFloat4(0xff0000, 1.00)
      };

      this.rainbowGradientBright = new Gradient(rainbowGradientBright, Gradient.ColorMode.RGB);

      LXFloat4[] happyGradient = {
         new LXFloat4(0x22c1c3,0.00),
         new LXFloat4(0x4387c0,0.33),
         new LXFloat4(0xbb6161,0.66),
         new LXFloat4(0xfdbb2d,1.00)
      };
  
      this.happyGradient = new Gradient(happyGradient, Gradient.ColorMode.RGB);

      LXFloat4[] desertDream = {
         new LXFloat4(0x4d5951,0.00),
         new LXFloat4(0x372a25,0.19),
         new LXFloat4(0x863c25,0.41),
         new LXFloat4(0xa15123,0.63),
         new LXFloat4(0xd6aa68,0.84),
         new LXFloat4(0xf7d6b4,1.00)
      };
  
      this.desertDream = new Gradient(desertDream, Gradient.ColorMode.RGB);

      LXFloat4[] inTheJungle = {
         new LXFloat4(0x135e46,0.00),
         new LXFloat4(0x478966,0.20),
         new LXFloat4(0x73a788,0.40),
         new LXFloat4(0xe3c6ad,0.70),
         new LXFloat4(0xd09d7b,0.90),
         new LXFloat4(0xb67b65,1.00)
      };
  
      this.inTheJungle = new Gradient(inTheJungle, Gradient.ColorMode.RGB);
  }

  BarTop(String ip, double offsetx, double offsety) {
    super(ip);
    
    initGradients();

    List<LXPoint> leds = new ArrayList<LXPoint>();

    double per_strip = 340;
    float step = 0.015f;

    for (int p = 0; p < per_strip; p ++) {
      LXPoint pf = new LXPoint(((float)p) * step + offsetx, offsety, 0);
      addPoint(pf);
      leds.add(pf);
    }
    
    this.leds = Collections.unmodifiableList(leds);
  } 

}
