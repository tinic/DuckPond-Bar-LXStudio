import java.util.Collections;
import java.util.List;
import java.util.Arrays;

public static class Umbrella  extends BarFixture {
  
  private Gradient rainbowGradient;

  public LXFloat4 calc(BarPattern.Effect effect, int index, double time, LXFloat4 glob_pos) { 
      switch (effect) {
          case Spring: {
            double x = (toLocal(glob_pos).x + 1.0) * 0.5 + Math.sin(time);
            double y = (toLocal(glob_pos).y + 1.0) * 0.5 + Math.cos(time);
            return rainbowGradient.reflect(x);
          }
          case Summer: {
            return glob_pos;    
          } 
          case Autum: {
            return glob_pos;    
          } 
          case Winter: {
            return glob_pos;    
          } 
      }
      return glob_pos;    
  }

  Umbrella(int id, String ip, double xl, double yl, double zl) {
    super(ip);

    LXFloat4[] rainbowGradient = {
       new LXFloat4(0.0, 1.0, 1.0, 0.00),
       new LXFloat4(1.0, 1.0, 1.0, 1.00)
    };

    this.rainbowGradient = new Gradient(rainbowGradient, Gradient.ColorMode.HSV);

    List<LXPoint> leds = new ArrayList<LXPoint>();
    for (int p = 0; p < 10; p++) {
      double xm = Math.sin((2.0 * Math.PI / 6.0) * p);
      double ym = Math.cos((2.0 * Math.PI / 6.0) * p);
      for (int q = 0; q < 10; q++) {
        double l = 0.36666;
        double o = 0.0333333;
        double f = (double)(((q&1) == 1) ? (10-q) : q) / 11.0;
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

public static class BarTop extends BarFixture {
  
  private Gradient springGradient;
  
  public LXFloat4 calc(BarPattern.Effect effect, int index, double time, LXFloat4 glob_pos) { 
      switch (effect) {
          case Spring: {
            double x = (toLocal(glob_pos).x + 1.0) * 0.5 + time;
            return springGradient.reflect(x);
          }
          case Summer: {
            return glob_pos;    
          } 
          case Autum: {
            return glob_pos;    
          } 
          case Winter: {
            return glob_pos;    
          } 
      }
      return glob_pos;    
  }
  
  BarTop(String ip) {
    super(ip);
    
    LXFloat4[] springGradient = {
       new LXFloat4(0x289877,0.00),
       new LXFloat4(0xd4e8c2,0.49),
       new LXFloat4(0xe2dda1,0.75),
       new LXFloat4(0xdea120,1.00)
    };

    this.springGradient = new Gradient(springGradient, Gradient.ColorMode.RGB);
  
    List<LXPoint> top_front = new ArrayList<LXPoint>();
    List<LXPoint> top_back = new ArrayList<LXPoint>();
    
    List<LXPoint> leds = new ArrayList<LXPoint>();

    float bar_height = 1.0;

    // bar top, all values in m
    float[] bar_leds_front = {
        -3.047,  1.828,-3.047,  1.812,-3.047,  1.795,-3.047,  1.778,-3.047,  1.761,-3.047,  1.745,-3.047,  1.728,-3.047,  1.711,-3.047,  1.695,-3.047,  1.678,-3.047,  1.661,-3.047,  1.645,-3.047,  1.628,-3.047,  1.611,-3.047,  1.594,-3.047,  1.578,
        -3.047,  1.561,-3.047,  1.544,-3.047,  1.528,-3.047,  1.511,-3.047,  1.494,-3.047,  1.477,-3.047,  1.461,-3.047,  1.444,-3.047,  1.427,-3.047,  1.411,-3.047,  1.394,-3.047,  1.377,-3.047,   1.36,-3.047,  1.344,-3.047,  1.327,-3.047,   1.31,
        -3.047,  1.294,-3.047,  1.277,-3.047,   1.26,-3.047,  1.244,-3.047,  1.227,-3.047,   1.21,-3.047,  1.193,-3.047,  1.177,-3.047,   1.16,-3.047,  1.143,-3.047,  1.127,-3.047,   1.11,-3.047,  1.093,-3.047,  1.076,-3.047,   1.06,-3.047,  1.043,
        -3.047,  1.026,-3.047,   1.01,-3.047,  0.993,-3.047,  0.976,-3.047,   0.96,-3.047,  0.943,-3.047,  0.926,-3.047,  0.909,-3.047,  0.893,-3.047,  0.876,-3.047,  0.859,-3.047,  0.843,-3.047,  0.826,-3.047,  0.809,-3.047,  0.792,-3.047,  0.776,
        -3.047,  0.759,-3.047,  0.742,-3.047,  0.726,-3.047,  0.709,-3.047,  0.692,-3.047,  0.676,-3.047,  0.659,-3.047,  0.642,-3.047,  0.625,-3.047,  0.609,-3.047,  0.592,-3.047,  0.575,-3.045,  0.559,-3.044,  0.542,-3.042,  0.525,-3.039,  0.509,
        -3.036,  0.492,-3.033,  0.476,-3.029,   0.46,-3.025,  0.444, -3.02,  0.428,-3.015,  0.412,-3.009,  0.396,-3.003,  0.381,-2.997,  0.365, -2.99,   0.35,-2.982,  0.335,-2.975,   0.32,-2.967,  0.305,-2.958,  0.291,-2.949,  0.277, -2.94,  0.263,
         -2.93,  0.249, -2.92,  0.236, -2.91,  0.223,-2.899,   0.21,-2.888,  0.198,-2.876,  0.186,-2.865,  0.174,-2.853,  0.162, -2.84,  0.151,-2.827,   0.14,-2.814,   0.13,-2.801,   0.12,-2.788,   0.11,-2.774,    0.1, -2.76,  0.091,-2.745,  0.083,
        -2.731,  0.074,-2.716,  0.067,-2.701,  0.059,-2.686,  0.052,-2.671,  0.046,-2.655,  0.039,-2.639,  0.034,-2.624,  0.028,-2.608,  0.024,-2.591,  0.019,-2.575,  0.015,-2.559,  0.012,-2.542,  0.009,-2.526,  0.006,-2.509,  0.004,-2.493,  0.002,
        -2.476,  0.001,-2.459,      0,-2.443,      0,-2.426,      0,-2.409,      0,-2.393,      0,-2.376,      0,-2.359,      0,-2.343,      0,-2.326,      0,-2.309,      0,-2.292,      0,-2.276,      0,-2.259,      0,-2.242,      0,-2.226,      0,
        -2.209,      0,-2.192,      0,-2.175,      0,-2.159,      0,-2.142,      0,-2.125,      0,-2.109,      0,-2.092,      0,-2.075,      0,-2.059,      0,-2.042,      0,-2.025,      0,-2.008,      0,-1.992,      0,-1.975,      0,-1.958,      0,
        -1.942,      0,-1.925,      0,-1.908,      0,-1.891,      0,-1.875,      0,-1.858,      0,-1.841,      0,-1.825,      0,-1.808,      0,-1.791,      0,-1.774,      0,-1.758,      0,-1.741,      0,-1.724,      0,-1.708,      0,-1.691,      0,
        -1.674,      0,-1.658,      0,-1.641,      0,-1.624,      0,-1.607,      0,-1.591,      0,-1.574,      0,-1.557,      0,-1.541,      0,-1.524,      0,-1.507,      0, -1.49,      0,-1.474,      0,-1.457,      0, -1.44,      0,-1.424,      0,
        -1.407,      0, -1.39,      0,-1.374,      0,-1.357,      0, -1.34,      0,-1.323,      0,-1.307,      0, -1.29,      0,-1.273,      0,-1.257,      0, -1.24,      0,-1.223,      0,-1.206,      0, -1.19,      0,-1.173,      0,-1.156,      0,
         -1.14,      0,-1.123,      0,-1.106,      0, -1.09,      0,-1.073,      0,-1.056,      0,-1.039,      0,-1.023,      0,-1.006,      0,-0.989,      0,-0.973,      0,-0.956,      0,-0.939,      0,-0.922,      0,-0.906,      0,-0.889,      0,
        -0.872,      0,-0.856,      0,-0.839,      0,-0.822,      0,-0.806,      0,-0.789,      0,-0.772,      0,-0.755,      0,-0.739,      0,-0.722,      0,-0.705,      0,-0.689,      0,-0.672,      0,-0.655,      0,-0.638,      0,-0.622,      0,
        -0.605,      0,-0.588,      0,-0.572,      0,-0.555,      0,-0.538,      0,-0.521,      0,-0.505,      0,-0.488,      0,-0.471,      0,-0.455,      0,-0.438,      0,-0.421,      0,-0.405,      0,-0.388,      0,-0.371,      0,-0.354,      0,
        -0.338,      0,-0.321,      0,-0.304,      0,-0.288,      0,-0.271,      0,-0.254,      0,-0.237,      0,-0.221,      0,-0.204,      0,-0.187,      0,-0.171,      0,-0.154,      0,-0.137,      0,-0.121,      0,-0.104,      0,-0.087,      0,
         -0.07,      0,-0.054,      0,-0.037,      0, -0.02,      0,-0.004,      0, 0.012,      0, 0.029,      0, 0.046,      0, 0.062,      0, 0.079,      0, 0.096,      0, 0.112,      0, 0.129,      0, 0.146,      0, 0.162,      0, 0.179,      0,
         0.196,      0, 0.213,      0, 0.229,      0, 0.246,      0, 0.263,      0, 0.279,      0, 0.296,      0, 0.313,      0,  0.33,      0, 0.346,      0, 0.363,      0,  0.38,      0, 0.396,      0, 0.413,      0,  0.43,      0, 0.447,      0,
         0.463,      0,  0.48,      0, 0.497,      0, 0.513,      0,  0.53,      0, 0.547,      0, 0.563,      0,  0.58,      0, 0.597,      0, 0.614,      0,  0.63,      0, 0.647,      0, 0.664,      0,  0.68,      0, 0.697,      0, 0.714,      0,
         0.731,      0, 0.747,      0, 0.764,      0, 0.781,      0, 0.797,      0, 0.814,      0, 0.831,      0, 0.847,      0, 0.864,      0, 0.881,      0, 0.898,      0, 0.914,      0, 0.931,      0, 0.948,      0, 0.964,      0, 0.981,      0,
         0.998,      0, 1.015,      0, 1.031,      0, 1.048,      0, 1.065,      0, 1.081,      0, 1.098,      0, 1.115,      0, 1.131,      0, 1.148,      0, 1.165,      0, 1.182,      0, 1.198,      0, 1.215,      0, 1.232,      0, 1.248,      0,
         1.265,      0, 1.282,      0, 1.299,      0, 1.315,      0, 1.332,      0, 1.349,      0, 1.365,      0, 1.382,      0, 1.399,      0, 1.416,      0, 1.432,      0, 1.449,      0, 1.466,      0, 1.482,      0, 1.499,      0, 1.516,      0,
         1.532,      0, 1.549,      0, 1.566,      0, 1.583,      0, 1.599,      0, 1.616,      0, 1.633,      0, 1.649,      0, 1.666,      0, 1.683,      0,   1.7,      0, 1.716,      0, 1.733,      0,  1.75,      0, 1.766,      0, 1.783,      0,
           1.8,      0, 1.816,      0, 1.833,      0,  1.85,      0, 1.867,      0, 1.883,      0,   1.9,      0, 1.917,      0, 1.933,      0,  1.95,      0, 1.967,      0, 1.984,      0,     2,      0, 2.017,      0, 2.034,      0,  2.05,      0,
         2.067,      0, 2.084,      0,   2.1,      0, 2.117,      0, 2.134,      0, 2.151,      0, 2.167,      0, 2.184,      0, 2.201,      0, 2.217,      0, 2.234,      0, 2.251,      0, 2.268,      0, 2.284,      0, 2.301,      0, 2.318,      0,
         2.334,      0, 2.351,      0, 2.368,      0, 2.384,      0, 2.401,      0, 2.418,      0, 2.435,      0, 2.451,      0, 2.468,      0, 2.485,  0.001, 2.501,  0.003, 2.518,  0.005, 2.534,  0.007, 2.551,   0.01, 2.567,  0.013, 2.584,  0.017,
           2.6,  0.021, 2.616,  0.026, 2.632,  0.031, 2.647,  0.037, 2.663,  0.043, 2.678,  0.049, 2.694,  0.056, 2.709,  0.063, 2.724,  0.071, 2.738,  0.079, 2.753,  0.087, 2.767,  0.096, 2.781,  0.105, 2.795,  0.115, 2.808,  0.125, 2.821,  0.135,
         2.834,  0.146, 2.847,  0.157, 2.859,  0.168, 2.871,   0.18, 2.882,  0.192, 2.894,  0.204, 2.904,  0.217, 2.915,   0.23, 2.925,  0.243, 2.935,  0.256, 2.945,   0.27, 2.954,  0.284, 2.962,  0.298, 2.971,  0.313, 2.979,  0.328, 2.986,  0.343,
         2.993,  0.358,     3,  0.373, 3.006,  0.388, 3.012,  0.404, 3.017,   0.42, 3.022,  0.436, 3.027,  0.452, 3.031,  0.468, 3.035,  0.484, 3.038,  0.501, 3.041,  0.517, 3.043,  0.534, 3.045,  0.551, 3.046,  0.567, 3.047,  0.584, 3.047,  0.601,
         3.048,  0.617, 3.048,  0.634, 3.048,  0.651, 3.048,  0.667, 3.048,  0.684, 3.048,  0.701, 3.048,  0.717, 3.048,  0.734, 3.048,  0.751, 3.048,  0.768, 3.048,  0.784, 3.048,  0.801, 3.048,  0.818, 3.048,  0.834, 3.048,  0.851, 3.048,  0.868,
         3.048,  0.885, 3.048,  0.901, 3.048,  0.918, 3.048,  0.935, 3.048,  0.951, 3.048,  0.968, 3.048,  0.985, 3.048,  1.001, 3.048,  1.018, 3.048,  1.035, 3.048,  1.052, 3.048,  1.068, 3.048,  1.085, 3.048,  1.102, 3.048,  1.118, 3.048,  1.135,
         3.048,  1.152, 3.048,  1.169, 3.048,  1.185, 3.048,  1.202, 3.048,  1.219,
    };

    for (int p = 0; p < bar_leds_front.length; p+=2) {
      LXPoint pf = new LXPoint(bar_leds_front[p+0], bar_leds_front[p+1], bar_height);
      addPoint(pf);
      top_front.add(pf);
      leds.add(pf);
    }

    float[] bar_leds_back = {
        -3.038,  1.828,-3.021,  1.828,-3.004,  1.828,-2.988,  1.828,-2.971,  1.828,-2.954,  1.828,-2.938,  1.828,-2.921,  1.828,-2.904,  1.828,-2.887,  1.828,-2.871,  1.828,-2.854,  1.828,-2.837,  1.828,-2.821,  1.828,-2.804,  1.828,-2.787,  1.828,
        -2.770,  1.828,-2.754,  1.828,-2.737,  1.828, -2.72,  1.828,-2.704,  1.828,-2.687,  1.828, -2.67,  1.828,-2.654,  1.828,-2.637,  1.828, -2.62,  1.828,-2.603,  1.828,-2.587,  1.828, -2.57,  1.828,-2.553,  1.828,-2.537,  1.828, -2.52,  1.828,
        -2.503,  1.828,-2.487,  1.828, -2.47,  1.828,-2.453,  1.828,-2.436,  1.828,-2.433,  1.815,-2.433,  1.799,-2.433,  1.782,-2.433,  1.765,-2.433,  1.749,-2.433,  1.732,-2.433,  1.715,-2.433,  1.699,-2.433,  1.682,-2.433,  1.665,-2.433,  1.648,
        -2.433,  1.632,-2.433,  1.615,-2.433,  1.598,-2.433,  1.582,-2.433,  1.565,-2.433,  1.548,-2.433,  1.531,-2.433,  1.515,-2.433,  1.498,-2.433,  1.481,-2.433,  1.465,-2.433,  1.448,-2.433,  1.431,-2.433,  1.415,-2.433,  1.398,-2.433,  1.381,
        -2.433,  1.364,-2.433,  1.348,-2.433,  1.331,-2.433,  1.314,-2.433,  1.298,-2.433,  1.281,-2.433,  1.264,-2.433,  1.248,-2.433,  1.231,-2.433,  1.214,-2.433,  1.197,-2.433,  1.181,-2.433,  1.164,-2.433,  1.147,-2.433,  1.131,-2.433,  1.114,
        -2.433,  1.097,-2.433,  1.081,-2.433,  1.064,-2.433,  1.047,-2.433,   1.03,-2.433,  1.014,-2.433,  0.997,-2.433,   0.98,-2.433,  0.964,-2.433,  0.947,-2.433,   0.93,-2.433,  0.913,-2.433,  0.897,-2.433,   0.88,-2.433,  0.863,-2.433,  0.847,
        -2.433,   0.83,-2.433,  0.813,-2.433,  0.797,-2.433,   0.78,-2.433,  0.763,-2.433,  0.746,-2.433,   0.73,-2.433,  0.713,-2.433,  0.696,-2.433,   0.68,-2.433,  0.663,-2.433,  0.646,-2.433,   0.63,-2.433,  0.613, -2.42,  0.609,-2.403,  0.609,
        -2.386,  0.609, -2.37,  0.609,-2.353,  0.609,-2.336,  0.609,-2.319,  0.609,-2.303,  0.609,-2.286,  0.609,-2.269,  0.609,-2.253,  0.609,-2.236,  0.609,-2.219,  0.609,-2.202,  0.609,-2.186,  0.609,-2.169,  0.609,-2.152,  0.609,-2.136,  0.609,
        -2.119,  0.609,-2.102,  0.609,-2.086,  0.609,-2.069,  0.609,-2.052,  0.609,-2.035,  0.609,-2.019,  0.609,-2.002,  0.609,-1.985,  0.609,-1.969,  0.609,-1.952,  0.609,-1.935,  0.609,-1.919,  0.609,-1.902,  0.609,-1.885,  0.609,-1.868,  0.609,
        -1.852,  0.609,-1.835,  0.609,-1.818,  0.609,-1.802,  0.609,-1.785,  0.609,-1.768,  0.609,-1.752,  0.609,-1.735,  0.609,-1.718,  0.609,-1.701,  0.609,-1.685,  0.609,-1.668,  0.609,-1.651,  0.609,-1.635,  0.609,-1.618,  0.609,-1.601,  0.609,
        -1.584,  0.609,-1.568,  0.609,-1.551,  0.609,-1.534,  0.609,-1.518,  0.609,-1.501,  0.609,-1.484,  0.609,-1.468,  0.609,-1.451,  0.609,-1.434,  0.609,-1.417,  0.609,-1.401,  0.609,-1.384,  0.609,-1.367,  0.609,-1.351,  0.609,-1.334,  0.609,
        -1.317,  0.609,-1.301,  0.609,-1.284,  0.609,-1.267,  0.609, -1.25,  0.609,-1.234,  0.609,-1.217,  0.609,  -1.2,  0.609,-1.184,  0.609,-1.167,  0.609, -1.15,  0.609,-1.134,  0.609,-1.117,  0.609,  -1.1,  0.609,-1.083,  0.609,-1.067,  0.609,
         -1.05,  0.609,-1.033,  0.609,-1.017,  0.609,    -1,  0.609,-0.983,  0.609,-0.966,  0.609, -0.95,  0.609,-0.933,  0.609,-0.916,  0.609,  -0.9,  0.609,-0.883,  0.609,-0.866,  0.609, -0.85,  0.609,-0.833,  0.609,-0.816,  0.609,-0.799,  0.609,
        -0.783,  0.609,-0.766,  0.609,-0.749,  0.609,-0.733,  0.609,-0.716,  0.609,-0.699,  0.609,-0.683,  0.609,-0.666,  0.609,-0.649,  0.609,-0.632,  0.609,-0.616,  0.609,-0.599,  0.609,-0.582,  0.609,-0.566,  0.609,-0.549,  0.609,-0.532,  0.609,
        -0.516,  0.609,-0.499,  0.609,-0.482,  0.609,-0.465,  0.609,-0.449,  0.609,-0.432,  0.609,-0.415,  0.609,-0.399,  0.609,-0.382,  0.609,-0.365,  0.609,-0.348,  0.609,-0.332,  0.609,-0.315,  0.609,-0.298,  0.609,-0.282,  0.609,-0.265,  0.609,
        -0.248,  0.609,-0.232,  0.609,-0.215,  0.609,-0.198,  0.609,-0.181,  0.609,-0.165,  0.609,-0.148,  0.609,-0.131,  0.609,-0.115,  0.609,-0.098,  0.609,-0.081,  0.609,-0.065,  0.609,-0.048,  0.609,-0.031,  0.609,-0.014,  0.609, 0.001,  0.609,
         0.018,  0.609, 0.035,  0.609, 0.051,  0.609, 0.068,  0.609, 0.085,  0.609, 0.101,  0.609, 0.118,  0.609, 0.135,  0.609, 0.152,  0.609, 0.168,  0.609, 0.185,  0.609, 0.202,  0.609, 0.218,  0.609, 0.235,  0.609, 0.252,  0.609, 0.269,  0.609,
         0.285,  0.609, 0.302,  0.609, 0.319,  0.609, 0.335,  0.609, 0.352,  0.609, 0.369,  0.609, 0.385,  0.609, 0.402,  0.609, 0.419,  0.609, 0.436,  0.609, 0.452,  0.609, 0.469,  0.609, 0.486,  0.609, 0.502,  0.609, 0.519,  0.609, 0.536,  0.609,
         0.552,  0.609, 0.569,  0.609, 0.586,  0.609, 0.603,  0.609, 0.619,  0.609, 0.636,  0.609, 0.653,  0.609, 0.669,  0.609, 0.686,  0.609, 0.703,  0.609, 0.719,  0.609, 0.736,  0.609, 0.753,  0.609,  0.77,  0.609, 0.786,  0.609, 0.803,  0.609,
          0.82,  0.609, 0.836,  0.609, 0.853,  0.609,  0.87,  0.609, 0.887,  0.609, 0.903,  0.609,  0.92,  0.609, 0.937,  0.609, 0.953,  0.609,  0.97,  0.609, 0.987,  0.609, 1.003,  0.609,  1.02,  0.609, 1.037,  0.609, 1.054,  0.609,  1.07,  0.609,
         1.087,  0.609, 1.104,  0.609,  1.12,  0.609, 1.137,  0.609, 1.154,  0.609,  1.17,  0.609, 1.187,  0.609, 1.204,  0.609, 1.221,  0.609, 1.237,  0.609, 1.254,  0.609, 1.271,  0.609, 1.287,  0.609, 1.304,  0.609, 1.321,  0.609, 1.337,  0.609,
         1.354,  0.609, 1.371,  0.609, 1.388,  0.609, 1.404,  0.609, 1.421,  0.609, 1.438,  0.609, 1.454,  0.609, 1.471,  0.609, 1.488,  0.609, 1.505,  0.609, 1.521,  0.609, 1.538,  0.609, 1.555,  0.609, 1.571,  0.609, 1.588,  0.609, 1.605,  0.609,
         1.621,  0.609, 1.638,  0.609, 1.655,  0.609, 1.672,  0.609, 1.688,  0.609, 1.705,  0.609, 1.722,  0.609, 1.738,  0.609, 1.755,  0.609, 1.772,  0.609, 1.788,  0.609, 1.805,  0.609, 1.822,  0.609, 1.839,  0.609, 1.855,  0.609, 1.872,  0.609,
         1.889,  0.609, 1.905,  0.609, 1.922,  0.609, 1.939,  0.609, 1.955,  0.609, 1.972,  0.609, 1.989,  0.609, 2.006,  0.609, 2.022,  0.609, 2.039,  0.609, 2.056,  0.609, 2.072,  0.609, 2.089,  0.609, 2.106,  0.609, 2.123,  0.609, 2.139,  0.609,
         2.156,  0.609, 2.173,  0.609, 2.189,  0.609, 2.206,  0.609, 2.223,  0.609, 2.239,  0.609, 2.256,  0.609, 2.273,  0.609,  2.29,  0.609, 2.306,  0.609, 2.323,  0.609,  2.34,  0.609, 2.356,  0.609, 2.373,  0.609,  2.39,  0.609, 2.406,  0.609,
         2.423,  0.609,  2.44,  0.609, 2.443,  0.622, 2.443,  0.639, 2.443,  0.656, 2.443,  0.673, 2.443,  0.689, 2.443,  0.706, 2.443,  0.723, 2.443,  0.739, 2.443,  0.756, 2.443,  0.773, 2.443,  0.789, 2.443,  0.806, 2.443,  0.823, 2.443,   0.84,
         2.443,  0.856, 2.443,  0.873, 2.443,   0.89, 2.443,  0.906, 2.443,  0.923, 2.443,   0.94, 2.443,  0.956, 2.443,  0.973, 2.443,   0.99, 2.443,  1.007, 2.443,  1.023, 2.443,   1.04, 2.443,  1.057, 2.443,  1.073, 2.443,   1.09, 2.443,  1.107,
         2.443,  1.123, 2.443,   1.14, 2.443,  1.157, 2.443,  1.174, 2.443,   1.19, 2.443,  1.207, 2.448,  1.219, 2.465,  1.219, 2.482,  1.219, 2.498,  1.219, 2.515,  1.219, 2.532,  1.219, 2.548,  1.219, 2.565,  1.219, 2.582,  1.219, 2.599,  1.219,
         2.615,  1.219, 2.632,  1.219, 2.649,  1.219, 2.665,  1.219, 2.682,  1.219, 2.699,  1.219, 2.715,  1.219, 2.732,  1.219, 2.749,  1.219, 2.766,  1.219, 2.782,  1.219, 2.799,  1.219, 2.816,  1.219, 2.832,  1.219, 2.849,  1.219, 2.866,  1.219,
         2.883,  1.219, 2.899,  1.219, 2.916,  1.219, 2.933,  1.219, 2.949,  1.219, 2.966,  1.219, 2.983,  1.219, 2.999,  1.219, 3.016,  1.219, 3.033,  1.219, 3.033,  1.219
    };

    for (int p = 0; p < bar_leds_back.length; p+=2) {
      LXPoint pb = new LXPoint(bar_leds_back[p+0], bar_leds_back[p+1], bar_height);
      addPoint(pb);
      top_back.add(pb);
      leds.add(pb);
    }
    
    this.top_front = Collections.unmodifiableList(top_front);
    this.top_back = Collections.unmodifiableList(top_back);
    this.leds = Collections.unmodifiableList(leds);
  } 

  public final List<LXPoint> top_front;
  public final List<LXPoint> top_back;
}

public static class BarFixture  extends LXAbstractFixture {
  
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

public static class DuckPondBar extends LXModel {

  static DuckPondBar create() {

    LXFixture fixtures[] = {

      new BarTop("192.168.1.189"),
      
      new Umbrella(0, "10.42.0.10", -1.600, -0.500 + 1.000, 3.0000),
      new Umbrella(1, "10.42.0.11", -1.200,  0.500 + 1.000, 3.0000),
      new Umbrella(2, "10.42.0.12", -0.800, -0.500 + 1.000, 3.0000),
      new Umbrella(3, "10.42.0.13", -0.400,  0.500 + 1.000, 3.0000),
      new Umbrella(4, "10.42.0.14", -0.000, -0.500 + 1.000, 3.0000),
      new Umbrella(5, "10.42.0.15",  0.400,  0.500 + 1.000, 3.0000),
      new Umbrella(6, "10.42.0.16",  0.800, -0.500 + 1.000, 3.0000),
      new Umbrella(7, "10.42.0.17",  1.200,  0.500 + 1.000, 3.0000),
      new Umbrella(8, "10.42.0.18",  1.600, -0.500 + 1.000, 3.0000)
      
    };
    
    return new DuckPondBar(fixtures);
  }
  
  BarTop barTop() {
      LXFixture fixture = this.fixtures.get(0);
      return (BarTop)fixture;
  }
  
  List<Umbrella> umbrellas() {
      ArrayList<Umbrella> umbrellas = new ArrayList<Umbrella>();
      for (int c = 0; c < 9; c++) {
          LXFixture fixture = this.fixtures.get(c+1);
          umbrellas.add((Umbrella)fixture);
      }
      return umbrellas;
  }
  
  private DuckPondBar(LXFixture[] fixtures) {
    super(fixtures);
  }
  
}

LXModel buildModel() {
  return DuckPondBar.create();
}
