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

import heronarts.lx.model.LXFixture;
import heronarts.lx.output.LXDatagram;

public class LightGuyDatagram extends LXDatagram {

  public final static int LIGHTGUY_PORT_0 = 0x1ED0;
  public final static int LIGHTGUY_PORT_1 = 0x1ED1;
  
  private final int[] pointIndices;

  private final int dataLength;
 
  public LightGuyDatagram(LXFixture fixture) {
    this(fixture, 0);
  }

  public LightGuyDatagram(int[] indexBuffer) {
    this(indexBuffer, 0);
  }
  
  public LightGuyDatagram(LXFixture fixture, int portNumber) {
    this(LXFixture.Utils.getIndices(fixture), portNumber);
  }

  public LightGuyDatagram(int[] indexBuffer, int portNumber) {
    this(indexBuffer, 3*indexBuffer.length, portNumber);
  }
 
  public LightGuyDatagram(LXFixture fixture, int dataLength, int portNumber) {
    this(LXFixture.Utils.getIndices(fixture), dataLength, portNumber);
  }

  public LightGuyDatagram(int[] indices, int dataLength, int portNumber) {
    super(dataLength);
    
    this.dataLength = dataLength;
    this.pointIndices = indices;

    setPort(portNumber == 0 ? LIGHTGUY_PORT_0 : LIGHTGUY_PORT_1);

    for (int i = 0; i < this.buffer.length; ++i) {
     this.buffer[i] = 0;
    }
  }
  
  @Override
  public void onSend(int[] colors) {
    copyPoints(colors, this.pointIndices, 0);
  }
  
}
