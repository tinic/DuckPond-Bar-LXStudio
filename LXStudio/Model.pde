import java.util.Collections;
import java.util.List;
import java.util.Arrays;

LXModel buildModel() {
  // A three-dimensional grid model
  return new GridModel3D();
}

public static class GridModel3D extends LXModel {
  public GridModel3D() {
    super(new Fixture());
  }
}

public static class Fixture extends LXAbstractFixture {
  
  public final List<LXPoint> front;
  public final List<LXPoint> back;

  Fixture() {
    List<LXPoint> front = new ArrayList<LXPoint>();
    List<LXPoint> back = new ArrayList<LXPoint>();

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
      front.add(pf);
    }

    float[] bar_leds_back = {
        -2.438,  1.828,-2.438,  1.812,-2.438,  1.795,-2.438,  1.778,-2.438,  1.761,-2.438,  1.745,-2.438,  1.728,-2.438,  1.711,-2.438,  1.695,-2.438,  1.678,-2.438,  1.661,
        -2.438,  1.644,-2.438,  1.628,-2.438,  1.611,-2.438,  1.594,-2.438,  1.577,-2.438,  1.561,-2.438,  1.544,-2.438,  1.527,-2.438,  1.511,-2.438,  1.494,-2.438,  1.477,-2.438,   1.46,-2.438,  1.444,-2.438,  1.427,-2.438,   1.41,-2.438,  1.394,
        -2.438,  1.377,-2.438,   1.36,-2.438,  1.343,-2.438,  1.327,-2.438,   1.31,-2.438,  1.293,-2.438,  1.276,-2.438,   1.26,-2.438,  1.243,-2.438,  1.226,-2.438,   1.21,-2.438,  1.193,-2.438,  1.176,-2.438,  1.159,-2.438,  1.143,-2.438,  1.126,
        -2.438,  1.109,-2.438,  1.093,-2.438,  1.076,-2.438,  1.059,-2.438,  1.042,-2.438,  1.026,-2.438,  1.009,-2.438,  0.992,-2.438,  0.975,-2.438,  0.959,-2.438,  0.942,-2.438,  0.925,-2.438,  0.909,-2.438,  0.892,-2.438,  0.875,-2.438,  0.858,
        -2.438,  0.842,-2.438,  0.825,-2.438,  0.808,-2.438,  0.792,-2.438,  0.775,-2.438,  0.758,-2.438,  0.741,-2.438,  0.725,-2.438,  0.708,-2.438,  0.691,-2.438,  0.674,-2.438,  0.658,-2.438,  0.641,-2.438,  0.624,-2.436,  0.609, -2.42,  0.609,
        -2.403,  0.609,-2.386,  0.609,-2.369,  0.609,-2.353,  0.609,-2.336,  0.609,-2.319,  0.609,-2.303,  0.609,-2.286,  0.609,-2.269,  0.609,-2.252,  0.609,-2.236,  0.609,-2.219,  0.609,-2.202,  0.609,-2.186,  0.609,-2.169,  0.609,-2.152,  0.609,
        -2.135,  0.609,-2.119,  0.609,-2.102,  0.609,-2.085,  0.609,-2.068,  0.609,-2.052,  0.609,-2.035,  0.609,-2.018,  0.609,-2.002,  0.609,-1.985,  0.609,-1.968,  0.609,-1.951,  0.609,-1.935,  0.609,-1.918,  0.609,-1.901,  0.609,-1.885,  0.609,
        -1.868,  0.609,-1.851,  0.609,-1.834,  0.609,-1.818,  0.609,-1.801,  0.609,-1.784,  0.609,-1.767,  0.609,-1.751,  0.609,-1.734,  0.609,-1.717,  0.609,-1.701,  0.609,-1.684,  0.609,-1.667,  0.609, -1.65,  0.609,-1.634,  0.609,-1.617,  0.609,
          -1.6,  0.609,-1.584,  0.609,-1.567,  0.609, -1.55,  0.609,-1.533,  0.609,-1.517,  0.609,  -1.5,  0.609,-1.483,  0.609,-1.466,  0.609, -1.45,  0.609,-1.433,  0.609,-1.416,  0.609,  -1.4,  0.609,-1.383,  0.609,-1.366,  0.609,-1.349,  0.609,
        -1.333,  0.609,-1.316,  0.609,-1.299,  0.609,-1.283,  0.609,-1.266,  0.609,-1.249,  0.609,-1.232,  0.609,-1.216,  0.609,-1.199,  0.609,-1.182,  0.609,-1.165,  0.609,-1.149,  0.609,-1.132,  0.609,-1.115,  0.609,-1.099,  0.609,-1.082,  0.609,
        -1.065,  0.609,-1.048,  0.609,-1.032,  0.609,-1.015,  0.609,-0.998,  0.609,-0.982,  0.609,-0.965,  0.609,-0.948,  0.609,-0.931,  0.609,-0.915,  0.609,-0.898,  0.609,-0.881,  0.609,-0.864,  0.609,-0.848,  0.609,-0.831,  0.609,-0.814,  0.609,
        -0.798,  0.609,-0.781,  0.609,-0.764,  0.609,-0.747,  0.609,-0.731,  0.609,-0.714,  0.609,-0.697,  0.609,-0.681,  0.609,-0.664,  0.609,-0.647,  0.609, -0.63,  0.609,-0.614,  0.609,-0.597,  0.609, -0.58,  0.609,-0.563,  0.609,-0.547,  0.609,
         -0.53,  0.609,-0.513,  0.609,-0.497,  0.609, -0.48,  0.609,-0.463,  0.609,-0.446,  0.609, -0.43,  0.609,-0.413,  0.609,-0.396,  0.609, -0.38,  0.609,-0.363,  0.609,-0.346,  0.609,-0.329,  0.609,-0.313,  0.609,-0.296,  0.609,-0.279,  0.609,
        -0.262,  0.609,-0.246,  0.609,-0.229,  0.609,-0.212,  0.609,-0.196,  0.609,-0.179,  0.609,-0.162,  0.609,-0.145,  0.609,-0.129,  0.609,-0.112,  0.609,-0.095,  0.609,-0.079,  0.609,-0.062,  0.609,-0.045,  0.609,-0.028,  0.609,-0.012,  0.609,
         0.004,  0.609, 0.021,  0.609, 0.038,  0.609, 0.054,  0.609, 0.071,  0.609, 0.088,  0.609, 0.104,  0.609, 0.121,  0.609, 0.138,  0.609, 0.155,  0.609, 0.171,  0.609, 0.188,  0.609, 0.205,  0.609, 0.221,  0.609, 0.238,  0.609, 0.255,  0.609,
         0.272,  0.609, 0.288,  0.609, 0.305,  0.609, 0.322,  0.609, 0.339,  0.609, 0.355,  0.609, 0.372,  0.609, 0.389,  0.609, 0.405,  0.609, 0.422,  0.609, 0.439,  0.609, 0.456,  0.609, 0.472,  0.609, 0.489,  0.609, 0.506,  0.609, 0.522,  0.609,
         0.539,  0.609, 0.556,  0.609, 0.573,  0.609, 0.589,  0.609, 0.606,  0.609, 0.623,  0.609,  0.64,  0.609, 0.656,  0.609, 0.673,  0.609,  0.69,  0.609, 0.706,  0.609, 0.723,  0.609,  0.74,  0.609, 0.757,  0.609, 0.773,  0.609,  0.79,  0.609,
         0.807,  0.609, 0.823,  0.609,  0.84,  0.609, 0.857,  0.609, 0.874,  0.609,  0.89,  0.609, 0.907,  0.609, 0.924,  0.609, 0.941,  0.609, 0.957,  0.609, 0.974,  0.609, 0.991,  0.609, 1.007,  0.609, 1.024,  0.609, 1.041,  0.609, 1.058,  0.609,
         1.074,  0.609, 1.091,  0.609, 1.108,  0.609, 1.124,  0.609, 1.141,  0.609, 1.158,  0.609, 1.175,  0.609, 1.191,  0.609, 1.208,  0.609, 1.225,  0.609, 1.242,  0.609, 1.258,  0.609, 1.275,  0.609, 1.292,  0.609, 1.308,  0.609, 1.325,  0.609,
         1.342,  0.609, 1.359,  0.609, 1.375,  0.609, 1.392,  0.609, 1.409,  0.609, 1.425,  0.609, 1.442,  0.609, 1.459,  0.609, 1.476,  0.609, 1.492,  0.609, 1.509,  0.609, 1.526,  0.609, 1.543,  0.609, 1.559,  0.609, 1.576,  0.609, 1.593,  0.609,
         1.609,  0.609, 1.626,  0.609, 1.643,  0.609,  1.66,  0.609, 1.676,  0.609, 1.693,  0.609,  1.71,  0.609, 1.726,  0.609, 1.743,  0.609,  1.76,  0.609, 1.777,  0.609, 1.793,  0.609,  1.81,  0.609, 1.827,  0.609, 1.844,  0.609,  1.86,  0.609,
         1.877,  0.609, 1.894,  0.609,  1.91,  0.609, 1.927,  0.609, 1.944,  0.609, 1.961,  0.609, 1.977,  0.609, 1.994,  0.609, 2.011,  0.609, 2.027,  0.609, 2.044,  0.609, 2.061,  0.609, 2.078,  0.609, 2.094,  0.609, 2.111,  0.609, 2.128,  0.609,
         2.145,  0.609, 2.161,  0.609, 2.178,  0.609, 2.195,  0.609, 2.211,  0.609, 2.228,  0.609, 2.245,  0.609, 2.262,  0.609, 2.278,  0.609, 2.295,  0.609, 2.312,  0.609, 2.328,  0.609, 2.345,  0.609, 2.362,  0.609, 2.379,  0.609, 2.395,  0.609,
         2.412,  0.609, 2.429,  0.609, 2.438,  0.617, 2.438,  0.633, 2.438,   0.65, 2.438,  0.667, 2.438,  0.684, 2.438,    0.7, 2.438,  0.717, 2.438,  0.734, 2.438,   0.75, 2.438,  0.767, 2.438,  0.784, 2.438,  0.801, 2.438,  0.817, 2.438,  0.834,
         2.438,  0.851, 2.438,  0.868, 2.438,  0.884, 2.438,  0.901, 2.438,  0.918, 2.438,  0.934, 2.438,  0.951, 2.438,  0.968, 2.438,  0.985, 2.438,  1.001, 2.438,  1.018, 2.438,  1.035, 2.438,  1.051, 2.438,  1.068, 2.438,  1.085, 2.438,  1.102,
         2.438,  1.118, 2.438,  1.135, 2.438,  1.152, 2.438,  1.169, 2.438,  1.185, 2.438,  1.202, 2.438,  1.219, 2.438,  1.219
    };

    for (int p = 0; p < bar_leds_back.length; p+=2) {
      LXPoint pb = new LXPoint(bar_leds_back[p+0], bar_leds_back[p+1], bar_height);
      addPoint(pb);
      back.add(pb);
    }
    
    this.front = Collections.unmodifiableList(front);
    this.back = Collections.unmodifiableList(back);
  } 
}
