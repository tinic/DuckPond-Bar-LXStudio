/*
Copyright 2019 Tinic Uro

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
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
      new BarTop("192.168.1.148",0,0),
      new BarTop("192.168.1.148",-340*0.015,0)
    };
    
    return new DuckPondBar(fixtures);
  }
  
   List<BarTop> barTop() {
    ArrayList<BarTop> tops = new ArrayList<>();
    for (int c = 0; c < this.fixtures.size(); c++) {
      LXFixture fixture = this.fixtures.get(c);
      if (fixture instanceof BarTop) {
        tops.add((BarTop)fixture);
      }
    }
    return tops;
  }
 
  private DuckPondBar(LXFixture[] fixtures) {
    super(fixtures);
  }
  
}
