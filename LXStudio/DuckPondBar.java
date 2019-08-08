package org.tinic.duckpondbar;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Arrays;

import heronarts.lx.model.LXModel;
import heronarts.lx.model.LXFixture;

public class DuckPondBar extends LXModel {

  static public DuckPondBar create() {

    LXFixture fixtures[] = {

      new BarTop("10.42.0.2"),

      //
      // Physical layout:
      //
      //     11    13    15    17    19
      //  10    12    14    16    18    20
      //

      new Umbrella( 0, "10.42.0.180", -2.000, -0.500 + 1.000, 3.0000),
      new Umbrella( 1, "10.42.0.11", -1.600,  0.500 + 1.000, 3.0000),
      new Umbrella( 2, "10.42.0.12", -1.200, -0.500 + 1.000, 3.0000),
      new Umbrella( 3, "10.42.0.13", -0.800,  0.500 + 1.000, 3.0000),
      new Umbrella( 4, "10.42.0.14", -0.400, -0.500 + 1.000, 3.0000),
      new Umbrella( 5, "10.42.0.15",  0.000,  0.500 + 1.000, 3.0000),
      new Umbrella( 6, "10.42.0.16",  0.400, -0.500 + 1.000, 3.0000),
      new Umbrella( 7, "10.42.0.17",  0.800,  0.500 + 1.000, 3.0000),
      new Umbrella( 8, "10.42.0.18",  1.200, -0.500 + 1.000, 3.0000),
      new Umbrella( 9, "10.42.0.19",  1.600,  0.500 + 1.000, 3.0000),
      new Umbrella(10, "10.42.0.20",  2.000, -0.500 + 1.000, 3.0000)
    };
    
    return new DuckPondBar(fixtures);
  }
  
  BarTop barTop() {
    for (int c = 0; c < this.fixtures.size(); c++) {
      LXFixture fixture = this.fixtures.get(c);
      if (fixture instanceof BarTop) {
        return (BarTop)fixture;
      }
    }
    return null;
  }
  
  List<Umbrella> umbrellas() {
      ArrayList<Umbrella> umbrellas = new ArrayList<Umbrella>();
      for (int c = 0; c < this.fixtures.size(); c++) {
          LXFixture fixture = this.fixtures.get(c);
          if (fixture instanceof Umbrella) {
            umbrellas.add((Umbrella)fixture);
          }
      }
      return umbrellas;
  }
  
  private DuckPondBar(LXFixture[] fixtures) {
    super(fixtures);
  }
  
}
