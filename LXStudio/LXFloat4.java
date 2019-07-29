package org.tinic.duckpondbar;

import heronarts.lx.model.LXPoint;

public class LXFloat4 {
  
  	static public double standard_gamma = 2.7;
  
    public double x = 0.0;
    public double y = 0.0;
    public double z = 0.0;
    public double w = 0.0;
  
    public LXFloat4() { 
    }

    public LXFloat4(LXPoint p) { 
      x = p.x;
      y = p.y;
      z = p.z;
      w = 0.0;
    }

	//
	// HEX color
	//
    public LXFloat4(int col) {
      x = (double)((col >> 16) & 0xFF) / 255.0; 
      y = (double)((col >>  8) & 0xFF) / 255.0; 
      z = (double)((col >>  0) & 0xFF) / 255.0; 
      w = 0.0; 
    }

	//
	// HEX color + alpha
	//
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
        w = 0.0;
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

    static public LXFloat4 add(LXFloat4 a,LXFloat4 b) {
        return new LXFloat4(a.x + b.x, a.y + b.y, a.z + b.z, a.w + b.w);
    }
  
    public LXFloat4 sub(LXFloat4 b) {
        return new LXFloat4(this.x - b.x, this.y - b.y, this.z - b.z, this.w - b.w);
    }

    static public LXFloat4 sub(LXFloat4 a, LXFloat4 b) {
        return new LXFloat4(a.x - b.x, a.y - b.y, a.z - b.z, a.w - b.w);
    }

    public LXFloat4 mul(LXFloat4 b) {
        return new LXFloat4(this.x * b.x, this.y * b.y, this.z * b.z, this.w * b.w);
    }

    static public LXFloat4 mul(LXFloat4 a, LXFloat4 b) {
        return new LXFloat4(a.x * b.x, a.y * b.y, a.z * b.z, a.w * b.w);
    }

    public LXFloat4 div(LXFloat4 b) {
        return new LXFloat4(this.x / b.x, this.y / b.y, this.z / b.z, this.w / b.w);
    }

    static public LXFloat4 div(LXFloat4 a, LXFloat4 b) {
        return new LXFloat4(a.x / b.x, a.y / b.y, a.z / b.z, a.w / b.w);
    }

    public LXFloat4 mul(double mul) {
        return new LXFloat4(this.x * mul, this.y * mul, this.z * mul, this.w  * mul);
    }

    static public LXFloat4 mul(LXFloat4 a, double mul) {
        return new LXFloat4(a.x * mul, a.y * mul, a.z * mul, a.w  * mul);
    }

    public LXFloat4 div(double div) {
        return new LXFloat4(this.x / div, this.y / div, this.z / div, this.w / div);
    }

    static public LXFloat4 div(LXFloat4 a, double div) {
        return new LXFloat4(a.x / div, a.y / div, a.z / div, a.w / div);
    }

    public double len() {
        return Math.sqrt(x*x + y*y + z*z);
    }

    static public double len(LXFloat4 a) {
        return Math.sqrt(a.x*a.x + a.y*a.y + a.z*a.z);
    }
    
    public double dist(LXFloat4 b) {
        double xd = Math.abs(this.x-b.x);
        double yd = Math.abs(this.y-b.y);
        double zd = Math.abs(this.z-b.z);
        return Math.sqrt(xd*xd + yd*yd + zd*zd);
    }

    static double dist(LXFloat4 a, LXFloat4 b) {
        double xd = Math.abs(a.x-b.x);
        double yd = Math.abs(a.y-b.y);
        double zd = Math.abs(a.z-b.z);
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

    public LXFloat4 gamma(double v) {
        return new LXFloat4(
          Math.pow(this.x, v),
          Math.pow(this.y, v),
          Math.pow(this.z, v),
          Math.pow(this.w, v));
    }

    static public LXFloat4 gamma(LXFloat4 a, double v) {
        return new LXFloat4(
          Math.pow(a.x, v),
          Math.pow(a.y, v),
          Math.pow(a.z, v),
          Math.pow(a.w, v));
    }
    
    public LXFloat4 gamma() {
        return new LXFloat4(
          Math.pow(this.x, standard_gamma),
          Math.pow(this.y, standard_gamma),
          Math.pow(this.z, standard_gamma),
          Math.pow(this.w, standard_gamma));
    }

    static public LXFloat4 gamma(LXFloat4 a) {
        return new LXFloat4(
          Math.pow(a.x, standard_gamma),
          Math.pow(a.y, standard_gamma),
          Math.pow(a.z, standard_gamma),
          Math.pow(a.w, standard_gamma));
    }
    
    static public LXFloat4 zero() {
        return new LXFloat4(
          0,
          0,
          0,
          0);
    }

    public LXFloat4 min(LXFloat4 b) {
        return new LXFloat4(
          Math.min(this.x, b.x),
          Math.min(this.y, b.y),
          Math.min(this.z, b.z),
          Math.min(this.w, b.w));
    }

    static public LXFloat4 min(LXFloat4 a, LXFloat4 b) {
        return new LXFloat4(
          Math.min(a.x, b.x),
          Math.min(a.y, b.y),
          Math.min(a.z, b.z),
          Math.min(a.w, b.w));
    }

    public LXFloat4 max(LXFloat4 b) {
        return new LXFloat4(
          Math.max(this.x, b.x),
          Math.max(this.y, b.y),
          Math.max(this.z, b.z),
          Math.max(this.w, b.w));
    }

    static public LXFloat4 max(LXFloat4 a, LXFloat4 b) {
        return new LXFloat4(
          Math.max(a.x, b.x),
          Math.max(a.y, b.y),
          Math.max(a.z, b.z),
          Math.max(a.w, b.w));
    }

    public LXFloat4 abs() {
        return new LXFloat4(
          Math.abs(this.x),
          Math.abs(this.y),
          Math.abs(this.z),
          Math.abs(this.w));
    }

    static public LXFloat4 abs(LXFloat4 a) {
        return new LXFloat4(
          Math.abs(a.x),
          Math.abs(a.y),
          Math.abs(a.z),
          Math.abs(a.w));
    }

    public LXFloat4 clamp() {
        return new LXFloat4(
          Math.min(Math.max(this.x, 0.0), 1.0),
          Math.min(Math.max(this.y, 0.0), 1.0),
          Math.min(Math.max(this.z, 0.0), 1.0),
          Math.min(Math.max(this.w, 0.0), 1.0));
    }

    static public LXFloat4 clamp(LXFloat4 a) {
        return new LXFloat4(
          Math.min(Math.max(a.x, 0.0), 1.0),
          Math.min(Math.max(a.y, 0.0), 1.0),
          Math.min(Math.max(a.z, 0.0), 1.0),
          Math.min(Math.max(a.w, 0.0), 1.0));
    }

    public LXFloat4 lerp(LXFloat4 b, double v) {
        return new LXFloat4(
          this.x * (1.0 - v) + b.x * v, 
          this.y * (1.0 - v) + b.y * v, 
          this.z * (1.0 - v) + b.z * v, 
          this.w * (1.0 - v) + b.w * v);
    }

    static public LXFloat4 lerp(LXFloat4 a, LXFloat4 b, double v) {
        return new LXFloat4(
          a.x * (1.0 - v) + b.x * v, 
          a.y * (1.0 - v) + b.y * v, 
          a.z * (1.0 - v) + b.z * v, 
          a.w * (1.0 - v) + b.w * v);
    }

    public double dot(LXFloat4 b) {
        return this.x * b.x + this.y * b.y + this.z * b.z + this.w * b.w;
    }

    static public double dot(LXFloat4 a, LXFloat4 b) {
        return a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w;
    }
    
    public LXFloat4 normalize() {
    	return this.div(this.len());
    }

    static public LXFloat4 normalize(LXFloat4 a) {
    	return a.div(a.len());
    }

};
