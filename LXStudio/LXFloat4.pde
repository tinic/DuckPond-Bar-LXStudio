
public static class LXFloat4 {
  
    double x = 0.0;
    double y = 0.0;
    double z = 0.0;
    double w = 1.0;
  
    public LXFloat4() { 
    }

    public LXFloat4(LXPoint p) { 
      x = p.x;
      y = p.y;
      z = p.z;
      w = 1.0;
    }

    public LXFloat4(int col) {
      x = (double)((col >> 16) & 0xFF) / 255.0; 
      y = (double)((col >>  8) & 0xFF) / 255.0; 
      z = (double)((col >>  0) & 0xFF) / 255.0; 
      w = 1.0; 
    }

    public LXFloat4(int col, double alpha) {
      x = (double)((col >> 16) & 0xFF) / 255.0; 
      y = (double)((col >>  8) & 0xFF) / 255.0; 
      z = (double)((col >>  0) & 0xFF) / 255.0; 
      w = alpha;
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
    
    public double len() {
        return Math.sqrt(x*x + y*y + z*z);
    }

    public double len(LXFloat4 b) {
        double xd = Math.abs(this.x-b.x);
        double yd = Math.abs(this.y-b.y);
        double zd = Math.abs(this.z-b.z);
        return Math.sqrt(xd*xd + yd*yd + zd*zd);
    }

    public static LXFloat4 hsv(double h, double s, double v) {

      int rd = (int)( 6.0 * h );
      
      double f = h * 6.0 - (double)rd;
      double p = v * (1.0 - s);
      double q = v * (1.0 - f * s);
      double t = v * (1.0 - (1.0 - f) * s);
  
      double r = 0.0;
      double g = 0.0;
      double b = 0.0;
      switch ( rd  % 6 ) {
        case 0: r = v; g = t; b = p; break;
        case 1: r = q; g = v; b = p; break;
        case 2: r = p; g = v; b = t; break;
        case 3: r = p; g = q; b = v; break;
        case 4: r = t; g = p; b = v; break;
        case 5: r = v; g = p; b = q; break;
      }
      return new LXFloat4(r, g, b, 1.0);
    }
    
    public LXFloat4 gamma() {
        return new LXFloat4(
          Math.pow(this.x, 2.7),
          Math.pow(this.y, 2.7),
          Math.pow(this.z, 2.7),
          Math.pow(this.w, 2.7));
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
