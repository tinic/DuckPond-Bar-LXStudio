package org.tinic.duckpondbar;

import heronarts.lx.LX;
import heronarts.lx.model.LXModel;

import org.tinic.duckpondbar.DuckPondBar;
import org.tinic.duckpondbar.BarPattern;
import org.tinic.duckpondbar.NetworkSetup;

import java.io.File;

public class DuckPondBarHeadless {
  public static void main(String[] args) {
    try {
      LXModel model = DuckPondBar.create();
      LX lx = new LX(model);
      lx.registerPattern(BarPattern.class);

      NetworkSetup.setup(lx);

      if (args.length > 0) {
        lx.openProject(new File(args[0]));
      }

      lx.engine.start();
    } catch (Exception x) {
      System.err.println(x.getLocalizedMessage());
    }
  }
}
