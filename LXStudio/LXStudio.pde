/** 
 * By using LX Studio, you agree to the terms of the LX Studio Software
 * License and Distribution Agreement, available at: http://lx.studio/license
 *
 * Please note that the LX license is not open-source. The license
 * allows for free, non-commercial use.
 *
 * HERON ARTS MAKES NO WARRANTY, EXPRESS, IMPLIED, STATUTORY, OR
 * OTHERWISE, AND SPECIFICALLY DISCLAIMS ANY WARRANTY OF
 * MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR A PARTICULAR
 * PURPOSE, WITH RESPECT TO THE SOFTWARE.
 */
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Arrays;

import org.tinic.duckpondbar.DuckPondBar;
import org.tinic.duckpondbar.BarPattern;
import org.tinic.duckpondbar.NetworkSetup;

heronarts.lx.studio.LXStudio lx;

final static boolean MULTITHREADED = true;
final static boolean RESIZABLE = true;

void setup() {
  size(1024, 720, P3D);
  lx = new heronarts.lx.studio.LXStudio(this, DuckPondBar.create(), MULTITHREADED);
  lx.ui.setResizable(RESIZABLE);
}

void initialize(final heronarts.lx.studio.LXStudio lx, heronarts.lx.studio.LXStudio.UI ui) {
  lx.registerPattern(BarPattern.class);
  NetworkSetup.setup(lx);
}

void draw() {
  // All is handled by LX Studio
}
