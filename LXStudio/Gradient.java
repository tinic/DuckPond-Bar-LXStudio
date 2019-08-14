package org.tinic.duckpondbar;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Arrays;

public class Gradient {
  
  static final int gradient_points = 256;
  static final int gradient_points_mask = 0xFF;
  static final double gradient_points_mod = 255.0;

  public enum ColorMode {
    RGB,
    HSV
  };
  
  Gradient(LXFloat4[] stops, ColorMode mode) {
    List<LXFloat4> colors = new ArrayList<LXFloat4>();

    for (int c = 0; c < gradient_points; c++) {
        double f = (double)c / gradient_points_mod; 

        LXFloat4 a = stops[0];
        LXFloat4 b = stops[1];
        if (stops.length > 2) {
          for (int d = (stops.length-2); d >= 0 ; d--) {
              if ( f >= (stops[d].w) ) {
                a = stops[d+0];
                b = stops[d+1];
                break;
              }
          }
        }

        f -= a.w;
        f /= b.w - a.w;

        switch(mode) {
            case RGB: {
              LXFloat4 l = a.lerp(b,f);
              colors.add(l);
            } break;
            case HSV: {
              LXFloat4 l = a.lerp(b,f);
              colors.add(LXFloat4.hsv(l.x, l.y, l.z));
            } break;
        }
    }

    this.colors = Collections.unmodifiableList(colors);
  }

  public LXFloat4 repeat(double i) {
      i %= 1;
      i *= gradient_points_mod;
      double f = i % 1;
      LXFloat4 a = colors.get(((int)(i))&gradient_points_mask);
      LXFloat4 b = colors.get(((int)(i)+1)&gradient_points_mask);
      return a.lerp(b, f);
  }

  public LXFloat4 reflect(double i) {
      i = Math.abs(i);
      if (((int)i & 1) == 0) {
        i %= 1;
      } else {
        i %= 1;
        i = 1.0 - i;
      }
      i *= gradient_points_mod;
      double f = i % 1;
      LXFloat4 a = colors.get((int)(i)&gradient_points_mask);
      LXFloat4 b = colors.get((int)(i+1)&gradient_points_mask);
      return a.lerp(b, f);
  }
  
  public LXFloat4 clamp(double i) {
      if (i <= 0.0) {
          return colors.get(0);
      }
      if (i >= 1.0) {
          return colors.get(colors.size()-1);
      }
      i *= gradient_points_mod;
      double f = i % 1;
      LXFloat4 a = colors.get((int)(i)&gradient_points_mask);
      LXFloat4 b = colors.get((int)(i+1)&gradient_points_mask);
      return a.lerp(b, f);
  }

  List<LXFloat4> colors;
}
