package org.tinic.duckpondbar;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Arrays;

import heronarts.lx.model.LXPoint;

import org.tinic.duckpondbar.BarPattern;
import org.tinic.duckpondbar.BarFixture;

public class Umbrella  extends BarFixture {

  private Gradient rainbowGradient;
  private Gradient rainyGradient;
  private Gradient autumGradient;
  private Gradient winterGradient;
  
  public LXFloat4 calc(BarPattern.Effect effect, int LEDindex, double time, LXFloat4 glob_pos) { 
      switch (effect) {
          case Spring: {
            double x = Math.sin((toLocal(glob_pos).x + 1.0) * 0.25 + time * 0.050);
            double y = Math.cos((toLocal(glob_pos).y + 1.0) * 0.25 + time * 0.055);
            double l = 1.0 - toLocal(glob_pos).len() + 0.5;
            return rainbowGradient.reflect(x * y).mul(l).clamp().gamma();
          }
          case Summer: {
            double x0 = Math.sin((glob_pos.x + 1.0) * 0.5 + time * 0.050);
            double y0 = Math.cos((glob_pos.y + 1.0) * 0.5 + time * 0.055);
            double x1 = Math.sin((glob_pos.x + 1.0) * 10 + time * 0.50);
            double y1 = Math.cos((glob_pos.y + 1.0) * 10 + time * 0.55);
            return rainbowGradient.reflect(x0 * y0).add(new LXFloat4(1.0,1.0,1.0).mul(x1 * y1).clamp()).clamp();
          } 
          case Autum: {
            double x0 = Math.sin((glob_pos.x + 1.0) * 0.5 + time * 0.050);
            double y0 = Math.cos((glob_pos.y + 1.0) * 0.5 + time * 0.055);
            double x1 = Math.sin((glob_pos.x + 1.0) * 15 + time * 0.50);
            double y1 = Math.cos((glob_pos.y + 1.0) * 15 + time * 0.55);
            return rainyGradient.clamp(x1 * y1).add(autumGradient.reflect(x0 * y0).mul(new LXFloat4(0.5,0.5,0.5))).clamp();
          } 
          case Winter: {
            double x0 = Math.sin((glob_pos.x + 1.0) * 0.5 + time * 0.050);
            double y0 = Math.cos((glob_pos.y + 1.0) * 0.5 + time * 0.055);
            double x1 = Math.sin((toLocal(glob_pos).x + 1.0) * 0.25 + time * 0.050);
            double y1 = Math.cos((toLocal(glob_pos).y + 1.0) * 0.25 + time * 0.055);
            double l = 1.0 - toLocal(glob_pos).len() + 0.5;
            return winterGradient.reflect(x1 * y1).mul(l).mul(rainyGradient.reflect(x0 * y0)).clamp().gamma();
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

    LXFloat4[] rainbowGradient = {
       new LXFloat4(0.0, 1.0, 1.0, 0.00),
       new LXFloat4(1.0, 1.0, 1.0, 1.00)
    };

    this.rainbowGradient = new Gradient(rainbowGradient, Gradient.ColorMode.HSV);

    LXFloat4[] rainyGradient = {
       new LXFloat4(0x000000, 0.00),
       new LXFloat4(0x413a40, 0.20),
       new LXFloat4(0x65718a, 0.40),
       new LXFloat4(0x6985b9, 0.53),
       new LXFloat4(0xffffff, 1.00)
    };

    this.rainyGradient = new Gradient(rainyGradient, Gradient.ColorMode.RGB);

    LXFloat4[] autumGradient = {
       new LXFloat4(0x000000, 0.00),
       new LXFloat4(0x351e10, 0.13),
       new LXFloat4(0x58321a, 0.25),
       new LXFloat4(0x60201e, 0.41),
       new LXFloat4(0x651420, 0.56),
       new LXFloat4(0x7b5a54, 0.70),
       new LXFloat4(0x9abf9e, 0.83),
       new LXFloat4(0xffffff, 1.00)
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
  }

  Umbrella(int id, String ip, double xl, double yl, double zl) {
    super(ip);

    initGradients();

    int spokes = 8;
    int leds_per_spoke = 10;
    List<LXPoint> leds = new ArrayList<LXPoint>();
    for (int p = 0; p < spokes; p++) {
      double xm = Math.sin((2.0 * Math.PI / (double)spokes) * p);
      double ym = Math.cos((2.0 * Math.PI / (double)spokes) * p);
      for (int q = 0; q < leds_per_spoke; q++) {
        double l = 0.305;
        double o = 0.045;
        double f = (double)(((p&1) == 1) ? (leds_per_spoke-1-q) : q) / (double)(leds_per_spoke-1);
        double x = xm * (f * l) + xm * o; 
        double y = ym * (f * l) + ym * o; 
        LXPoint pb = new LXPoint(x+xl,y+yl,zl);
        addPoint(pb);
        leds.add(pb);
      }
    }
    
    this.id = id;
    this.leds = Collections.unmodifiableList(leds);
  }

  public final int id;
};
