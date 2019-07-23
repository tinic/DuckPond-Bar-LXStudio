

public static class Gradient {

  public enum ColorMode {
    RGB,
    HSV
  };
  
  Gradient(LXFloat4[] stops, ColorMode mode) {
    List<LXFloat4> colors = new ArrayList<LXFloat4>();

    for (int c = 0; c < 256; c++) {
        double f = (double)c / 255.0; 

        LXFloat4 a = stops[(int)(0)];
        LXFloat4 b = stops[(int)(1)];
        if (stops.length > 2) {
          for (int d = (stops.length-2); d >= 0 ; d--) {
              if ( f >= (stops[d].w) ) {
                a = stops[(int)(d+0)];
                b = stops[(int)(d+1)];
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
      i *= 255.0;
      double f = i % 1;
      LXFloat4 a = colors.get(((int)(i))&0xFF);
      LXFloat4 b = colors.get(((int)(i)+1)&0xFF);
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
      i *= 255.0;
      double f = i % 1;
      LXFloat4 a = colors.get((int)(i)&0xFF);
      LXFloat4 b = colors.get((int)(i+1)&0xFF);
      return a.lerp(b, f);
  }
  
  public LXFloat4 clamp(double i) {
      if (i <= 0.0) {
          return colors.get(0);
      }
      if (i >= 1.0) {
          return colors.get(colors.size()-1);
      }
      i *= 255.0;
      double f = i % 1;
      LXFloat4 a = colors.get((int)(i)&0xFF);
      LXFloat4 b = colors.get((int)(i+1)&0xFF);
      return a.lerp(b, f);
  }

  List<LXFloat4> colors;
}
