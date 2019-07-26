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
