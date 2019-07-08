import java.util.List;
import java.lang.Math;
import java.util.Random;
import java.util.Iterator;
import java.util.Collections;

public static class LXFloat4 {
  
    double x = 0.0;
    double y = 0.0;
    double z = 0.0;
    double w = 1.0;
  
    public LXFloat4() { 
    }

    public LXFloat4(double initX, double initY, double initZ) { 
        x = initX;
        y = initY;
        z = initZ;
        w = 1.0;
    }

    public LXFloat4(double initX, double initY, double initZ, double initW) { 
        x = initX;
        y = initY;
        z = initZ;
        w = initW;
    }

    public LXFloat4 add4(double addX, double addY, double addZ, double addW) {
        return new LXFloat4(this.x + addX, this.y + addY, this.z + addZ, this.w + addW);
    }

    public LXFloat4 sub4(double subX, double subY, double subZ, double subW) {
        return new LXFloat4(this.x - subX, this.y - subY, this.z - subZ, this.w - subW);
    }

    public LXFloat4 mul4(double mulX, double mulY, double mulZ, double mulW) {
        return new LXFloat4(this.x * mulX, this.y * mulY, this.z * mulZ, this.w * mulW);
    }

    public LXFloat4 div4(double divX, double divY, double divZ, double divW) {
        return new LXFloat4(this.x / divX, this.y / divY, this.z / divZ, this.w / divW);
    }

    public LXFloat4 add(LXFloat4 b) {
        return new LXFloat4(this.x + b.x, this.y + b.y, this.z + b.z, this.w + b.w);
    }
  
    public LXFloat4 sub(LXFloat4 b) {
        return new LXFloat4(this.x - b.x, this.y - b.y, this.z - b.z, this.w - b.w);
    }

    public LXFloat4 mul(LXFloat4 b) {
        return new LXFloat4(this.x * b.x, this.y * b.y, this.z * b.z, this.w * b.w);
    }

    public LXFloat4 div(LXFloat4 b) {
        return new LXFloat4(this.x / b.x, this.y / b.y, this.z / b.z, this.w / b.w);
    }

    public LXFloat4 mul(double mul) {
        return new LXFloat4(this.x * mul, this.y * mul, this.z * mul, this.w  * mul);
    }

    public LXFloat4 div(double div) {
        return new LXFloat4(this.x / div, this.y / div, this.z / div, this.w / div);
    }
    
    public void zero() {
        x = 0;
        y = 0;
        z = 0;
        w = 0;
    }

    public LXFloat4 min(LXFloat4 b) {
        return new LXFloat4(
          Math.min(this.x, b.x),
          Math.min(this.y, b.y),
          Math.min(this.z, b.z),
          Math.min(this.w, b.w));
    }

    public LXFloat4 max(LXFloat4 b) {
        return new LXFloat4(
          Math.max(this.x, b.x),
          Math.max(this.y, b.y),
          Math.max(this.z, b.z),
          Math.max(this.w, b.w));
    }

    public LXFloat4 abs() {
        return new LXFloat4(
          Math.abs(this.x),
          Math.abs(this.y),
          Math.abs(this.z),
          Math.abs(this.w));
    }

    public LXFloat4 clamp() {
        return new LXFloat4(
          Math.min(Math.max(this.x, 0.0), 1.0),
          Math.min(Math.max(this.y, 0.0), 1.0),
          Math.min(Math.max(this.z, 0.0), 1.0),
          Math.min(Math.max(this.w, 0.0), 1.0));
    }

    public LXFloat4 lerp(LXFloat4 b, double v) {
        return new LXFloat4(
          this.x * (1.0 - v) + b.x * v, 
          this.y * (1.0 - v) + b.y * v, 
          this.z * (1.0 - v) + b.z * v, 
          this.w * (1.0 - v) + b.w * v);
    }
};

@LXCategory("Form")
  public static class PlanePattern extends LXPattern {

  public enum Axis {
    X, Y, Z
  };

  public final EnumParameter<Axis> axis =
    new EnumParameter<Axis>("Axis", Axis.X)
    .setDescription("Which axis the plane is drawn across");

  public final CompoundParameter pos = new CompoundParameter("Pos", 0, 1)
    .setDescription("Position of the center of the plane");

  public final CompoundParameter wth = new CompoundParameter("Width", .4, 0, 1)
    .setDescription("Thickness of the plane");

  public PlanePattern(LX lx) {
    super(lx);
    addParameter("axis", this.axis);
    addParameter("pos", this.pos);
    addParameter("width", this.wth);
  }

  public void run(double deltaMs) {
    float pos = this.pos.getValuef();
    float falloff = 100 / this.wth.getValuef();
    float n = 0;
    for (LXPoint p : model.points) {
      switch (this.axis.getEnum()) {
      case X: 
        n = p.xn; 
        break;
      case Y: 
        n = p.yn; 
        break;
      case Z: 
        n = p.zn; 
        break;
      }
      colors[p.index] = LXColor.gray(max(0, 100 - falloff*abs(n - pos)));
    }
  }
}

@LXCategory("Color")
public static class RandomPattern extends LXPattern {

  Random rd = new Random(); // creating Random object

  public RandomPattern(LX lx) {
    super(lx);
  }

  public void run(double deltaMs) {
    for (LXPoint p : model.points) {
      colors[p.index] = LXColor.rgb((int)(rd.nextFloat()*255.0), (int)(rd.nextFloat()*255.0), (int)(rd.nextFloat()*255.0));
    } 
  }
}

@LXCategory("Color")
public static class Pattern1D extends LXPattern {

  double tm = 0.0;

  public Pattern1D(LX lx) {
    super(lx);
  }
  
  public LXFloat4 calc(double time, LXFloat4 pos) {
      double period = 10;
      
      pos.x += tm * 0.1;
      pos.y += tm * 0.1;
    
      double h = Math.abs(Math.sin(pos.x * Math.PI * period));
    
      pos.x = h;
      pos.y = h * 0.5;
      pos.z = h * 0.25;
    
      return pos.clamp();
  }

  public void run(double deltaMs) {
    tm += deltaMs * (1.0 / 1000.0);
    Fixture bar = (Fixture)((GridModel3D)lx.model).fixtures.get(0);

    int a = 0;
    for (LXPoint p : bar.front) {
      LXFloat4 f = calc(tm, new LXFloat4((double)a / (double)(bar.front.size()-1), 0.0, 0.0, 1.0));
      colors[p.index] = LXColor.rgb((int)(f.x*255.0), (int)(f.y*255.0), (int)(f.z*255.0));
      a++;
    } 
    
    int b = 0;
    for (LXPoint p : bar.back) {
      LXFloat4 f = calc(tm, new LXFloat4((double)b / (double)(bar.back.size()-1), 0.0, 0.0, 1.0));
      colors[p.index] = LXColor.rgb((int)(f.x*255.0), (int)(f.y*255.0), (int)(f.z*255.0));
      b++;
    } 
  }
}

@LXCategory("Color")
public static class GradientInterference extends Pattern1D {

  LXFloat4 colors[] = {
      new LXFloat4(0.0,0.0,1.0,0.0),
      new LXFloat4(0.0,0.4,1.0,0.0),

      new LXFloat4(1.0,1.0,0.0,0.0),
      new LXFloat4(0.0,0.0,1.0,0.0),

      new LXFloat4(0.0,0.0,0.0,0.0),
      new LXFloat4(1.0,1.0,1.0,0.0),
  };
  
  double strength[] = {
      1.0,
      0.2,
      0.3,
  };

  double scales[] = {
      10.0,
      10.0,
      20.0,
  };
  
  public GradientInterference(LX lx) {
    super(lx);
  }
  
  public double reflect(double v) {
      double f = v % 1.0;
      if (( ( (int)v ) & ( (int)1 ) ) == 1 ) {
          f = 1.0 - f;
      }
      return f;
  }
  
  @Override
  public LXFloat4 calc(double time, LXFloat4 pos) {
    
    double v = pos.x;
    
    pos.zero();

    pos = pos.add(colors[0].lerp(colors[1], reflect(v * scales[0])).mul(strength[0]));
    pos = pos.add(colors[2].lerp(colors[3], reflect(v * scales[1])).mul(strength[1]));
    pos = pos.add(colors[4].lerp(colors[5], reflect(v * scales[2])).mul(strength[2]));
    
    return pos.clamp();
  }
}

@LXCategory("Color")
public static class Pattern3D extends LXPattern {
  double tm = 0.0;

  public Pattern3D(LX lx) {
    super(lx);
  }
  
  public LXFloat4 calc(double time, LXFloat4 pos) {
      double period = 10;
      
      pos.x += tm * 0.1;
      pos.y += tm * 0.1;
    
      double h = Math.abs(Math.sin(pos.x * Math.PI * period) *
                          Math.sin(pos.y * Math.PI * period));
    
      pos.x = h;
      pos.y = h * 0.5;
      pos.z = h * 0.25;
    
      return pos.clamp();
  }

  public void run(double deltaMs) {
    tm += deltaMs * (1.0 / 1000.0);
    for (LXPoint p : model.points) {
      LXFloat4 f = calc(tm, new LXFloat4(p.xn, p.yn, p.zn, 1.0));
      colors[p.index] = LXColor.rgb((int)(f.x*255.0), (int)(f.y*255.0), (int)(f.z*255.0));
    } 
  }
}
